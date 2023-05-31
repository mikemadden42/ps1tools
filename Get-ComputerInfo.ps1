Get-Date -UFormat "%Y-%m-%d-%H-%M"

# https://powershell.org/2019/02/tips-for-writing-cross-platform-powershell-code/
if ( -not (Get-Variable -Name isWIndows -ErrorAction SilentlyContinue) ) {
    # We know we're on Windows PowerShell 5.1 or earlier
    $IsWindows = $true
    $IsLinux = $IsMacOS = $false
}

if ($IsWindows) {
    $env:NUMBER_OF_PROCESSORS
    $env:COMPUTERNAME
}
elseif ($IsMacOS) {
    sysctl -n hw.ncpu
    scutil --get LocalHostName
}
elseif ($IsLinux) {
    nproc
    hostname
}

$PSVersionTable

if ($IsWindows) {
    Get-CimInstance Win32_ComputerSystem
    Get-CimInstance Win32_Processor | Select-Object Name, NumberOfLogicalProcessors, MaxClockSpeed, L3CacheSize
    Get-CimInstance Win32_PhysicalMemory | Select-Object Tag, Capacity, Speed
}

Get-PSDrive -PSProvider FileSystem | Format-Table