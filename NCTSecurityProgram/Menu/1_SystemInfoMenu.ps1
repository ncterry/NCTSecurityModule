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
    Write-Host -ForegroundColor Yellow (" 1) Operating System Version Info `t`t`tEnter: 1")
    Write-Host -ForegroundColor Yellow (" 2) System BIOS Info `t`t`t`t`tEnter: 2")
    Write-Host -ForegroundColor Yellow (" 3) Machine Manufacturer and Model `t`t`tEnter: 3")
    Write-Host -ForegroundColor Yellow (" 4) Listing Local Users and Owner `t`t`tEnter: 4")
    Write-Host -ForegroundColor Yellow (" 5) Get Available Disk Space`t`t`t`tEnter: 5")

    Write-Host -ForegroundColor Yellow (" -----")
    Write-Host -ForegroundColor Yellow (" RETURN - To prior menu `t`t`t`tEnter: 0")
    Write-Host -ForegroundColor Yellow (" HELP   - Enter the Number + h (EX: 1h, 2h) `t`tEnter: #h")
    Write-Host -ForegroundColor Yellow (" README - Program Summary `t`t`t`tEnter: `'readme`'")
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
    $choice = Read-Host ("`n`n Enter Choice") #This will pause and wait for user input.
    $choice = $choice -replace '\s', ""    #Remove any spaces from user input.
    $choice = $choice.ToLower()            #These choices for menu will only user numbers, and lowercase

    Switch($choice) {
    # ----------------------

        '1' {
            # Operating system information
            Write-Host -ForegroundColor Yellow (" -----")
            Get-ComputerInfo -Property "os*"
            Pause

        }#End 1
        # ----------------------

        '1h' {

        }#End 1h
        # ----------------------

        '2' {
            # System BIOS Information
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_BIOS
            Pause

        }#End 2
        # ----------------------

        '2h' {

        }#End 2h
        # ----------------------

        '3' {
            # Machine Manufacturer and Model
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_ComputerSystem
            Pause

        }#End 3
        # ----------------------

        '3h' {

        }#End 3h
        # ----------------------

        '4' {
            # Listing of local users and owner
            Write-Host -ForegroundColor Yellow (" -----")
            Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser
            Pause

        }#End 4
        # ----------------------

        '4h' {

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

        }#End 5h
        # ----------------------
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