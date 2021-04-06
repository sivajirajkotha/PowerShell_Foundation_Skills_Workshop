
########################################################################

#objects

#########################################################################





Get-Help about_Objects

Get-Service

Get-service | Get-Member

Get-NetAdapter| Get-Member

Get-TypeData  # To get all instance types





################################################################

# Objects Members Properties collections

################################################################

Get-Member

Get-service | Get-Member

(Get-service).GetType()

(Get-service).GetType().Assembly

Get-service | Get-Member -View Extended

Get-service | Get-Member -View Adapted

Get-service | Get-Member -View All


##################################################################

# Get-Member Definitions 

##################################################################


$file = Get-Item "C:\Windows\notepad.exe"

$file

$file | Get-Member

$file.CopyTo("C:\temp")

$file.CopyTo("C:\temp" , $true )

$file.CopyTo("C:\temp")

$file.CopyTo("C:\temp" , $true )

$file.CopyTo( "C:\temp" , $false)







#########################################################################

# Variables and Data Types


##########################################################################





# Automatic Variables


$Error  # Stores error information
$?      # Execution status of last operation
$HOME
$PSHOME
$Host
$null
$true
$false
$Matches



# User Defined variables 

$Var = Get-Process

$my_var = Get-Process

${This is also a variable}  = Get-Process

New-Variable Process -Value (Get-Process)

Get-Process -OutVariable myprocess

Clear-Variable -Name Process # same as setting to $Null

Set-Variable -name Process (Get-Service)

Remove-Variable -Name Process

Get-command -Noun Variable

Help about_Variables


# Constant Variables

New-Variable -Name Hello -Value (Get-Service) -Option Constant

New-Variable -Name Service -Value (Get-Service) -Option ReadOnly

Set-Variable -Name Service -Value ( Get-Process) -Force



###########################################################################################


# Strings

###########################################################################################

$a = 123

$a.GetType()

$b = 'A contains $a'

$c = "A contains $a"


# Expandable Strings

$String = '

A 
contains
$a'

$String


$Estring = " A
conatins

$a"

$Estring

# Here String


$Litherestring = @'
The 
value of
A
is
$a
'@

$Litherestring


$Expherestring = @"
The
value of
A
is
$A
"@

$Expherestring



######################################################################################

# Sub Expressions

#######################################################################################

$srv = Get-Service -Name Bits

$srv

$srv | gm

$srv.Name

$srv.Status


$srvstatus = "$srv.name is $srv.Status"

$srvstatus = $("$srv.name is $srv.Status")

$srvstatus = "$($srv.name) is $($srv.Status)"



########################################################################################

#   Types

########################################################################################

# Weakly Typed

$intW = 4

$intw = 4.6

$intw =[int]4.5 # Rounds of to 4

$intw =[int]4.6 # Rounds of to 5

$intw = 7.5

$intw = "Hello There"   # weakly typed



#  Strongly Typed

[int]$ints = 4

[int]$ints = 4.4 # Rounds of to 4

[int]$ints = 4.6  # Rounds of to 5

$ints = 7.8

[int]$ints = "Hello There"   # Strongly typed


###########################################################################################
# Static Members
###########################################################################################

[System.Math]::Abs(-25)

[System.Math]::PI

[System.Net.Dns]::GetHostAddresses('microsoft.com')

[datetime]::Now
[datetime]::DaysInMonth("2018","5")
[datetime]::IsLeapYear("2018")


[char]44 

33..40 | ForEach-Object {

Write-Host "Decimal: $_ = Charachter:$([char]$_)"
}





############################################################################################

# Type Operators

#############################################################################################

(get-service).GetType()
(get-service) -is [System.Object]
(get-service) -isnot [datetime]




#################################################################################

# Powershell Parsing Modes

#################################################################################

2+2
'2'+2 #concatinates 

Write-Output 2+2

$a = 2
Write-Output $a

$cmd = "Get-Process"
& $cmd


############################################################################

# Escape Charachters

#############################################################################

$a=123

$b = '$a value is $a'

$b = "$a value is $a"

$b = "`$a value is $a"


# `n  # new line

write-host "this line has two `n `n breaks"


Get-Service | `
Where-Object name -EQ `
Bits


#################################################################################

# Stop Parsing 

##################################################################################


Icacls C:\test1.txt /grant fareast\kared:(ci)F

Icacls C:\test1.txt --% /grant fareast\kared:(ci)F



################################################################################

############################## LAB ######################################################

##################################################################################
