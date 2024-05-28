# Specify the computer you wish to access
$ComputerName = Read-Host "Please enter the name of the computer you wish to Disable smartcard policy"

# Define the script block to execute on the remote computer
$ScriptBlock = {
    # Set smartcard policy to 0 - Set this to 1 to revert it
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption -Value 0
    # Optionally, you can retrieve the value after setting it
    $newValue = Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption
    Write-Output "Smartcard policy set to: $($newValue.scforceoption)"
}

# Invoke the command on the remote computer
Invoke-Command -ComputerName $ComputerName -ScriptBlock $ScriptBlock -ErrorAction Stop

# Run  to print out the current state to check
# Invoke-Command $ComputerName -ScriptBlock { Get-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption } 