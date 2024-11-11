param (
    [string]$AgentPath = "no paso nada",
    [string]$Pool,
    [string]$Url,
    [string]$Token,
    [string]$WinUser,
    [string]$WinPassword
)

"####################################################"
Write-Host "AgentPath: $AgentPath"
Write-Host "Pool: $Pool"
Write-Host "Url: $Url"
Write-Host "Token: **********************************"
Write-Host "Windows User: $WinUser"
Write-Host "Password: *************"
"####################################################"
" "
" "
" "
" "
& "$AgentPath\\config" --unattended `
    --pool "$Pool" `
    --url "$Url" `
    --auth "PAT" --token "$Token" `
    --windowsLogonAccount "$WinUser" --windowsLogonPassword "$WinPassword" `
    --runAsService --noRestart