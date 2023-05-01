
<#
List running processes: 

Use the Get-Process cmdlet to list all running processes, 
their resource usage, and other details.

In PowerShell, you can use the Get-Process cmdlet to retrieve 
the running processes, store the results in a variable, and then 
use a for loop to print the results. 

In this example, the Get-Process cmdlet is used to get the list of 
running processes, which is then stored in the $processes variable. 
A foreach loop is used to iterate through the processes in the 
$processes variable, and the details of each process 
(such as name, ID, CPU time, and memory usage) are printed using 
the Write-Host cmdlet.

Here's an example:
#>

# Get the running processes and store them in a variable
$processes = Get-Process

# Use a for loop to iterate through the processes and print their details
foreach ($process in $processes) {
    Write-Host "Process Name: $($process.Name)"
    Write-Host "Process ID: $($process.Id)"
    Write-Host "CPU Time: $($process.CPU)"
    Write-Host "Memory (Working Set): $($process.WorkingSet64)"
    Write-Host "------"
}
