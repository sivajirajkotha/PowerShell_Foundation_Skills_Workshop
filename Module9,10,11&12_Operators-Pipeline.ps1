

###########################################################################

# Operators

###########################################################################

# Comparison Operators

Get-help about_Operators

10 -eq 10
10 -ne 5
10 -gt 5
10 -lt 5
5  -le 10

"Hello" -eq 'Hello'
"Hello" -ceq 'hello'
"Hello There" -gt "Hello"
"Hello There" -cgt 'hello there'


'Hello' -eq "Hel*"

$service = Get-Service -Name bits

$service.Status -eq 'running'

#Comparison Wildcards

"Hello There" -like "hello *"
"Hello There" -clike "hello *"

"Hello There" -notlike "hello *"
"Hello There" -cnotlike "hello *"


# Comparision using Regular expressions

Get-help about_Regular_Expressions

"PowerShell" -match '\w'

$Matches

"PowerShell" -match '\w+'

$Matches

"PowerShell5.0" -match '[a-z]'
$Matches

"PowerShell5.0" -match '[a-z]+'
$Matches

"PowerShell5.0" -match '[a-z]+\d+\.+\d'
$Matches


'somebody.someone@contoso.com' -match '[a-z]+\.+[a-z]+\@+contoso.com'

'somebody.someone@contoso.com' -match '([a-z]+)\.+[a-z]+\@+contoso.com'

'somebody.someone@contoso.com' -notmatch '[a-z]+\.+[a-z]+\@+contoso.com'

"Hello world" -cmatch "hello world"


#contains

"Hello World" -contains "World"
"Hello World" -notcontains "There"
"Hello World" -ccontains "world"
"Hello World" -contains "Worl*"

$contains = "Hello","There","World"
$contains

$contains -contains "World"


#Logical Operators

(10 -gt 5 ) -and (5 -gt 3)
(10 -gt 5 ) -and (5 -gt 7)

(10 -gt 5 ) -or (5 -gt 3)


(10 -gt 5 ) -xor (5 -gt 3)
(10 -gt 5 ) -Xor (5 -gt 6)

-not (5 -gt 3)

(5 –lt 3 –or 4 –lt 8) –and (5 –lt 10 –and 20 –gt 10)

"Hello World" -gt "Hello World" -and "Hello There" -eq "Hello There"

#Range Operators

1..5

-1..-5

'a'..'f'


#region DOB

$years = 2019..2029

foreach($year in $years){

Get-Date -Month 08 -Date 25 -Year $year | 
    Select @{n='week'; e= {$_.DayOfWeek}} ,@{name ='Year'; Exp={$_.year}}
}

#endregion DOB

#Charachter Range operators

Get-ChildItem C:\Windows\[a-f]* # Range of characters
Get-ChildItem C:\Windows\[af]* #specific characters

#Number Byte Multiplies

'2KB'
'2MB'
'2GB'
'2TB'

1GB / 1MB
1TB / 1GB


Get-WmiObject -Class win32_operatingsystem |
    select freephysicalmemory, Totalvirtualmemorysize, Pscomputername


#region Mulitipliers

    Get-WmiObject -Class win32_operatingsystem | 
    select @{n= 'Free Memory'; e= {$_.freephysicalmemory / 1MB}}, 
            @{n= 'Total VM' ; e= {$_.Totalvirtualmemorysize /1MB}}, Pscomputername |
                Format-Table


#endregion Multipliers



######################################################################################

# Pipeline

#######################################################################################

Get-Help about_Pipelines

Get-Service 

Get-Service | Out-Default

Get-Service -Name Bits, Schedule | Start-Service


Get-Service | Export-Csv c:\services.csv


Get-Service | Select-Object name, dependentservices,status |
    Format-Table | Out-File c:\services1.csv | Out-Default



# Object Cmdlets - Sort

Get-Process

Get-Process | Select-Object processname, cpu , id, handles

Get-Process | Select-Object processname, cpu, id, handles | Sort-Object cpu

Get-Process | Select-Object processname, cpu, id, handles | Sort-Object cpu -Descending


#Group Object



Get-Service | Select-Object name, starttype, status | Group-Object status 



#Measure Object

Get-ChildItem | Measure-Object

Get-ChildItem | Measure-Object -Property length -Minimum -Maximum -Average


#Compare object

$serverlist = 'server1', 'server2'

$listofservers = 'server1', 'server2', 'server3'

Compare-Object -ReferenceObject $serverlist -DifferenceObject $listofservers

Compare-Object -ReferenceObject $listofservers -DifferenceObject $serverlist

Compare-Object -ReferenceObject $serverlist -DifferenceObject $listofservers -IncludeEqual

