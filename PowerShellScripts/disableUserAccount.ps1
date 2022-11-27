                                                                            

$currentlyDisabled = Search-ADAccount -AccountDisabled | Select-Object name  

Write-Host "Current usernames that are disabled:    $currentlyDisabled"         

$username = Read-Host "Enter a target username to be disabled."                

Disable-ADAccount -Identity $username                                   

 



