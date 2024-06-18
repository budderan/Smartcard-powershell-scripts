Powershell Script compiled as an EXE to  disable and enable the smartcard policy on a machine remotely by specifying the PC and then executing a command via Powershell.
This DOESN'T move it into another OU, it only changes a registery key until either there is a GP update (which occur periodically), until you finish the script or until the machine restarts and refreshes.

The script must be ran as an admin account as it uses the Powershell function to run a command remotely on another machine. 
(assuming group policy per your domain)
It is important that you keep the box open for the duration that you're remoted into the machine so you can confirmed finished and it will run the command to re enable the policy.

Run the EXE by;
*Shift right clicking
*Run as different User
*Login via ZCA account

Specify the PC you would like to disable the smartcard policy on by the name - ie ASCWSL03094


The script will now set the policy to 0, telling you the output, then warn you to keep the box open until you are ready to disconnect and turn the policy back on.


It then prompts you to continue "please enter I am finished to re enable"


and then runs the command to re enable the policy
and then confirms it's reset and can be closed.



