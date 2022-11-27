<# 

Server Manager>>Tools>>Active Directory Users and Computers>> 
Then select target OU, right click, Properties 
Select: Attribute editor >> distinguishedName 

#> 

Get-ADUser -SearchBase "OU=Office, OU=itFlee, DC=WidgetLLC, DC=Internal" -Filter * 

 



