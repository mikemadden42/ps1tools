Get-Date -UFormat "%Y-%m-%d-%H-%M"

$env:COMPUTERNAME
$env:NUMBER_OF_PROCESSORS
$PSVersionTable

Get-CimInstance Win32_ComputerSystem
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfLogicalProcessors, MaxClockSpeed, L3CacheSize
Get-CimInstance Win32_PhysicalMemory | Select-Object Tag, Capacity, Speed
Get-PSDrive -PSProvider FileSystem