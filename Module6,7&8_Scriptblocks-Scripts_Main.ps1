###########################################################################

#  Script Blocks

############################################################################


{2+2}


$a = 
{

param([int]$value1 , [int]$value2)



write-host $value1, $value2


}

$a | Get-Member

&{2+2}

&$a 5 9


#scriptblock2.ps1 demo
#combined script blocks demo



Invoke-Command -ScriptBlock {get-process} -ComputerName localhost

Get-command Measure-Command -Syntax

Measure-Command -Expression {get-process}


#############################################################################

# Functions 

#############################################################################

Function Get-computerinfo{


Get-WmiObject -Class win32_operatingsystem -ComputerName localhost



}

Get-ComputerInfo



# utility function series of commands


Function Get-computerinfo{


Get-WmiObject -Class win32_operatingsystem -ComputerName localhost |
    select Pscomputername, Manufacturer , caption, name |
        Format-list


}

get-computerinfo



# Parameters in a functions 


Function Get-computerinfo{

Param ($computername,$class)



Get-WmiObject -Class $class -ComputerName $computername |
    select Pscomputername, Manufacturer , caption, name |
        Format-list


}

Function Get-serviceinfo{

param ( $svc, $computername)

Get-Service -Name $svc -ComputerName $computername



}


#combined functions in a script file / module.



#####################################################################################

# Native Remoting

#####################################################################################

Get-Command -ParameterName computername

Get-command -Noun *Remoting*


# Powershell Remoting Interactive


Enter-PSSession -ComputerName localhost

Invoke-Command -ScriptBlock { Get-Process } -ComputerName localhost -Credential fareast\kared


# Persistent sessions.


$session = New-PSSession -ComputerName localhost -Credential fareast\kared

$session | gm

Enter-PSSession -Session $session

Get-Command -Noun *Pssession*

Get-PSSession 

Disconnect-PSSession -Session $session

Connect-PSSession -Session $session



############################## LAB ##########################################################


#############################################################################################

# Providers

#############################################################################################


Get-PSProvider

Get-PSDrive

New-PSDrive -Name HKCR -PSProvider Registry -Root Hkey_classes_root

Remove-PSDrive -Name HKCR

Get-Help Get-PSDrive -Full 



#############################################################################################

# Item Cmdlets

##############################################################################################


Get-Command -noun *item* 

Get-Item C:\Windows

Get-ChildItem C:\Windows

Invoke-Item C:\test1.txt


# Item Property Cmdlets


Get-Command -Noun *itemproperty*

Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PowerShell\1

Get-Item -Path HKLM:\Software\|
    New-ItemProperty -Name NoOfLocations -Value 3

Remove-ItemProperty HKLM:\SOFTWARE -Name NoOflocations


Get-ItemProperty C:\test1.txt | fl *

Set-ItemProperty C:\test1.txt -name isreadonly -Value $true


#########################################################################################

# Content Cmdlets

#########################################################################################

Get-Command -Noun *content*

Get-Content C:\test1.txt

Get-Content 'C:\servers.txt'
 
Get-Service -computername Get-Content 'C:\servers.txt'

Get-Service -computername (Get-Content 'C:\servers.txt')


# Path Cmdlets

Get-Command -noun path

Test-Path C:\test
Test-Path C:\notexist

Join-Path -Path c:\ -ChildPath Temp -Resolve

Split-Path C:\temp

Resolve-Path C:\Prog* -relative



# Location Cmdlets

Get-command -Noun *Location*

Get-Location

Set-Location C:\temp

#navigating through PSdrives


Get-PSDrive

Set-Location wsman:
Set-Location Alias:
Get-ChildItem
Set-Location variable:
Get-ChildItem


##################################LAB#################################################

######################################################################################

# Scripts

######################################################################################

Invoke-Item $home\documents\script.ps1
set-location $home\documents


# Excecution Policy

Get-command -Noun *Execution*

Get-ExecutionPolicy

Get-ExecutionPolicy -List

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy AllSigned


#############################################################################

# Script Execution 

#############################################################################




Set-Item -Path env:path -Value ($env:Path + ";c:\users\kared\documents")

Script.ps1


# Script Signing

New-SelfSignedCertificate -DnsName test.com -Type CodeSigning `
 -CertStoreLocation Cert:\CurrentUser\My

 Get-ChildItem Cert:\CurrentUser\MY

 # $Cert= Get-ChildItem Cert:\CurrentUser\MY\

 Set-AuthenticodeSignature .\script.ps1 $cert



 ###############################################################################

 # Comments

 ###############################################################################

 # This is a comment

 <#

 This is a block comment


 #>

 #This function will get the OS information of remote computers

 Function Get-OSinfo{ #Function opening 
 
 Param($computername)

 foreach($comp in $ computername){ # Forloop opening

 Get-WmiObject -Class win32_operatingsystem |
    Select Name,OSArchitecture,FreePhysicalMemory|
    Format-Table | Out-Host
  

 } # For loop closing
 
 
 }# Function closing




 #################################################################################

 # Param and Require statments. 

 #################################################################################


 #Requires -RunAsAdministrator
 #Requires -Version 3




 # Commands and Precedence. 



Get-Process

 Function Get-Process{
 
 Write-Host "this is not a native command of powershell that is executed"
 
 
 }
 
 Microsoft.PowerShell.Management\Get-Process -name System


 ############################ LAB ###############################################