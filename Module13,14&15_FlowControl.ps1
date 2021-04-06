############################################################################

# Loops

############################################################################


# While Loop


$a = 0
While ($a –lt 10) {$a; $a++}




$this = 10
$that = 20

while ($this -lt $that){

Write-host "Hello World" -ForegroundColor Green -BackgroundColor Red
$this++

}

#####################################################################################

#DoWhile

$a = 0
Do {$a; $a++} While ($a -lt 10)

#

$servernames = "Server1", "Server2", "Server5", "Server6" ,"Server 8"

$value = 0

do{
$value++
$Freeservername= "Server$value"

} while ($servernames.Contains($Freeservername))

$Freeservername




#####################################################################################

#Do Until


$servernames = "Server1", "Server5", "Server6" ,"Server 8"

$value = 0

do{
$value++
$Freeservername= "Server$value"

} Until (-not $servernames.Contains($Freeservername))

$Freeservername


##########################################################################


#For

# Syntax For (<init>; <condition>; <repeat>)


$i=0
for($i=1 ; $i -le 10; $i++){Write-Host $i}



# For Loop



$CourseModules = 10
$i=0

For($i=1; $i -le $CourseModules ; $i++){


$modules = "Module_$i"
$path= Join-Path C:\temp -ChildPath $modules

New-Item $path -ItemType Directory

}


Remove-Item -Path C:\temp\Module*


##################################################################################


# ForEach loop

$Services = Get-Service
'There are a total of ' + $Services.Count + ' services.'
ForEach ($Service in $Services)
{
    $Service.Name + ' is ' + $Service.Status
}



#################################################################################

$Comp = 'localhost','DC','Member'

foreach($C in $Comp){

$status = Test-Connection -ComputerName $c -Quiet

Write-Host "$c is online" -ForegroundColor Black -BackgroundColor Green

} 




################################################################################



# IF, ELSE


$Comp = 'localhost','DC','Member'

foreach($C in $Comp){

$status = Test-Connection -ComputerName $c -Quiet

If($status -eq $true){

Write-Host "$c is online" -ForegroundColor White -BackgroundColor Green

}else{

Write-Host "$c is offline" -ForegroundColor White -BackgroundColor RED

}

} 


$Process = Get-Process
    if ($Process.Count -gt 500){

        Write-Host "You have more than 100 Process Running"
                       
} elseif ($process.Count -lt 10){
    
    Write-Host "You have less than 10 process Running"

 } else{
    
    Write-Host "You have less than 100 process running"
    
    
 }
        
 
 
 Get-WmiObject win32_logicaldisk

 $Disks = Get-WmiObject win32_logicaldisk
 if($Disks.drivetype -eq 3){
 
 Write-Host " The drive type is fixed Volume"
 
 } elseif($disk.drivetype -eq 4){
 
 Write-Host 'The drive type is Mapped Network Drive'
 
  }else{
  
  Write-Host 'There is no disk'
  
  }

       
       
       

  ### Switch



 $number = 10
switch ($number)
{
   0 	   {write-Host “Its 0"}
   0 	   {write-Host “Its Zero"}
   2 	   {write-Host “Its 2"}
   default {Write-Host "Its not 2 or 0"}
} 

$filenames = (Get-ChildItem C:\Windows).FullName
switch -Wildcard ($filenames)
{
     “*hh.exe"   {"Found hh.exe"}
    “*win.ini"  {"Found win.ini"}
    Default    {"Not hh.exe or win.ini"}
}

  Switch($Disks.drivetype){
  
   3 {Write-Host 'The disk type is Fixed Volume'}
   4 {Write-host ' The disk type is Mapped Network drive'}  
   Default {'There is no disk'}
  
  }


  ##############################################################################

  $servernames = Read-Host "Enter the servername"

  Switch -Wildcard ($servernames){
  
"*DC*" {Write-Host 'Is a domain controller'}
          
 "*FS*"{Write-Host 'Is a File server'}

 "*Web*"{Write-Host 'Is a Webserver'}

 "*HK*" {Write-Host 'Is in Honkong'}

 "*US*" { Write-Host  'is in United States'}
     
  }






 # # wildcard and Break###

   $servernames = Read-Host "Enter the servername"

  Switch -regex ($servernames){
  
"DC" {Write-Host 'Is a domain controller'}
          
  "FS"{Write-Host 'Is a File server'}

  "Web"{Write-Host 'Is a Webserver'}

  "HK" {Write-Host 'Is in Honkong'}

  "US"{Write-Host  'is in United States'}
     
  }



  # Switch Wildcard

  switch –Wildcard (Get-ChildItem -Path c:\)
{
"program*" {Write-Host $_ -ForegroundColor Green}
"windows"  {Write-Host $_ -ForegroundColor Cyan}
} 


switch (123) {

{$_ -lt 124} {Write-Host $_ -ForegroundColor Green}
{$_ -gt 200} {Write-Host $_ -ForegroundColor Cyan}

}

123
################################################################################################

# Flow Control

################################################################################################

# Break & Continue

Switch –Wildcard ("WMF 5.0")
{
   "WMF 5.0" {"Matched First"; Break}
   "W*"      {"Matched Second"}
} 


$c = 0
While ($c -lt 3)
{
    $c++ 
    if ($c -eq 2) {Continue}
    Write-Host $c
    }




function Test-Return ($val)
{
    if ($val -ge 5) {return $val}
    Write-Host "Reached end of function"
}



#######################################################################


# Arrays

#######################################################################


$procs = Get-Process

$procs

$procs.GetType()

$procs[0]
$procs[-1]
$procs[0..5]

#######


$array = "1", "2"
$array.Count
$array.Length

$array += "3"
$array[0] = 10
$array.Set(0,20)
$array | Sort-Object –Descending

$array | Get-Member

Get-Member -InputObject $array


############################################################################


# Hash Tables


############################################################################

@{}

 @{ name = value; name = value ...}

 @{ 'HV-SRV-1'='192.168.1.1' ; Memory=64GB ; Serial='THX1138'}   


 $string = @"
Msg1 = Hello
Msg2 = Enter an email alias
Msg3 = Enter an username
Msg4 = Enter a domain name
"@ 


ConvertFrom-StringData -StringData $string 


$svcshash = Get-Service | 
Group-Object Status -AsHashTable -AsString 

get-service | select @{l = 'computername'; e = {$_.name}} | Restart-Computer



[ordered]@{firstname = "John" ; lastname = "Smith"}
 
Name             Value
----             -----
firstname        John
lastname         Smith





$Server = `
@{ 'HV-SRV-1'='192.168.1.1' ; Memory=64GB ; Serial='THX1138'}   


 $params = @{
  LogName      = "application"
  Newest       = 10
  EntryType    = "Warning"
  ComputerName = "localhost"
}


Get-EventLog @Params 


$props = @{
  Computer = (Get-WmiObject -Class Win32_computersystem).Name

  Name = (Get-NetAdapter -Physical | 
    Where-Object {$_.status -eq “up”}).Name

  Speed = (Get-NetAdapter -Physical | 
    Where-Object {$_.Status -eq “up”}).Linkspeed
}

$notpreserved = New-Object PSObject -Property $props


$preserved = [PSCustomObject]@{
  Computer = (Get-WmiObject -Class Win32_computersystem).Name

  Name = (Get-NetAdapter -Physical | 
    Where-Object {$_.status -eq “up”}).Name

  Speed = (Get-NetAdapter -Physical | 
    Where-Object {$_.Status -eq “up”}).Linkspeed
}
