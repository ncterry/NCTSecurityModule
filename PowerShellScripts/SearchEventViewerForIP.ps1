<#                                        
Open Event viewer 
If from PowerShell or CMD > eventvwr.exe 
Select the event logs you want to save. Specific or all of Security 
'Action' >> 'Save All Events As' 
We saved as an XML, which worked with this 
#>                                         

#                                       
#                                       
#                                       
# Could be any path, just the example XML file that we saved from Event Viewer 
$path = "C:\Users\Administrator\Desktop\eventlogsXML.xml"  

# This will allow for similar matches 
# Ex.  \user.1.22.141.23432432asdf also will fit this filter 
$IPRegex = "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"  

# Create array to hold all found IPv4
$ipadds = @()  

<# 
Get file from input path 
Grab any string in the file tha tmatches the pattern 
Trim off excess and only leave the matching value 
#> 
$ipadd = Get-Content $path | Select-String -Pattern $IPRegex -AllMatches | % {$_.Matches} 

# Add that matching value to the array 
$ipadds += $ipadd.value 

# Print to terminal in a grouping of how many times each IP is found 
$ipadds | Group-Object 

# Now select only unique values. Narrow down extras of the same IPv4 
$ipadds = $ipadds | Select -Unique 

# Print the array to terminal. Long you will find it all with the group. 
$ipadds  

foreach ($ip in $ipadds) 
{ 
    $ipadd = Get-Content $path | Select-String -Pattern $ip -AllMatches 
    $ipadd.Line 
} 

 



