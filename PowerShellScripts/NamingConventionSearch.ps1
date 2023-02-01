 
# -------------------------------------                                      
# Searching for any files with sharphound naming convention                                      
# naming convention here starts with 14 decimals.                                      

# -------------------------------------                                      
$gl = Get-Location                                      

# -------------------------------------                                      
$timestamp = Get-Date -f 'yyyy-MM-dd-HHmmss'                                      

# -------------------------------------                                      
$filename = "$gl\SavedResults\14digitsharphound_$timestamp.txt"                                      
New-Item -Path $filename -ItemType File                                      

# -------------------------------------                                      
Set-Content $filename "Results saved to $filename                                      
Keyword search for 14DigitSharphound                                      
Search on $timestamp"                                      

# -------------------------------------                                      
$results = Get-ChildItem -Path C:\ -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match '^\d{14}_*'} | % {$_.FullName} | Add-Content $filename                                      
                                                                           

###OR                                                                           
#$results = Get-ChildItem -Path C:\ -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_*'} | % {$_.FullName} | Add-Content $filename 

                                                                           
# -------------------------------------                                      
# -------------------------------------                                      
# ------------------------------------- 

 

 
 

 



