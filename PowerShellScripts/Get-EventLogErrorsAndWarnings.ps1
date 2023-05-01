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