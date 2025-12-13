# Powershell Script for Integration
param (
    [string]$Action
)

Write-Host "Executing Custom Script Runner with Action: $Action"

if ($Action -eq "test") {
    Write-Host "Test successful."
} else {
    Write-Host "Unknown action, but running anyway."
}
