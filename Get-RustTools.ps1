$user = $env:USERNAME
Get-ChildItem -Path . | ForEach-Object { $exists = (Test-Path C:\Users\$user\Desktop\rusty-tools\$_.exe); if (-not $exists) { Write-Output $_.Name }; }