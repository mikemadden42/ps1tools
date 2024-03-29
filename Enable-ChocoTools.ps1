if (-Not $IsWindows) {
    Write-Host "This script only works on Windows."
    Exit 1
}

# https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install packages one at a time.
choco install 7zip -y
choco install ag -y
choco install bat -y
choco install brave -y
choco install bottom -y
choco install cmake -y
choco install curl -y
choco install dependencywalker -y
choco install fd -y
choco install git -y
choco install ghidra -y
choco install golang -y
choco install googlechrome -y
choco install keepassxc -y
choco install microsoft-windows-terminal -y
choco install ninja -y
choco install nmap -y
choco install notepadplusplus -y
choco install putty -y
choco install python -y
choco install ripgrep -y
choco install sd-cli -y
choco install slack -y
choco install sysinternals -y
choco install visualstudio2019-workload-vctools -y
choco install visualstudio2019buildtools -y
choco install vscode -y
choco install wget -y
choco install windows-sdk-10.1 -y
choco install winmerge -y
choco install wireshark -y

# Install packages all at once.
choco install 7zip ag bat brave bottom cmake curl dependencywalker fd git ghidra golang googlechrome keepassxc microsoft-windows-terminal ninja nmap notepadplusplus putty python ripgrep sd-cli slack sysinternals visualstudio2019-workload-vctools visualstudio2019buildtools vscode wget windows-sdk-10.1 winmerge wireshark
