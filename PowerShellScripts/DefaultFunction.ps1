
# gather the local domain 
#--------------------------------------------------------------- 

Function Get-functionName{  
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
#--------------------------------------------------------------- 
[CmdletBinding()] 
Param( 
    [Parameter()] 
    [bool[]] 
    $writehost 
) #End param 
 #--------------------------------------------------------------- 
    If ($writehost -eq $true) { 
        Write-Host ("do something") 
    } # End If 

      #return $something 

  

} #End Function 
#--------------------------------------------------------------- 