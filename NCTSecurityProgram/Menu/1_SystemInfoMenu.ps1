# Run the full functioning Menu
# .\menuTemplate.ps1

# This is just a default menu template


Function Set-Header {
    Write-Host("
|==========================================================================|
|=======================--- System Info Menu---============================|
|==========================================================================|")
}#End Function Set-Header===================================================



Function Set-MainMenu { 
    Write-Host ("`n Selections:`n ----------- ")
<<<<<<< HEAD
    Write-Host -ForegroundColor Yellow (" 1) Operating System Version Info `t`t`tEnter: 1")
    Write-Host -ForegroundColor Yellow (" 2) System BIOS Info `t`t`t`t`tEnter: 2")
    Write-Host -ForegroundColor Yellow (" 3) Machine Manufacturer and Model `t`t`tEnter: 3")
    Write-Host -ForegroundColor Yellow (" 4) Listing Local Users and Owner `t`t`tEnter: 4")
    Write-Host -ForegroundColor Yellow (" 5) Get Available Disk Space`t`t`t`tEnter: 5")
    Write-Host -ForegroundColor Yellow (" 6) Computer Name `t`t`t`t`tEnter: 6")
    Write-Host -ForegroundColor Yellow (" 7) PowerShell Version `t`t`t`t`tEnter: 7")
    Write-Host -ForegroundColor Yellow (" 8) View List of Function Aliases `t`t`tEnter: 8")
    Write-Host -ForegroundColor Yellow (" 9) Test Python Script `t`t`t`tEnter: 9")

    Write-Host -ForegroundColor Yellow (" -----")
    Write-Host -ForegroundColor Yellow (" RETURN - To prior menu `t`t`t`tEnter: 0")
    Write-Host -ForegroundColor Yellow (" HELP   - Enter the Number + h (EX: 1h, 2h) `t`tEnter: #h")
    Write-Host -ForegroundColor Yellow (" README - Program Summary `t`t`t`tEnter: `'readme`'")
=======
    Write-Host -ForegroundColor Yellow (" 1) System Info `t`t`t`t`tEnter: 1")

    Write-Host -ForegroundColor Yellow (" -----")
    Write-Host -ForegroundColor Yellow (" HELP   - Enter the Number + h (EX: 1h, 2h) `tEnter: #h")
    Write-Host -ForegroundColor Yellow (" README - Program Summary `t`t`tEnter: `'readme`'")
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a
    Write-Host -ForegroundColor Red (" Quit the Program `t`t`t`t`tEnter: `'quit`'")
}#End Function Set-MainMenu==================================================



# Create global var, basically we can set the global var to quit, and in turn quit from anywhere in the program.
# Not vital, just convenient.
$Global:quit = ""


do {
    If ($Global:quit -eq "quit") {break} #If we cycle back to main menu and user has chosen to quit.
    Clear-Host
    Set-Header
    Set-MainMenu
<<<<<<< HEAD
    $choice = Read-Host ("`n`n Enter Choice") #This will pause and wait for user input.
=======
    $choice = Read-Host ("`n`n Enter Choice: ") #This will pause and wait for user input.
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a
    $choice = $choice -replace '\s', ""    #Remove any spaces from user input.
    $choice = $choice.ToLower()            #These choices for menu will only user numbers, and lowercase

    Switch($choice) {
    # ----------------------

        '1' {
<<<<<<< HEAD
            # Operating system information
            Write-Host -ForegroundColor Yellow (" -----")
            Get-ComputerInfo -Property "os*"
            Pause
=======
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a

        }#End 1
        # ----------------------
        '1h' {
            Get-NCTSecurityModuleHelp -section 1.1
        }#End 1h
        # ----------------------
        '2' {
<<<<<<< HEAD
            # System BIOS Information
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_BIOS
            Pause
=======
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a

        }#End 2
        # ----------------------
        '2h' {
            Get-NCTSecurityModuleHelp -section 1.2
        }#End 2h
        # ----------------------
        '3' {
<<<<<<< HEAD
            # Machine Manufacturer and Model
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_ComputerSystem
            Pause
=======
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a

        }#End 3
        # ----------------------
        '3h' {
            Get-NCTSecurityModuleHelp -section 1.3
        }#End 3h
<<<<<<< HEAD
        # ---------------------
=======
<<<<<<< HEAD
        # ---------------------
=======
        # ----------------------

<<<<<<< HEAD
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
        '4' {
            # Listing of local users and owner
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser
            Pause

        }#End 4
        # ----------------------
        '4h' {
            Get-NCTSecurityModuleHelp -section 1.4
        }#End 4h
        # ----------------------
        '5' {
            # Get Available Disk Space
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
            Pause
        }#End 5
        # ----------------------
        '5h' {
            Get-NCTSecurityModuleHelp -section 1.5
        }#End 5h
        # ----------------------
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
        '6' {
            # Gather the name of the machine
            Write-Host -ForegroundColor Yellow (" -----")
            (Get-WmiObject win32_operatingsystem).CSName
            Pause
        }#End 6
        # ----------------------
        '6h' {
            Get-NCTSecurityModuleHelp -section 1.6
        }#End 6h
        # ----------------------
        '7' {
            # View the current version of PowerShell 
            Write-Host -ForegroundColor Yellow (" -----")
            $PSVersionTable
            Pause
        }#End 7
        # ----------------------
        '7h' {
            Get-NCTSecurityModuleHelp -section 1.7
        }#End 7h
        # ----------------------
        '8' {
            # View a list of function aliases
            Write-Host -ForegroundColor Yellow (" -----")
            Get-Alias *
            Pause
        }#End 8
        # ----------------------
        '8h' {
            Get-NCTSecurityModuleHelp -section 1.8
        }#End 8h
        # ----------------------
        '9' {
            # Call a python script through PowerShell
            Write-Host -ForegroundColor Yellow (" -----")
            python sum.py 3 4
            Pause
        }#End 9
        # ----------------------
        '8h' {
            Get-NCTSecurityModuleHelp -section 1.8
        }#End 8h
        # ----------------------
        <#**********************
        '1' {
            # 
            Write-Host -ForegroundColor Yellow (" -----")

            Pause
        }#End 1
        # ----------------------
        '1h' {
            Get-NCTSecurityModuleHelp -section 1.1
        }#End 1h
        # ----------------------
        ************************#>
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 5efabc989bfe23891484c55662b5dbecf1725f0a
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
        'quit' {
        # Account for all types of quitting
            $Global:quit = 'quit'
            $choice = 0
            break
        }#End quit

    # If you do not quit, this will just recycle back to the start of the menu
    }#End Switch

# Nothing asks for 0. Infinite loop until user chooses 'quit'
} until (($choice -eq 0)) #End do