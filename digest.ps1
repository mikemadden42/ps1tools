# Inspired by Windows PowerShell Cookbook - 2nd Edition - 20.11 Program: Get the MD5 or SHA1 Hash of a File
$HashAlgorithm = "SHA256"
$hashType = [Type] "System.Security.Cryptography.$HashAlgorithm"
$hasher = $hashType::Create()
$file = "LICENSE-2.0.txt"
$filename = (Resolve-Path $file).Path

$inputStream = New-Object IO.StreamReader $filename
$hashBytes = $hasher.ComputeHash($inputStream.BaseStream)
$inputStream.Close()

$builder = New-Object System.Text.StringBuilder
$hashBytes | Foreach-Object { [void] $builder.Append($_.ToString("X2")) }

$output = New-Object PsObject -Property @{
    Path = ([IO.Path]::GetFileName($file));
    HashAlgorithm = $hashAlgorithm;
    HashValue = $builder.ToString()
}

Write-Host $output.HashValue.ToLower(), $output.Path