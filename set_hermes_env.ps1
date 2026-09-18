param(
    [Parameter(Mandatory=$true)]
    [string]$RenderUrl,
    
    [Parameter(Mandatory=$true)]
    [string]$MasterKey
)

# 환경변수 영구 등록 (User scope)
[Environment]::SetEnvironmentVariable("OPENAI_BASE_URL", "$RenderUrl/v1", "User")
[Environment]::SetEnvironmentVariable("OPENAI_API_KEY", $MasterKey, "User")

Write-Host "SUCCESS: OPENAI_BASE_URL and OPENAI_API_KEY set for User session." -ForegroundColor Green
Write-Host "Render URL: $RenderUrl/v1"
Write-Host "To test, restart your terminal or run your Hermes commands."
