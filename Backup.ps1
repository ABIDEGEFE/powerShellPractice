param(
    [string]$path,
    [string]$destination,
    [switch]$PathISWebApp
)

# how can I make this script to terminate if any error occurs?
# $ErrorActionPreference = "Stop"

Import-Module DoesNotExist -ErrorAction stop # terminate execution if module not found
Write-Host "This will not run"

try{
if ($pathIsWebApp){
    $extension = "$((get-childitem $path).Extension | sort-object -unique)" -match "\.html | \.js | \.css"
    if ($extension){
        Write-host "your script looks like a web application."
    }else{
        throw "The specified path does not appear to be a web application."
    }
}
else{
    # if I want to do something with a file instead of web app, the switch paramater help me to decide that.
    new-item -path $path -itemtype file -name "testfile.txt" -force | out-null
    exit 0
}
}
catch{
throw "An error occurred while validating the web application path: $($_.Exception)"
}


if ( -not (test-path $destination)){
    write-error "The specified destination $destination does not exist. $($_.exception.messag)"
}   

$date = Get-Date -Format "yyyyMMdd"
$destinationPath = join-path -path $destination -childpath "Backup_$date"

try{
   Compress-Archive -path $path -DestinationPath $destinationPath
}catch{
    write-error "An error occurred while creating the backup archive: $_.exception.message"
}

write-host "Backup completed successfully. Archive created at $destinationPath"