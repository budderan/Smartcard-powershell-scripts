Powershell Script compiled as an EXE to  disable and enable the smartcard policy on a machine remotely by specifying the PC and then executing a command via Powershell.
This DOESN'T move it into another OU, it only changes a registery key until either there is a GP update (which occur periodically), until you finish the script or until the machine restarts and refreshes.

The script must be ran as an admin account as it uses the Powershell function to run a command remotely on another machine. 
(assuming group policy per your domain)
It is important that you keep the box open for the duration that you're remoted into the machine so you can confirmed finished and it will run the command to re enable the policy.
