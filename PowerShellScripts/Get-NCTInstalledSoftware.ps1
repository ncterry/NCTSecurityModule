
<#
Check for installed software: 
Use the Get-ItemProperty cmdlet to list installed software and their versions.
#>

# Get the item properties and store them in a variable
$installedSoftware = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName

 

# Use a for loop to iterate through the installed software and print their details
foreach ($software in $installedSoftware) {
    if ($software.DisplayName) {
        Write-Host "Software Name: $($software.DisplayName)"
        Write-Host "Version: $($software.DisplayVersion)"
        Write-Host "Publisher: $($software.Publisher)"
        Write-Host "Install Date: $($software.InstallDate)"
        Write-Host "------"
    }
}

<#
------
Software Name: Teams Machine-Wide Installer
Version: 1.4.0.22976
Publisher: Microsoft Corporation
Install Date: 20211202
------
Software Name: VMware Horizon Client
Version: 8.6.0.29364
Publisher: VMware, Inc.
Install Date: 
------
Software Name: WebAdvisor by McAfee
Version: 4.1.1.810
Publisher: McAfee, LLC
Install Date: 
------
#>