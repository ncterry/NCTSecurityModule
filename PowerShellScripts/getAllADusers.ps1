Get-ADUser -Filter * 

# Or just gather usernames 
Get-ADUser -Filter * | Select-Object -Property Name 

Get-ADUser -Filter {name -like "*nate*"} 

# We only listed 3 properties, and picked a known user. Many more possibilities.  
Get-ADUser ncterry -Properties * | Select-Object name, title, department 

Get-ADUser Administrator -Properties * | Select-Object name, title, department 

 



