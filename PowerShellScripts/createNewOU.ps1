<#  

Personal VMs – 2xWindows Server 2016, 1xWindows 10  

Domain:  

WidgetLLC.Internal   

View the target 'distinguishedName'  

Server>>Tools>>Active Directory Users and Computers>>
right click on related OU
>> Properties>>Attribute Editor>>distinguishedName  

Both of these commands worked,
but, when I clicked on Refrsh in AD the first one did not show up.
That OU is in the main directory, but needed me to close the AD,
and open up the whole thing again to be able to see it.
The 2nd one, in the sub-ou appeared after a refresh  
#>  

New-ADOrganizationalUnit -Name "NatesOU" -Path "DC=WidgetLLC, DC=Internal"  

New-ADOrganizationalUnit -Name "NatesOU2" -Path "OU=itFlee, DC=WidgetLLC, DC=Internal"  



