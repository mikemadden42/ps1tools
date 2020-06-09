# https://stackoverflow.com/questions/44703646/determine-the-os-version-linux-and-windows-from-powershell

if ($IsLinux) {
    Write-Host "Linux"
}
elseif ($IsMacOS) {
    Write-Host "macOS"
}
elseif ($IsWindows) {
    Write-Host "Windows"
}

if ($IsWindows -or $ENV:OS) {
    Write-Host "Windows"
}
else {
    Write-Host "Not Windows"
}