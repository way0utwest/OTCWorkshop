Connect-SqlClone -ServerUrl "http://dkrSpectre:14145/"
$ImageDate = (get-date).ToString('yyyyMMdd')
$ImageName = 'DataMaskerDemo_Base'
$CloneName = 'DataMaskerDev_Steve'

###########################################################
# Set proper Instance, path, and masking sets.
###########################################################
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName dkrSpectre -InstanceName SQL2016
$ImageDestination = Get-SqlCloneImageLocation -Path 'C:\SQLCloneImages'
$Mask = New-SqlCloneMask -Path 'C:\Users\way0u\Documents\Data Masker(SqlServer)\Masking Sets\Sitc2018Demo_DataMaskerDemo.DMSMaskSet'
$InjectScript = New-SqlCloneSqlScript -Path 'C:\Users\way0u\Documents\SQL Server Management Studio\Inject_Dm_Customer.sql'

###########################################################
# remove old clone
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
$ImageOperation = New-SqlCloneImage -Name $ImageName -SqlServerInstance $SqlServerInstance -DatabaseName 'DataMaskerDemo_Prod' -Destination $ImageDestination -Modifications @($Mask,  $InjectScript)

Wait-SqlCloneOperation -Operation $ImageOperation

###########################################################
# create new clone
###########################################################
$image = Get-SqlCloneImage -Name $ImageName
$image | New-SqlClone -Name $CloneName -Location $sqlServerInstance | Wait-SqlCloneOperation
$CloneName = 'DataMaskerDev_Grant'
$image | New-SqlClone -Name $CloneName -Location $sqlServerInstance | Wait-SqlCloneOperation
$CloneName = 'DataMaskerDev_Kathi'
$image | New-SqlClone -Name $CloneName -Location $sqlServerInstance | Wait-SqlCloneOperation
$CloneName = 'DataMaskerDev_Kendra'
$image | New-SqlClone -Name $CloneName -Location $sqlServerInstance | Wait-SqlCloneOperation
