Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; dust -b $_.Name }