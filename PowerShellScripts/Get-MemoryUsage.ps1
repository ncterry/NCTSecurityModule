<#
Monitor CPU and memory usage: 
Use the Get-Counter cmdlet to monitor CPU, 
memory, and other performance metrics.
#>

Get-Counter -Counter "\Processor(_Total)\% Processor Time", "\Memory\Available MBytes"


<#
Timestamp                  CounterSamples                                                
---------                  --------------                                                
4/30/2023 7:21:20 PM       \\nctdell\processor(_total)\% processor time :                
                           1.2693339244418                                               
                                                                                         
                           \\nctdell\memory\available mbytes :                           
                           21723    
#>