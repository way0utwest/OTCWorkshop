###################################################################
#
# Set up Provision variables for machines and paths
# Set up default names
#
###################################################################
$ProvisionMachine = "dkrSpectre"
$ProvisionURL = "http://" + $ProvisionMachine + ":14145/"
$ProvisionInstance = "2017"
$ImagePath = 'C:\SQLCloneImages'
$ImageDate = (get-date).ToString('yyyyMMdd')
$ImageName = 'SimpleTalkDev_Base'
$SourceDatabase = "SimpleTalk_5_Prod"

###########################################################
# Provision Connection
###########################################################
Connect-SqlClone -ServerUrl $ProvisionURL

###########################################################
# Set proper Instance, path, and masking sets.
###########################################################
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName $ProvisionMachine -InstanceName $ProvisionInstance
$ImageDestination = Get-SqlCloneImageLocation -Path 
$Mask = New-SqlCloneMask -Path 'C:\Users\way0u\Documents\Data Masker(SqlServer)\Masking Sets\Sitc2018Demo_DataMaskerDemo.DMSMaskSet'
$InjectScript = New-SqlCloneSqlScript -Path 'C:\Users\way0u\Documents\SQL Server Management Studio\Inject_Dm_Customer.sql'

###########################################################
# remove old clones from image
###########################################################
$CurrentImage = Get-SqlCloneImage -Name $ImageName
$clones = Get-SqlClone -Image $CurrentImage
$clones | foreach { $_ | Remove-SqlClone | Wait-SqlCloneOperation };

###########################################################
# remove old image
###########################################################
$ImageToRemove = Get-SqlCloneImage -Name $ImageName
If $ImageToRemove Then {
    Remove-SqlCloneImage -Image $ImageToRemove | Wait-SqlCloneOperation
}

###########################################################
#create masked image
###########################################################
$ImageOperation = New-SqlCloneImage -Name $ImageName -SqlServerInstance $SqlServerInstance -DatabaseName $SourceDatabase -Destination $ImageDestination -Modifications @($Mask, $InjectScript)

Wait-SqlCloneOperation -Operation $ImageOperation

