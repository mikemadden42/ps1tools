if (-Not $IsWindows) {
    Write-Host "This script only works on Windows."
    Exit 1
}

param(
    $backup_drive = "E:"
)

# user defined variables
$top_folder = $HOME
$user = $env:USERNAME
$os = Get-CimInstance Win32_OperatingSystem | Select-Object Caption
$caption = $os.Caption
$computer = $env:COMPUTERNAME.ToLower()
$date = Get-Date -UFormat "%Y-%m-%d-%H-%M-%S"
$backup_folder = "$backup_drive\backups\$computer-$user-$date"
if ($caption -match "Windows 7" -or $caption -match "Microsoft Windows 10 Pro") {
    $backup_directories = 'Contacts', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Links', 'Music', 'Pictures',
    'Saved Games', 'Searches', 'Videos', 'bin', 'src'
}
elseif ($caption -match "XP Professional") {
    $backup_directories = 'Application Data', 'Desktop', 'Favorites', 'My Documents', 'Start Menu'
}

Write-Output "`nCreating backup for: $backup_folder"

New-Item -ItemType directory -Path $backup_folder

foreach ($directory in $backup_directories) {
    Write-Output "`nBacking up $directory..."
    Copy-Item "$top_folder/$directory" -Destination $backup_folder -Recurse
}

$backup_properties = Get-ChildItem -Recurse $backup_folder | Measure-Object -Sum -Property Length
$total_size = "{0:N2}" -f ($backup_properties.Sum / 1GB) + ' GB'

Write-Output "`n$backup_folder : $total_size"