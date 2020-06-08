$computer = "."  
$products = Get-WmiObject -Class "Win32_Product" -Namespace "root\CIMV2" -ComputerName $computer

foreach ($package in $products) {
    Write-Output $package.Caption
}