Compare-Object -ReferenceObject $serverlist -DifferenceObject $listofservers -ExcludeDifferent -IncludeEqual


#Format Cmdlets

Get-Process 

Get-Process | Select-Object name,cpu,handles,vm,PM

Get-Process | Select-Object name,cpu,handles,vm,PM | Format-Table -AutoSize -Wrap


#Format list


Get-Process 

Get-Process | Select-Object name,cpu,handles,vm | Format-List

Get-service  | Format-List -Property *


#Format Wide

Get-Process |Format-Wide 

Get-Process |Select-Object name,pm,vm,handles,cpu -First 5 |Format-Wide -Column 3


#######################################################################################################


# Export and Import Cmdlets

#######################################################################################################

Get-Service | Export-Csv C:\test.csv

Get-Service | Export-Csv C:\services.csv -NoTypeInformation

Get-service | Select-Object name,status | Export-Csv C:\test.csv

Get-Service | Format-Table name, status| Export-Csv c:\testformat.csv

Get-Service | Format-Table name, status | Get-Member



#CliXml

Get-Service | Export-Csv C:\services.csv

Get-Service | Export-Clixml c:\procs.xml


#Import Cmdlet

Import-Csv C:\services.csv

$Csvimport = Import-Csv C:\services.csv


Import-Clixml C:\proc.xml

$xmlimport = Import-Clixml C:\proc.xml



#out Cmdlets

Get-Service
Get-Service | Out-Default

Get-Service | Out-File c:\serv.txt

Get-Service | Out-GridView

Get-Service | Out-Null

Get-Service | Out-Printer

Get-Service | Out-String | gm


###############################################################################


#Pipeline Variable

##############################################################################



Get-service | Where-Object{$_.name -eq "BITS"}
Get-service | Where-Object{$_.name -like "A*"}

Get-service | Where-Object name -Like A*


Get-service | Where-Object{$PSItem.name -like "A*"}


Get-service -PipelineVariable services| Where-Object{$services.Name -like "A*"} 


#Object Cmdlets

1..10| ForEach-Object {write-host "Hello"}

#region

Get-Content C:\Users\sikotha\Desktop\servers.txt| ForEach-Object {

$connection = Test-Connection -ComputerName $PSItem -Quiet

Write-Host $PSItem,$connection | Format-Table

}

#endregion


#Where object

Get-Service | Where-Object {$_.name -like "A*"}

Get-Service | Where-Object -Property name -Like  A*


Get-Service | Where-Object {$_.Status -eq "Stopped"}

Get-Service | where Status -eq "Stopped"

Get-Service | where {$_.Status -eq "Stopped" -and $_.name -like "B*"}

#Filtering Left

Measure-Command {Get-Process -name A*}

Measure-Command -Expression {Get-service | Where-Object{$_.name -like "A*"}}


#region

function My-Function {

    param([String[]]$computername)

        Begin{

         Write-Host "Executing Being Block" -ForegroundColor Red -BackgroundColor Green

        Clear-Content c:\temp\myfunction.txt -Force 
       

        }

Process{

        Foreach($Comp in $computername){

        Write-host "Executing Process Block" -ForegroundColor Red -BackgroundColor Green
        
        Get-WmiObject win32_operatingsystem -ComputerName $Comp | select Pscomputername,version,serialnumber |
        Format-List |Out-File C:\temp\myfunction.txt -Append

                }
    }

End{

       Write-Host "Executing End Block" -ForegroundColor Red -BackgroundColor Green

        notepad.exe c:\temp\myfunction.txt

           }

    }

#endregion


$computernames ='localhost'

ForEach-Object -Begin {Write-host "Starting the begin process block" -ForegroundColor 'Green'-BackgroundColor 'Red'}`
        -Process {Get-WmiObject win32_operatingsystem -ComputerName $computernames|
    select pscomputername,version,serialnumber |Out-File c:\temp\mycode.txt -Append} -End {  
    notepad.exe c:\temp\mycode.txt
    }







# Pipeline Inputs BYValue

Get-Process -Name notepad | Stop-process

Get-Process | Get-Member

Get-help Stop-Process -Full


# By Property

Get-Service | Stop-Process

Get-Service | Get-Member

Stop-Process | Get-Member

Import-Csv C:\temp\Servers.csv

Import-Csv C:\temp\Servers.csv | Get-Member

Import-Csv C:\temp\Servers.csv | Get-Service


Import-Csv C:\temp\Servers.csv | Get-Service -name *



#Arthmetic Operators

10+10
10-10
-10+2
10*10
10/10
10%4
100 -shl 2
100 -shr 2

[int]12.4
[int]12.6



#Assignment Operators

$integer = 100
$integer +=1
$integer
$integer -= 1
$integer *=2
$integer %=3
$integer++
$integer--




