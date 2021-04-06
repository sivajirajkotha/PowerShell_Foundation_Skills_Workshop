#################################################################################

# External Commands

#################################################################################

Ping localhost 

sc.exe query Appinfo


Test-Connection localhost # Powershell Equivalent 

Get-Service -Name Appinfo # Powershell Equivalent



#################################################################################
# Cmdlet Syntax
#################################################################################


Get-Service -Name Bits -Verbose





##############################################################################
 #Switch Paramaters Usage

################################################################################

get-service -name BITS


Restart-Service -name Bits

Restart-Service -Name Bits -Verbose


Test-Connection -ComputerName localhost

Test-Connection -ComputerName localhost -Quiet



#################################################################################
#  Get Command Usage

#################################################################################



Get-command 

Get-Command -name *.exe # External command search (wildcard)

Get-Command -CommandType Application # External command search by command type

Get-Command -Verb get -noun service

Get-Command -Noun service

Get-Command *service*

Get-Command -name Get-Service



Show-Command

Show-Command -Name Get-Service


################################################################################

# Syntax Parameter Sets. 

################################################################################


Get-Command Get-Service -Syntax



Show-Command Get-Service 


Get-Help Get-Service -Full

Get-Help Get-Service -Parameter *


################################################################################

# Positional VS Named Parameters

################################################################################

Get-EventLog -LogName Application -Newest 5 

#or 

Get-eventlog Application -Newest 5 



Get-EventLog -LogName security -InstanceId 4663

#or

Get-EventLog  security 4663


Get-EventLog 4663 security # will not work



Get-EventLog -InstanceId 4663 -LogName Security #named parameters


#################################################################################

# Common Parameters

#################################################################################

Show-Command Get-Service

#

Write-Debug Get-Service -Debug  #debug

#

Stop-Service -Name BITS -Verbose #verbose

#


"testing the errors" | Out-File test1.txt #EA
 
 Remove-Item test1.txt  # EA

 #

Remove-Item test.txt -ErrorVariable z  # Error Variable


# 

Get-Process -ProcessName powershell -OutVariable pow  #out Variable

 
 #

 Get-Help about_CommonParameters


 ###############################################################################
 
 # Risk Mitigation Parameters

 ###############################################################################


Get-Process | Stop-Process -WhatIf

Get-Process | Stop-Process -Confirm


#################################################################################

# Command Termination and Line Continuation.

#################################################################################

Get-Process powershell ; Get-Service BITS

#OR

Get-Process powershell 
Get-Service BITS



#region 

#Line Continuation in Shell

#endregion


 

 
 ################################################################################
 
 # Built in Aliases


 ################################################################################


 Get-Alias

 Get-Service -Name BITS

 gsv -Name Bits




 ###############################################################################

 # User Defined Aliases

 ###############################################################################



 New-Alias -Name myfiles -Value Get-ChildItem # new alias

 myfiles #

Remove-Item Alias:\myfiles