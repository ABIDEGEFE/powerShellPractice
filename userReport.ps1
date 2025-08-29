function userReport () {
    param($users)

    $report=@()

    $users.foreach({
        $obj = [PSCustomObject]@{
            user_name=$_.user_name 
            status=if ($_.status) {"active"} else {"inactive"}
            role=$_.role
        }
        $report += $obj
    })

    return $report
}

$users = @(
    @{user_name =  "user1"; status = $true; role="Admin"},
    @{user_name= "user2"; status = $false; role= "Guest"},
    @{user_name = "user3"; status = $true; role = "User"}
)


$report = userReport $users

$report.foreach(
    {
        Write-Output $_
    }
)
