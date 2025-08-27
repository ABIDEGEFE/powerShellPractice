$criticalProcesses = @("ApplicationFrameHost", "aswidsagent", "Telegram")

$runningProcesses = Get-Process | Select-Object -ExpandProperty Name

$criticalProcesses.ForEach({
    if ($runningProcesses -notcontains $_) {
        Write-Output "$($_) is not running, let's start it."
       Start-Process $_
    }else {
        Write-Output "$($_) is running."
    }
})

