# Inspired by Windows PowerShell Cookbook - 2nd Edition - 20.11 Program: Get the MD5 or SHA1 Hash of a File

param(
    $file,

    [ValidateSet("MD5", "SHA1", "SHA256", "SHA384", "SHA512")]
    $HashAlgorithm = "MD5"
)

$hashType = [Type] "System.Security.Cryptography.$HashAlgorithm"
$hasher = $hashType::Create()
$filename = (Resolve-Path $file).Path

$inputStream = New-Object IO.StreamReader $filename
$hashBytes = $hasher.ComputeHash($inputStream.BaseStream)
$inputStream.Close()

$builder = New-Object System.Text.StringBuilder
$hashBytes | ForEach-Object { [void] $builder.Append($_.ToString("X2")) }

$output = New-Object PsObject -Property @{
    Path          = ([IO.Path]::GetFileName($file));
    HashAlgorithm = $hashAlgorithm;
    HashValue     = $builder.ToString()
}

Write-Host $output.HashValue.ToLower(), $output.Path