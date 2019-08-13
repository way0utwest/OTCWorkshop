###################################################################
#
# Set up Provision variables for machines and paths
# Set up default names
#
###################################################################
$ProvisionMachine = "dkrSpectre"
$ProvisionURL = "http://" + $ProvisionMachine + ":14145/"
$ProvisionInstance = "SQL2017"
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
$ImageDestination = Get-SqlCloneImageLocation -Path $ImagePath
$Mask = New-SqlCloneMask -Path 'SimpleTalk_Prod_Mask.DMSMaskSet'
$InjectScript = New-SqlCloneSqlScript -Path 'inject_st_contact.sql'


###########################################################
# remove old image
###########################################################
$ImageToRemove = Get-SqlCloneImage | Where-Object {$_.Name -eq $ImageName}
If ($null -ne $ImageToRemove) {
  $oldClones = Get-SqlClone -Image $ImageName
  $oldClones | foreach { $_ | Remove-SqlClone | Wait-SqlCloneOperation}
  Remove-SqlCloneImage -Image $ImageToRemove | Wait-SqlCloneOperation 
}

###########################################################
#create masked image
###########################################################
$ImageOperation = New-SqlCloneImage -Name $ImageName -SqlServerInstance $SqlServerInstance -DatabaseName $SourceDatabase -Destination $ImageDestination -Modifications @($Mask, $InjectScript)

Wait-SqlCloneOperation -Operation $ImageOperation

