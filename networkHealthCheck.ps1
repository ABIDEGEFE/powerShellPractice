function pingServer () {
    param($servers)
    $result = @{}

    $servers.foreach({
        if(Test-Connection -ComputerName $_ -Count 1 -Quiet) {
           $result[$_] = "success"
        } else {
            $result[$_] = "fail"
        }
    })

    return $result
}

$servers = @("8.8.8.8", "microsoft.com", "1.1.1.1")
$result = pingServer $servers

$result.getenumerator() | Format-Table -AutoSize