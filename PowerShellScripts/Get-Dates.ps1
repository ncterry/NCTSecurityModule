
#------------------------------------------------                                      

# This function is to grab/return the start and end dates in working format for searches. 

$startMonth=$startDay=$startYear=$startHour=$startMinute=$startSecond=$null 
$endMonth=$endDay=$endYear=$endHour=$endMinute=$endSecond=$null 

#------------------------------------------------                                      

# arrays for timeframe muser input to fall within                                      

$monthArry = 01..12                                                          
$dayArray = 01..31                                                          
$yearArray = 20..29                                                          
$hourArray = 00..23                                                          
$minuteArray = 00..59                                                          
$secondArray = 00..59                                                          

#------------------------------------------------                     

Write-Host "`n                                                          
-------------------                                                          
We will enter Dates/Times for an Event Log scan.                     
Example Date: 01/13/21 15:30:51                                      
---                                                          
Start Event Log Scan for ------- on:"                                      

#------------------------------------------------                                      

# Allow user to break from scan                                      
$choice = Read-Host "`nPress q + Enter to return to menu."                                      
# q Not implemented yet                                      

#------------------------------------------------                                      

do{$startMonth = Read-Host "`nEnter 2-digit starting month for scan:  [ 01 ] - [ 12 ]"} until (($startMonth -in $monthArry))                                      
do{$startDay = Read-Host "`nEnter 2-digit starting day for scan:  [ 01 ] - [ 31 ]"} until (($startDay -in $dayArray)) 
do{$startYear = Read-Host "`nEnter 2-digit starting year for scan:  [ 20 ] - [ 29 ]"} until (($startYear -in $yearArray)) 
do{$startHour = Read-Host "`nEnter 2-digit starting hour for scan:  [ 00 ] - [ 23 ]"} until (($startHour -in $hourArray)) 
do{$startMinute = Read-Host "`nEnter 2-digit starting minute for scan:  [ 00 ] - [ 59 ]"} until (($startMinute -in $minuteArray))                                                                           
do{$startSecond = Read-Host "`nEnter 2-digit starting second for scan:  [ 00 ] - [ 59 ]"} until (($startSecond -in $secondArray))                                                                           

#------------------------------------------------ 

Write-Host "`n                                      
Start scan on $startMonth/$startDay/$startYear $startHour`:$startMinute`:$startSecond" 

#------------------------------------------------ 

Write-Host "`n                                      
-------------------                                      
We will enter Dates/Times for an Event Log scan.                                      
Example Date: 01/13/21 15:30:51                                      
---                                                                           
END EventLog Scan for ------- on:"                                      
#------------------------------------------------                                      

do{$endMonth = Read-Host "`nEnter 2-digit ending month for scan:  [ 01 ] - [ 12 ]"} until (($endMonth -in $monthArry)) 
do{$endDay = Read-Host "`nEnter 2-digit ending day for scan:  [ 01 ] - [ 31 ]"} until (($endDay -in $dayArray)) 
do{$endYear = Read-Host "`nEnter 2-digit ending year for scan:  [ 20 ] - [ 29 ]"} until (($endYear -in $yearArray)) 
do{$endHour = Read-Host "`nEnter 2-digit ending hour for scan:  [ 00 ] - [ 23 ]"} until (($endHour -in $hourArray)) 
do{$endMinute = Read-Host "`nEnter 2-digit ending minute for scan:  [ 00 ] - [ 59 ]"} until (($endMinute -in $minuteArray))                                                    
do{$endSecond = Read-Host "`nEnter 2-digit ending second for scan:  [ 00 ] - [ 59 ]"} until (($endSecond -in $secondArray))                                                  

#------------------------------------------------ 

Write-Host "`n                                       
End scan on $endMonth/$endDay/$endYear $endHour`:$endMinute`:$endSecond"                       
#------------------------------------------------                                      

$begin = Get-Date -Date "$startMonth/$startDay/$startYear $startHour`:$startMinute`:$startSecond" 
$end = Get-Date -Date "$endMonth/$endDay/$endYear $endHour`:$endMinue`:$endSecond"  

#------------------------------------------------                                      
return $begin, $end                                      
#------------------------------------------------ 

#------------------------------------------------ 

 