<#
    PS:> gpedit.msc 

    Go to: 

        User Configuration >> Administrative Templates >> Windows PowerShell 

    Check "Enabled" 

    Set the results directory 

    Check "Include Invocation headers" 

    Click OK 

 

Now this will save transcripts for any action in PowerShell 

 

 

You can also add "Start-Transcript –Path $transcriptPath" to the PowerShell profile. 
#>



