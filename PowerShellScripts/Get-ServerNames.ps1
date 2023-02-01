function Get-ServerNames                                      
{                                      
<#                                      
    .SYNOPSIS                                      

    .DESCRIPTION                                      

    .EXAMPLE                                      

    .OUTPUTS                                       

#>                                      
[CmdletBinding()]                                      
Param (                                      
    [Parameter()]                                      
    [bool[]]                                      
    $writehost                                      
) #end param                                      
                                                                         
    #gather local domain                                                      
    $domain = Get-ADDomain -Current LocalComputer | Select-Object -ExpandProperty DNSRoot    
                                                                           
    If ($writehost -eq $true)                                       
    {                                                                           
        Write-Host -ForegroundColor Yellow ("Domain:  $domain")                              
    } #end if                                                                           
                                                                           
    # get all servers and associated attributes                                      
    $servers = get-ADComputer -Filter {OperatingSystem -Like "Windows *Server*"} -Property * 
    $serverNames = @()                                                                       
    foreach ($server in $servers)                                      
    {                                                                           
        Write-Progress -Activity "Server check" -Status "Working..."                        
        If ($writehost -eq $true)                                      
        {                                                                           
            Write-Host ("Name: $server.Name")                                      
            Write-Host ("DistinguishedName: $server.DistinguishedName")                      
            Write-Host ("BadLogonCount: $server.BadLogonCount")                              
            Write-Host ("CannotChangePassword: $server.CannotChangePassword")                
            Write-Host ("DNSHostName: $server.DNSHostName")                                 
            Write-Host ("IPv4Address: $server.IPv4Address")                                 
            Write-Host ("OperatingSystem: $server.OperatingSystem")                          
            Write-Host ("MemberOf: $server.MemberOf")                                      
        }#end if                                                                           
                                                                                              
        $serverNames += $server.Name                                                                                                                 

    } #end foreach                                                                           
                                                                           

    return $serverNames                                                                                                                                                   

}#END FUNCTION                                                                           

 



