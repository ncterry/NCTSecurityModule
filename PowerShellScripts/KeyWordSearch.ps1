$gl = Get-Location                                      
#------------------------------                                      
$timestamp = Get-Date -f 'yyyy-MM-dd-HHmmss'                                      

#------------------------------                                      
Write-Host ("Search for     bloodhound")                                      

#------------------------------                                      
# file for results                                      
$filename = "$gl\keywordsearches\bloodhound_$timestamp.txt"                                    
Write-Host ("Results saved in `n$filename")                                      

#------------------------------                                      
New-Item -Path $filename -ItemType File                                      

#------------------------------                                      
Set-Content $filename "----------                                      
Results saved to $filename                                      
Keyword search for bloodhound                          
Case Insensitive                                      
Collected on $timestamp"                                      

#------------------------------                                      
#------------------------------                                      
#C/P adjust keyword if copied for new                                      
# search for keyword, ignore permission errors, and add results to initial file 
$results = Get-ChildItem -Path C:\ -Recurse -Include *bloodhound* -Force -ErrorAction SilentlyContinue | Add-Content $filename 

#------------------------------                                      
#------------------------------                                      
Get-Content $filename                                      
return $filename                                      

#------------------------------                                      
#------------------------------                                      

 
 

 



