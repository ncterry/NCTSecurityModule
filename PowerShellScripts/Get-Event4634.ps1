# must run pw as admin to scan event logs 
# should be running on Domain controller 
# This is sorting through all collected Security logs, looking for 4634 event ID 

$gl = Get-Location 
$timestam = Get-Date -f 'yyyy-MM-dd-HHmmss' 
$choice=$begin=$end=$logs = $null 

#----------------------------------- 
$choice, $logs = ."$gl\get-eventlogs.ps1" 

#----------------------------------- 
#set filename 
$filename = "$gl\eventlog4634_$timestamp.txt" 
New-Item -Path $filename -ItemType File 

#-----------------------------------
#Write file header 
Set-Content $filename "---------- 
Results saved to:  $filename 
Evemtlog search for 4634 
Scan timeframe: Start: $begin - End: $end
Collected on $timestamp 
Results start:" 

#----------------------------------- 
Write-Host "Scanning..." 

#----------------------------------- 
$count = 0 
ForEach ($log in $logs)  
{   # search for lognumber if if there are 5 in a row 

    if ($log.EventID -eq '4634' -and $count -eq 5)  
    { 
        $results = ("Event warning!") | Add-Content $filename 
        $results = ($log | Select-Object -Property *, "`n====") | Add-Content $filename 

    } #end if 
    # If we have not reached 5 4634 in a row 
    elseif ($log.EventID -eq '4634')  
    { 
        $count = $count + 1 
    } #end elseif 
    elseif ($log.EventID -ne '4634') 
    { 
        $count = 0 
    } #end elseif 
} #end foreach 

#----------------------------------- 
# if we are in a domain/AD gather the domain controller IPv4 
# remember you will need to install RSAT for AD functions 
$dcIPv4 = Get-ADDomainController -Discover -Site "Default-First-Site-Name" | Select-Object -Property IPv4Address  

#----------------------------------- 
$END = "For full results, this must have been run from the domain controller." | Add-Content $filename 
$END = "Results saved: `n$filename" | Add-Content $filename 
#----------------------------------- 
Get-Content $filename #spit the contents back out on pw also 
#----------------------------------- 

 



