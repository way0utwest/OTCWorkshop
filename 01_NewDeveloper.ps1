<#

.SYNOPSIS
An onboarding script for new developers as a demo. The Clone server is hard coded in this case.

.DESCRIPTION
This script will connect to the SQL Clone server specified in the setup parameters and then look for an image that is passed in as the second parameter
The script will then create a new cloned datbase, using this image and the first parameter as the new name for the database. 
The script creates this database on the instance specified in the third parameter.

.EXAMPLE
./01_NewDeveloper.ps1 Steve SimpleTalkDev_Base dkrSpectre\SQL2017

.NOTES
This is a demonstration script of how you might quickly onboard a new developer.

.LINK
http://www.voiceofthedba.com
#>

# Get Parameters
# Developer is first parameter
# Image is second parameter
# instance is third parameter
$DeveloperName = $args[0]
$ImageName = $args[1]
$Instance = $args[2].Split('\')
$MachineName = $Instance[0]
$InstanceName = $Instance[1]

# Setup
$CloneServer = "http://dkrSpectre:14145"

# Connect to SQL Clone Server
Connect-SqlClone -ServerUrl  $CloneServer

$sqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName $MachineName -InstanceName $InstanceName

# Get Image File
$Image = Get-SqlCloneImage -Name $ImageName

# Create clone database
$BaseName = $ImageName.Split('_')
$DatabaseName = $BaseName[0] + '_1_' + $DeveloperName
$DatabaseName = $DatabaseName -replace "Base"
$Image | New-SqlClone -Name $DatabaseName -Location $sqlServerInstance | Wait-SqlCloneOperation
