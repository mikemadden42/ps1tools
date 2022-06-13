if (Test-Path -Path $HOME\AppData\Local\NuGet\Cache -PathType Container) {
    Write-Host "Cleaning NuGet Cache"
    Remove-Item -Force -Recurse $HOME\AppData\Local\NuGet\Cache\*
}

if (Test-Path -Path $HOME\AppData\Roaming\Slack\Cache -PathType Container ) {
    Write-Host "Cleaning Slack Cache"
    Remove-Item -Force -Recurse $HOME\AppData\Roaming\Slack\Cache\*
}