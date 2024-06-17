# Specify the computer you wish to access
$ComputerName = Read-Host "Please enter the name of the computer upon which wish to the disable smartcard policy"

# Define the script block to execute on the remote computer
$ScriptBlock = {
    # Set the value of the smartcard policy to 0 - Set this to 1 to revert it
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption -Value 0
    # Defines the new value as set above
    $newValue = Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption
        Write-Warning "Smartcard policy set to OFF for the duration of this window being open when ready to reset, please continue to re enable it. 
        DO NOT CLOSE THIS BOX UNTIL READY"
}

# Invoke the above script block on the remote computer
Invoke-Command -ComputerName $ComputerName -ScriptBlock $ScriptBlock -ErrorAction Stop

# continue once done to re enable?
Write-Warning "Are you sure you want to re enable the policy? Please confirm"
    # Double checks you are ready to re enable
        #$ContinueIf = Read-Host "Are you sure you want to renable this? please write -I am finished- to re enable the policy"  - Enable if a double check is needed
    
        #Re enables the smartcard policy by running the script block again but setting the value to 1
    Invoke-Command $ComputerName -ScriptBlock { Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption -Value 1 }
    #Tells you it's re enabled
    Write-Warning "Smartcard policy set to: $($newValue.scforceoption) Re enabled - you're safe"

# Run this command in a seperate powershell window to print out the current state of the computer at any time to check
# Invoke-Command $ComputerName -ScriptBlock { Get-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name scforceoption } 
# $($newValue.scforceoption)