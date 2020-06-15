# https://stackoverflow.com/questions/44703646/determine-the-os-version-linux-and-windows-from-powershell

if ($IsLinux) {
    Write-Output "Linux"
}
elseif ($IsMacOS) {
    Write-Output "macOS"
}
elseif ($IsWindows) {
    Write-Output "Windows"
}
elseif ($ENV:OS) {
    Write-Ouptut "Windows"
}
else {
    Write-Output "Not Linux, macOS, or Windows"
}