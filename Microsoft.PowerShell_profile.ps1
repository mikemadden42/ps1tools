Write-Output "`nVisual Studio 2019 Command Prompt variables setup starting." -ForegroundColor DarkGray
Push-Location "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\Tools"
cmd /c "VsDevCmd.bat -arch=amd64 &set" |
ForEach-Object {
    if ($_ -match "=") {
        $v = $_.split("="); Set-Item -Force -Path "ENV:\$($v[0])" -Value "$($v[1])"
    }
}
Pop-Location
Write-Output "`nVisual Studio 2019 Command Prompt variables setup complete." -ForegroundColor DarkGray