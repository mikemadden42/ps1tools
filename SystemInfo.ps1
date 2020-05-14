Get-Date -UFormat "%Y-%m-%d-%H-%M"

$PSVersionTable

Get-WmiObject Win32_ComputerSystem
Get-WmiObject Win32_Processor | Select-Object Name,NumberOfLogicalProcessors,MaxClockSpeed,L3CacheSize
Get-WmiObject Win32_PhysicalMemory | Select-Object Tag,Capacity,Speed
Get-PSDrive -PSProvider FileSystem
