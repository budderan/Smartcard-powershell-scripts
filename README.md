# Smartcard-powershell-scripts
A powershell script / exe to remotely turn off the group policy for smartcards to allow for logging in with a generic windows account

Scripts to disable or enable the smartcard policy on a machine remotely by specifying the PC and then executing a command via Powershell.

Created by Owen 28/05/2024 following on from Trevor recommending us to change the smartcard policy as smartcards were not working. 

______________________________________________________

Run scripts for enabling or disabling the policy by choosing the disabler or enabler scripts; 

*Shift right clicking
*Run as different User
*Login via ZCA account

Specify the PC you would like to disable the smartcard policy on by the name - ie ASFLTD037O3

The script will now set that to 0 and tell you the output. 
It can then be closed and it has completed.

Once the script has been run, this will be active until the computer next has a group policy update, so you don't *have* to run the enabler, but it's there to be sure.

