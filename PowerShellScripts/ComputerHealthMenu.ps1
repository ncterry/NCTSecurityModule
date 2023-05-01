<#
In PowerShell, you can create a simple terminal menu 
function using a do-while loop and a switch statement 
to handle user input. Here's an example of a menu with 
20 options and a quit option:
#>

function Show-Menu {
    param (
        [string]$Title = 'My Menu'
    ) #End Param

    Clear-Host
    Write-Host "========== $Title =========="
    #-------------------------------------------
    Write-Host ("1) Get-ComputerInfo")
    Write-Host ("2) Get Running Processes")
    Write-Host ("3) Check Disk Health")
    Write-Host ("4) Check Event Logs for Errors and Warnings")
    Write-Host ("5) Check for Installed Software")
    Write-Host ("6) Test Network Connectivity")
    Write-Host ("7) Check Firewall Settings")
    Write-Host ("8) Scan for Malware")
    #-------------------------------------------
    Write-Host "q. Quit"
}#-------------------------------------------

do {
    Show-Menu -Title 'Simple Terminal Menu'
    $input = Read-Host "Please enter an option (1-20) or 'q' to quit"
    #-------------------------------------------
    switch ($input) {
        { 1..20 -contains $_ } {
            Write-Host "You selected option $input"
            # Add actions for each option here
        }#-------------------------------------------
        #-------------------------------------------
        #-------------------------------------------
        #-------------------------------------------
        #-------------------------------------------
        '1' {
            <#
            Check system information: 
            Use the Get-ComputerInfo cmdlet to retrieve system information, 
            such as OS version, installed updates, hardware details, and more.

            In PowerShell, you can store the results of the Get-ComputerInfo 
            cmdlet into an array and then print the contents of that array. 
            Here's an example of how to do that:
            #>

            # Get the computer info and store it in a variable
            $computerInfo = Get-ComputerInfo
            #-------------------------------------------
            # Convert the properties of the computer info object into an array
            $computerInfoArray = $computerInfo.PSObject.Properties | `
            ForEach-Object { $_.Name, $_.Value }
            #-------------------------------------------
            # Print the array
            # This variable has associated parts, 2 parts per find
            # Ex: [0] = name, [1] = computer find for that name
            $count = 1
            for ($i = 0; $i -lt $computerInfoArray.Length; $i += 2) {
                Write-Host "$count) $($computerInfoArray[$i]): $($computerInfoArray[$i+1])"
                $count++
            }#-------------------------------------------
            pause
            break
        }#END 1-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '2' {
            <#-----------------------
            List running processes: 

            Use the Get-Process cmdlet to list all running processes, 
            their resource usage, and other details.

            In PowerShell, you can use the Get-Process cmdlet to retrieve 
            the running processes, store the results in a variable, and then 
            use a for loop to print the results. 

            In this example, the Get-Process cmdlet is used to get the list of 
            running processes, which is then stored in the $processes variable. 
            A foreach loop is used to iterate through the processes in the 
            $processes variable, and the details of each process 
            (such as name, ID, CPU time, and memory usage) are printed using 
            the Write-Host cmdlet.

            Here's an example:
            ------------------#>

            # Get the running processes and store them in a variable
            $processes = Get-Process

            # Use a for loop to iterate through the processes and print their details
            foreach ($process in $processes) {
                Write-Host "Process Name: $($process.Name)"
                Write-Host "Process ID: $($process.Id)"
                Write-Host "CPU Time: $($process.CPU)"
                Write-Host "Memory (Working Set): $($process.WorkingSet64)"
                Write-Host "------"
            }
            #-------------------------------------------
            pause
            break
        }#END 2-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '3' {
            <#
            Check disk health: 
            Use the Get-PhysicalDisk cmdlet to check the health status 
            of your hard drives.
            #>

            Get-PhysicalDisk | Select-Object MediaType, DeviceID, HealthStatus

            #MediaType DeviceID HealthStatus
            #--------- -------- ------------
            #HDD       0        Healthy     
            #SSD       1        Healthy     
            #-------------------------------------------
            pause
            break
        }#END 3-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '4' {
            <#
            ------------------------------------------------
            Monitor event logs: 
            ------------------------------------------------
            Use the Get-WinEvent cmdlet to query event logs for 
            errors, warnings, and other relevant information.
            ------------------------------------------------
            #>

            Get-WinEvent -FilterHashtable @{LogName='System'; Level=1,2,3}


            <# Partial Example Results
            TimeCreated                      Id LevelDisplayName Message                             
            -----------                      -- ---------------- -------                             
            10/21/2022 7:12:17 PM         10016 Warning          The application-specific permissi...


                ProviderName: Volsnap

            TimeCreated                      Id LevelDisplayName Message                             
            -----------                      -- ---------------- -------                             
            10/21/2022 10:49:34 AM           36 Error            The shadow copies of volume C: we...

            #>
            #-------------------------------------------
            pause
            break
        }#END 4-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '5' {
            <##-------------------------------------------------
            Check for installed software: 
            Use the Get-ItemProperty cmdlet to list installed 
            software and their versions.
            #-------------------------------------------------#>
            #-------------------------------------------------
            # Get the item properties and store them in a variable
            $installedSoftware = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName
            #-------------------------------------------------
            # Use a for loop to iterate through the installed software and print their details
            foreach ($software in $installedSoftware) {
                if ($software.DisplayName) {
                    Write-Host "Software Name: $($software.DisplayName)"
                    Write-Host "Version: $($software.DisplayVersion)"
                    Write-Host "Publisher: $($software.Publisher)"
                    Write-Host "Install Date: $($software.InstallDate)"
                    Write-Host "------"
                }#-------------------------------------------------
            }#-------------------------------------------------
            <##-------------------------------------------------
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
            #-----------------------------------------#>
            #-------------------------------------------
            pause
            break
        }#END 5-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '6' {
            <#-----------------------------
            Test network connectivity: 
            Use the Test-NetConnection cmdlet to test connectivity 
            to specific hosts or ports.
            -----------------------------#>
            Test-NetConnection -ComputerName "www.google.com" -Port 80
            #Example
            #ComputerName     : www.google.com
            #RemoteAddress    : 2607:f8b0:4004:c1b::6a
            #RemotePort       : 80
            #InterfaceAlias   : Wi-Fi
            #SourceAddress    : 2601:147:c200:17::ed0
            #TcpTestSucceeded : True
            #-------------------------------------------
            pause
            break
        }#END 6-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '7' {
            <#-------------------------------
            Review firewall settings: 
            Use the Get-NetFirewallProfile cmdlet to review 
            the current firewall settings.
            -------------------------------#>
            Get-NetFirewallProfile -PolicyStore ActiveStore

            #-------------------------------------------
            pause
            break
        }#END 7-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '8' {
            <#
            Scan for malware: 
            Use the Start-MpScan cmdlet to initiate a Windows Defender 
            antivirus scan (requires Windows Defender).
            The Start-MpScan cmdlet does not return the results directly; 
            instead, you can use the Get-MpThreatDetection cmdlet to 
            retrieve the scan results after running the Start-MpScan cmdlet. 
            
            In this example, the Start-MpScan cmdlet starts a quick scan, 
            and the result is stored in the $scanResult variable. 
            The Wait-Job cmdlet is used to wait for the scan to complete. 
            Then, the Get-MpThreatDetection cmdlet retrieves the detected 
            threats and stores them in the $threats variable.

            Finally, a conditional statement checks if any threats were 
            detected. If there are threats, a foreach loop is used to 
            iterate through the detected threats and print their details 
            in the terminal. If no threats were detected, a message is 
            displayed to inform the user.

            Here's an example of how to do that in PowerShell:
            #>
            # Start a quick scan using Windows Defender
            $scanResult = Start-MpScan -ScanType QuickScan

            # Wait for the scan to complete
            $scanResult | Wait-Job

            # Get the detected threats
            $threats = Get-MpThreatDetection

            # Print the threats in the terminal
            if ($threats) {
                foreach ($threat in $threats) {
                    Write-Host "Threat Name: $($threat.ThreatName)"
                    Write-Host "Severity ID: $($threat.SeverityID)"
                    Write-Host "Threat Status: $($threat.ThreatStatus)"
                    Write-Host "Category ID: $($threat.CategoryID)"
                    Write-Host "Detection ID: $($threat.DetectionID)"
                    Write-Host "------"
                }
            } else {
                Write-Host "No threats were detected."
            }


            #-------------------------------------------
            pause
            break
        }#END 8-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '9' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 9-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '10' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 10-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '1' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 10-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '11' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 11-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '12' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 12-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '13' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 13-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '14' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 14-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '15' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 15-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '16' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 16-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '17' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 17-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '18' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 18-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        '19' {
            Write-Host "..."
            #-------------------------------------------
            pause
            break
        }#END 19-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        'q' {
            Write-Host "Exiting the menu..."
            break
        }#END Q-------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        #-------------------------------------------------
        default {
            Write-Host "Invalid selection, please try again"
        }#END DEFAULT-------------------------------------------
    }#END SWITCH-------------------------------------------

    # Pause before displaying the menu again
    Write-Host "Press Enter to continue..."
    [void](Read-Host "")
} while ($true)
#-------------------------------------------
