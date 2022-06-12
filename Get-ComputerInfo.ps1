Get-Date -UFormat "%Y-%m-%d-%H-%M"


if ($IsWindows) {
    $env:COMPUTERNAME
    $env:NUMBER_OF_PROCESSORS
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