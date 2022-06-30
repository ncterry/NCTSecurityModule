# Run the full functioning Menu
# .\menuTemplate.ps1

# This is just a default menu template


Function Set-Header {
    Write-Host("
|==========================================================================|
|=======================--- Domain Info Menu---============================|
|==========================================================================|")
}#End Function Set-Header===================================================



Function Set-MainMenu { 
    Write-Host ("`n Selections:`n ----------- ")
<<<<<<< HEAD
    Write-Host -ForegroundColor Yellow (" 1) Domain Controller Info `t`t`t`t`tEnter: 1")
=======
<<<<<<< HEAD
    Write-Host -ForegroundColor Yellow (" 1) Domain Controller Info `t`t`t`t`tEnter: 1")
=======
<<<<<<< HEAD
    Write-Host -ForegroundColor Yellow (" 1) Domain Info `t`t`t`t`tEnter: 1")
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1

    Write-Host -ForegroundColor Yellow (" -----")
    Write-Host -ForegroundColor Yellow (" RETURN - To prior menu `t`t`t`tEnter: 0")
    Write-Host -ForegroundColor Yellow (" HELP   - Enter the Number + h (EX: 1h, 2h) `t`tEnter: #h")
    Write-Host -ForegroundColor Yellow (" README - Program Summary `t`t`t`tEnter: `'readme`'")
=======
    Write-Host -ForegroundColor Yellow (" 1)  Info `t`t`t`t`tEnter: 1")

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
    $choice = Read-Host ("`n`n Enter Choice: ") #This will pause and wait for user input.
    $choice = $choice -replace '\s', ""    #Remove any spaces from user input.
    $choice = $choice.ToLower()            #These choices for menu will only user numbers, and lowercase

    Switch($choice) {
    # ----------------------

        '1' {
            # Get an available domain controller in the current domain
            Get-ADDomain
            Pause
        }#End 1
        # ----------------------

        '1h' {
            # Example of what is shown
            <#
            AllowedDNSSuffixes                 : {}
            ChildDomains                       : {}
            ComputersContainer                 : CN=Computers,DC=NCT,DC=local
            DeletedObjectsContainer            : CN=Deleted Objects,DC=NCT,DC=local
            DistinguishedName                  : DC=NCT,DC=local
            DNSRoot                            : NCT.local
            DomainControllersContainer         : OU=Domain Controllers,DC=NCT,DC=local
            DomainMode                         : Windows2016Domain
            DomainSID                          : S-1-5-21-2223769531-4211276685-4166951426
            ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=NCT,DC=local
            Forest                             : NCT.local
            InfrastructureMaster               : DC01.NCT.local
            LastLogonReplicationInterval       :
            LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=NCT,DC=local}
            LostAndFoundContainer              : CN=LostAndFound,DC=NCT,DC=local
            ManagedBy                          :
            Name                               : NCT
            NetBIOSName                        : NCT
            ObjectClass                        : domainDNS
            ObjectGUID                         : f71f2632-5e70-4eb1-ae8b-9e7ca216b03c
            ParentDomain                       :
            PDCEmulator                        : DC01.NCT.local
            PublicKeyRequiredPasswordRolling   : True
            QuotasContainer                    : CN=NTDS Quotas,DC=NCT,DC=local
            ReadOnlyReplicaDirectoryServers    : {}
            ReplicaDirectoryServers            : {DC01.NCT.local}
            RIDMaster                          : DC01.NCT.local
            SubordinateReferences              : {DC=ForestDnsZones,DC=NCT,DC=local, DC=DomainDnsZones,DC=NCT,DC=local,
                                                CN=Configuration,DC=NCT,DC=local}
            SystemsContainer                   : CN=System,DC=NCT,DC=local
            UsersContainer                     : CN=Users,DC=NCT,DC=local
            #>

        }#End 1h
        # ----------------------

        '2' {
            Get-ADDomainCon

        }#End 2
        # ----------------------

        '2h' {

        }#End 2h
        # ----------------------

        '3' {

        }#End 3
        # ----------------------

        '3h' {

        }#End 3h
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