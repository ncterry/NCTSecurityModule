  

# gather the local domain 
Function Get-ServerNames {  
<# 
    .SYNOPSIS 
    ... 

    .DESCRIPTION 
    ... 

    .EXAMPLE 
    ... 

    .OUTPUTS 
    ... 
#> 
[CmdletBinding()] 
Param( 
    [Parameter()] 
    [bool[]] 
    $writehost 
) #End param 

    If ($writehost -eq $true) { 
        Write-Host ("do something") 
    } # End If 
  

    $domain = Get-ADDomain –Current LocalComputer | Select-Object -ExpandProperty DNSRoot 
    # get all servers and associated attributes 
    # not all attributes are displayed here 
    $servers = Get-ADComputer -Filter {OperatingSystem -Like "Windows *Server*"} -Property * 
    $serverNames = @() 
    foreach ($server in $servers) { 
        Write-Progress -Activity "Server Check" -Status "Working..." 

        # View all listed properties of a server 
        Write-Host -ForegroundColor Yellow ("----------------") 
        Write-Host ("Name: " + $server.Name) 
        Write-Host ("DistinguishedName: " + $server.DistinguishedName) 
        Write-Host ("BadLogonCount: " + $server.BadLogonCount) 
        Write-Host ("DNSHostName: " + $server.DNSHostName) 
        Write-Host ("IPv4Address: " + $server.IPv4Address) 
        Write-Host ("OperatingSystem: " + $server.OperatingSystem) 
        Write-Host ("MemberOf: " + $server.MemberOf) 

  
        $serverNames += $server.Name 
    } #End foreach 

    return $serverNames   

} #End Function 



