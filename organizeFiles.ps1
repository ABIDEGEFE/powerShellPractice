function createFiles () {
    param($extension)
    new-item -path . -ItemType Directory -name "fileOrganizaiton"

    for ($i = 0; $i -lt $extension.count; $i++) {
        for ($j = 0; $j -lt 5; $j++) {
            $file = "file$($j)" + $extension[$i]
          new-item -path ./fileOrganizaiton -ItemType File -name $file
        }
    }

}

function arrangeFiles () {
    param($sourceFolder)
    $files = Get-ChildItem $sourceFolder

    $files.foreach({
        $ext = [system.io.path]::GetExtension($_).TrimStart(".").ToLower()
        $targetFolder = join-path $sourceFolder $ext
        if (-not (test-path $targetFolder)) {
           new-item -path $targetFolder -ItemType Directory
        }

        move-item $_.FullName $targetFolder
    })
}


$extension = @(".py", ".txt", ".ps1")

createFiles -extension $extension
$sourceFolder = "./fileOrganizaiton"

arrangeFiles -sourceFolder $sourceFolder








