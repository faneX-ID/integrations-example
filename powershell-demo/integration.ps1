# integration.ps1
param (
    [string]$Action,
    [string]$Payload
)

# Parse Payload
$data = $null
if ($Payload) {
    $data = $Payload | ConvertFrom-Json
}

if ($Action -eq "get_system_info") {
    $info = @{
        "Hostname" = $env:COMPUTERNAME
        "OS" = $env:OS
        "Time" = (Get-Date).ToString()
    }
    return $info | ConvertTo-Json -Compress
}
elseif ($Action -eq "echo_message") {
    $msg = $data.message
    $response = @{
        "echo" = "You said: $msg"
    }
    return $response | ConvertTo-Json -Compress
}
else {
    Write-Error "Unknown Action: $Action"
    exit 1
}
