# Lots of header info for the domain 
Get-ADDomain                          

Get-ADDomainController -Filter * | Select-Object hostname, operatingsystem 

# Get domain password policies                          
$result = Get-ADDefaultDomainPasswordPolicy                          
if ($result -eq $null)                          
{                          
    Write-Host "No password policy"                          
}                          
else                           
{                          
    Write-Host "$result"    <# Action when all if and elseif conditions are false #>                          
}                          
<#                           

I ran on my simple Domain/AD and it did not return anything. 
Blank - we have not set password policies yet 

#>                          

 

 



