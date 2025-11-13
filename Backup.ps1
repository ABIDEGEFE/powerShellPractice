param(
    [string]$path = "./WebApsdfp",
    [string]$Destination = "./"
)

if( -not (test-path $path) ) {
    throw "The specified path $path does not exist."
    exit
}

$date = Get-Date -Format "yyyyMMdd"
$destinationFile = "$Destination/WebAppBackup_$date.zip"

if (-not (test-path $destinationFile)) {
    New-Item -ItemType File -Path $destinationFile -Force | Out-Null
}
else{
    throw "Backup file $destinationFile already exists."
    exit
}

Compress-Archive -path $path -DestinationPath "$destinationFile" -Force
Write-Host "Backup of $path completed at $destinationFile"