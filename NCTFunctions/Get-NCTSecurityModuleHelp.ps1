# Get-Section Help

# Example
# Main Menu Section 3, Task 4
# Full details on what happens in that section.
# > Get-NCTSecurityModuleHelp 3.4
<<<<<<< HEAD
# > Get-NCTSecurityModuleHelp -sectopm 3.4
=======
<<<<<<< HEAD
# > Get-NCTSecurityModuleHelp -sectopm 3.4
=======
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1

Function Get-NCTSecurityModuleHelp {
    Param(
        [Parameter (Mandatory = $true)] #Section param is mandatory to use this function.
        [string] $section
    )#End Param
    
        Write-Host -ForegroundColor Yellow ("NCTSecurity Module Help")
    
        If ($section -eq '1.1') {
            Write-Host("Help section for menu section 1.1")
<<<<<<< HEAD
            Pause
=======
<<<<<<< HEAD
            Pause
=======
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
    
        }#End Section 1.1
        #----------------
    
        If ($section -eq '1.2') {
<<<<<<< HEAD
            Write-Host("Help section for menu section 1.2")
            Pause
=======
<<<<<<< HEAD
            Write-Host("Help section for menu section 1.2")
            Pause
=======
            Write-Host("Help section for menu section 1.1")
    
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
        }#End Section 1.2
        #----------------
    
        If ($section -eq '1.3') {
<<<<<<< HEAD
            Write-Host("Help section for menu section 1.3")
            Pause
=======
<<<<<<< HEAD
            Write-Host("Help section for menu section 1.3")
            Pause
=======
            Write-Host("Help section for menu section 1.1")
    
>>>>>>> f36076a1edc21b4f55f67cf6fb6e4977aa68942c
>>>>>>> e77821a7333608c01649bd59f5f5761ed7a12ad1
        }#End Section 1.3
        #----------------
        
        
    }#End Function Get-NCTSecurityModuleHelp