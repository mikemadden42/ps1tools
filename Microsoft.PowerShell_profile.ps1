Write-Host "`nVisual Studio 2019 Command Prompt variables setup starting." -ForegroundColor DarkGray
Push-Location "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\Tools"
cmd /c "VsDevCmd.bat -arch=amd64 &set" |
ForEach-Object {
    if ($_ -match "=") {
        $v = $_.split("="); Set-Item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
    }
}
Pop-Location
Write-Host "`nVisual Studio 2019 Command Prompt variables setup complete." -ForegroundColor DarkGray