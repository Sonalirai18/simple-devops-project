$ErrorActionPreference = "Stop"

Write-Host "Starting containers..."
docker compose up -d --build

Write-Host "App should be available at:"
Write-Host "  http://localhost:5000/"
Write-Host "  http://localhost:5000/healthz"

Write-Host "Checking health..."
try {
  $health = Invoke-RestMethod -Uri "http://localhost:5000/healthz" -Method GET -TimeoutSec 10
  $health | ConvertTo-Json -Depth 5
} catch {
  Write-Host "Health check failed right now. Wait 5-10 seconds and refresh the URL in browser."
}

