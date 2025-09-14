function createFolder($numberOfFolders) {
    for ($i = 1; $i -le $numberOfFolders; $i++) {
        $folderName = "Folder_$i"
        if (-not (Test-Path -Path $folderName)) {
            New-Item -ItemType Directory -Path $folderName | Out-Null
            Write-Host "Created folder: $folderName"
        } else {
            Write-Host "Folder already exists: $folderName"
        }
    }   
}

function deleteFolder($filesToBeDeleted) {
    get-childitem -Recurse | Where-Object {$filesToBeDeleted.contains($_.Name)} | Remove-Item -Force -Recurse
    Write-Host "Deleted specified folders."
}


$filesToBeDeleted = @("Folder_1", "Folder_3", "Folder_5", "Folder_27", "Folder_30", "Folder_40", "Folder_50")
$numberOfFolders = 50

createFolder $numberOfFolders
deleteFolder $filesToBeDeleted

# check whether the folders are deleted or not

$count = 0
Get-ChildItem -Recurse | ForEach-Object{
    if ($filesToBeDeleted.Contains($_.Name)) {
        Write-Host "Folder not deleted: $($_.FullName)"
    } else {
        $count++
    }   
}
Write-Host "Total folders remaining: $count"
