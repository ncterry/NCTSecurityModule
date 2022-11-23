 

#----------------------------------------               
# This grabs search dates from get-dates function/file 
# Then grabs all security logs between those dates 
# then returns the iniital user choice, and ALL collected logs  

function date-menu                                   
{                                                     
    Write-Host                                       
    ("                                               
    1) Scan logs over selected Dates: Type 1 + Enter                                      
    2) Scan All logs: Type 2 + Enter                                      
    q) Press 2 + Enter to return to quit                                      
    ")                                               

} # End Date-menu                                      
#----------------------------------------                                      
# To use in order to reach accompanying functions if they have not been pushed in memory 
$gl = Get-Location                                      
#----------------------------------------                                      
do                                                                           
{                                                                           
    date-menu                                                                           
    $choice = Read-Host "Enter Choice:"                                      
    Clear-Host                                                                           
    $choice = $choice -replace '\s', ''  #avoid extra user spaces 
#----------------------------------------                                      
    # If user input is ok                                      
    switch ($choice)                                      
    {                                                                           
        '1'                                                                           
        {                                                                           
            # Scan through logs based on dates.                                      
            $begin, $end = ."$gl\get-dates.ps1"                                      
            Write-Host ("Collecting logs...")                                      
            $logs = Get-EventLog -LogName Security -After $begin -Before $end 
            $choice = 1 # Prevent choice overwrite from get-dates.ps1 
        } #end 1                                                                           
#----------------------------------------                                      
        '2'                                                                           
        {                                                                           
            #Scan through all logs                                                         
            Write-Host ("Collecting logs...")                                      
            $logs = Get-EventLog -LogName Security                                      
        } #end 2 #----------------------------------------                                 

    } #end switch #----------------------------------------                                 
} until (($choice -eq '1' -or $choice -eq '2' -or $choice -eq 'q'))                         

#----------------------------------------                                      

return $choice, $logs                                                                      

#----------------------------------------                                      

 
 

 



