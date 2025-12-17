import logging

from services.integration_base import Integration
from services.service_registry import service_registry


class ScriptRunnerIntegration(Integration):
    async def async_setup(self):
        self.logger.info("Setting up Script Runner")

        # Register Service
        service_registry.register(
            domain=self.domain,
            service="run_script",
            service_func=self.run_script,
            schema={"script_name": str},
            description="Run a stored PowerShell script",
        )
        return True

    async def run_script(self, data: dict):
        script_name = data.get("script_name")
        self.logger.info(f"Running script: {script_name}")
        # Logic to call backend.services.script_engine would go here
        return {"status": "executed", "script": script_name}
