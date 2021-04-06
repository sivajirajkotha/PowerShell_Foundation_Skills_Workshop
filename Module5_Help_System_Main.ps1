################################################################################

# Powershell Help System

################################################################################

Get-help 

Get-help Get-Service 

Get-help Get-Service -Examples

Get-help Get-Service -Detailed

Get-help Get-Service -Full

Get-help Get-Service -Online

Get-help Get-Service -ShowWindow

Get-help Get-Service -Parameter computername # Help on parameter

Get-help Get-Service -Parameter * 


######################################################################################

#Conceptual Based Help

######################################################################################


Get-Help about_

get-help about_*op* #wildcard filter


######################################################################################

# Updatable help

#######################################################################################


Update-Help
Update-Help -Force
Update-Help -Module Applocker

Get-Module -Name APPX | Update-Help


#save help

Save-help C:\temp

update-help -SourcePath C:\temp


get-help about_Updatable_Help

##########################################################################################

# Comment Based Help

##########################################################################################

# you can comment out this way

#you can also comment your code
#in multiple lines this way



<#

You can write multi line comments this way

this is very effective and also this gives you the 

ability to collapase your help system code. 




#>


function Add-Extension
            {
                param ([string]$Name,[string]$Extension = "txt")
                $name = $name + "." + $extension
                $name

            <#
            .SYNOPSIS
            Adds a file name extension to a supplied name.

            .DESCRIPTION
            Adds a file name extension to a supplied name.
            Takes any strings for the file name or extension.

            .PARAMETER Name
            Specifies the file name.

            .PARAMETER Extension
            Specifies the extension. "Txt" is the default.

            .INPUTS
            None. You cannot pipe objects to Add-Extension.

            .OUTPUTS
            System.String. Add-Extension returns a string with the extension or file name.

            .EXAMPLE
            C:\PS> extension -name "File"
            File.txt

            .EXAMPLE
            C:\PS> extension -name "File" -extension "doc"
            File.doc

            .EXAMPLE
            C:\PS> extension "File" "doc"
            File.doc

            .LINK
            http://www.fabrikam.com/extension.html

            .LINK
            Set-Item
            #>

             


            }


cd $home'\documents\Workshop_Fundamentals_Scripts\Day 2\mywork\Help System'

############################################################################################

                         #    LAB    #

#############################################################################################