<#
Check disk health: 
Use the Get-PhysicalDisk cmdlet to check the health status of your hard drives.
#>

Get-PhysicalDisk | Select-Object MediaType, DeviceID, HealthStatus

<#
MediaType DeviceID HealthStatus
--------- -------- ------------
HDD       0        Healthy     
SSD       1        Healthy     

#>