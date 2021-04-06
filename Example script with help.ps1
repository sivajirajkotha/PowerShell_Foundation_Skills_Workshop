function Get-Uptimee 
{
    <#
    .SYNOPSIS
    Get the uptime.

    .Description
    You can get the uptime of the provided server. You have to pass the server name while executing the command.
     
    .Example
    Get-Uptime computername
    #>
    param(
    [parameter(mandatory=$true)]
    [string[]]$servername
    )

    $OS = Get-WmiObject win32_operatingsystem -ComputerName $servername -ErrorAction Continue
    $BootTime = $OS.ConvertToDateTime($OS.LastBootUpTime)
    $Uptime = $OS.ConvertToDateTime($OS.LocalDateTime) - $boottime
    $Display = "$computername Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
    Write-Host $Display
 
 }

get-uptimee localhost