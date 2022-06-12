if (-Not $IsWindows) {
    Write-Host "This script only works on Windows."
    Exit 1
}

Optimize-Volume -DriveLetter C -Analyze -Verbose