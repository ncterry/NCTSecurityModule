<# 

find event-viewer >> windows logs >> security                                      

Check for events with the evntID 4624                                      

Print out correlating machinenames that are attached to that login event 

#> 

                                      
                                                                           

$begin = Get-Date -Date '12/22/2020 11:00:00'                                      

$end = Get-Date -Date '1/5/2021 16:00:00'                                      

$logs = Get-EventLog -LogName Security -InstanceId 4624 -After $begin -Before $end                     

$logs | Select-Object -Property MachineName                                       

 



