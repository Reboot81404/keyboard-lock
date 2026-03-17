## Notes 

- Place the `Desktop` folder and `keyboard-toggle.sh` script in your home directory.  

- The `app-icons` folder should be located at `/home/User/.local/share/app-icons`, or you can choose another location if desired.

- This script works on Linux: x11 , but the icon change functionality only works in KDE.

> **IMPORTANT:** You need to update the `ID` parameter in the script to match your keyboard's ID.  
> Use the command:
> ```
> xinput list | grep -i keyboard
> ```

- You can also add aplication launcher with  this command
> ```
> cp ~/Desktop/Keyboard\ Lock ~/.local/share/applications/keyboard-lock.desktop
> ```

