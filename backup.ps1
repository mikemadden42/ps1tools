param(
    $backup_drive = "E:"
)

# user defined variables
$top_folder = $HOME
$user = $env:USERNAME
$os = Get-WmiObject Win32_OperatingSystem | Select-Object Caption
$caption = $os.Caption
$computer = $env:COMPUTERNAME.ToLower()
$date = Get-Date -UFormat "%Y-%m-%d-%H-%M-%S"
$backup_folder = "$backup_drive\backups\$computer-$user-$date"
if ($caption -match "Windows 7" -or $caption -match "Microsoft Windows 10 Pro") {
    $backup_directories = 'Contacts', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Links', 'Music', 'Pictures',
    'Saved Games', 'Searches', 'Videos', 'src'
}
elseif ($caption -match "XP Professional") {
    $backup_directories = 'Application Data', 'Desktop', 'Favorites', 'My Documents', 'Start Menu'
}

Write-Host -BackgroundColor Black -Foregroundcolor Yellow "`nCreating backup for: $backup_folder"

New-Item -ItemType directory -Path $backup_folder

foreach ($directory in $backup_directories) {
    Write-Host -BackgroundColor Black -Foregroundcolor Yellow "`nBacking up $directory..."
    Copy-Item "$top_folder/$directory" -Destination $backup_folder -Recurse
}

$backup_properties = Get-ChildItem -Recurse $backup_folder | Measure-Object -Sum -Property Length
$total_size = "{0:N2}" -f ($backup_properties.Sum / 1GB) + ' GB'

Write-Host -BackgroundColor Black -Foregroundcolor Yellow "`n$backup_folder : $total_size"