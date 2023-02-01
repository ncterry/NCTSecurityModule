<# 

.\createComputerObject.ps1                           
Server>>Tools>>ActiveDirectory Users and Computers>>itFlee>>Office                       
We have a domain + AD                             
distinguishedName = DC=WidgetLLC, DC=Internal      
We have a main OU=itFlee                            
We have a sub OU=Office                            
distinguishedName = OU=Office, OU=itFlee,DC=WidgetLLC, DC=Internal                       
We have users in that office                     
distinguishedName = CN=Nate, OU=Office, OU=itFlee, DC=WidgetLLC, DC=Internal            
We want computers in there too                     
distinguishedName = CN=nctComputer, OU=Office, OU=itFlee, DC=WidgetLLC, DC=Internal      
Use this command to create that compuyer in that office, in this domain 
#> 

New-ADComputer -Name "nctComputer" -SAMAccountName "nctComputer" -Path "OU=Office, OU=itFlee, DC=WidgetLLC, DC=Internal" 



