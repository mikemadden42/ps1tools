Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; Set-Location $_.Name; cargo -v clean; Write-Output "++++"; Set-Location .. }

Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; Set-Location $_.Name; git clean -fdx; git reset --hard HEAD; Write-Output "++++"; Set-Location .. }

Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; Set-Location $_.Name; git pull --rebase; Write-Output "++++"; Set-Location .. }

Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; Set-Location $_.Name; cargo build --release; Write-Output "++++"; Set-Location .. }

$user = $env:USERNAME
Get-ChildItem -path . | ForEach-Object { Write-Output $_.Name; Set-Location $_.Name; Copy-Item target\release\*.exe C:\Users\$user\Desktop\rusty-tools; Write-Output "++++"; Set-Location .. }