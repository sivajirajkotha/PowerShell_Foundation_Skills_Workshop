function Get-Uptime ($computername)
{
    $OS = Get-WmiObject win32_operatingsystem -ComputerName $computername -ErrorAction Continue
    $BootTime = $OS.ConvertToDateTime($OS.LastBootUpTime)
    $Uptime = $OS.ConvertToDateTime($OS.LocalDateTime) - $boottime
    $Display = "$computername Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
    Write-Host $Display
 }

