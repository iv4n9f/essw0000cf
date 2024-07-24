<h4 align="center"> ESSW0000CF </h4>
<h3 align="center"> Linux Environment Configuration </h3>

> [!NOTE]
> The content of this repository is under development and is subject to change. Please verify that the content is compatible with your system and requirements.
> [!IMPORTANT]
> By default, the WAN module in Polybar displays your public IP address on the screen. We plan to add an option to hide it in future updates, but for now, please be cautious when taking or sharing screenshots, as it may reveal sensitive information.
> The WAN module is enabled by default to help you monitor your traffic's destination when connected through a VPN. However, if you are not using a VPN, sharing this information could pose a security risk.
> To disable the WAN module, open the file ~/.config/polybar/config.ini and remove wan from line 49.

<h3 align="center"> Description </h3>

This repository contains my personal Linux desktop configuration, primarily tested and supported on Kali Linux and Arch Linux.

<h3 align="center"> Content & Dependencies </h3>

Content
This repository includes a setup script for configuring a Linux desktop environment on Linux. The script performs the following tasks:

Installation of Yay: Installs yay, an AUR helper for managing packages from the Arch User Repository. (On Arch system)
System Update: Updates system packages to their latest versions.
Package Installation: Installs essential packages for the desktop environment, including:
Window managers and utilities (bspwm, sxhkd, polybar, feh, rofi, etc.).
Configuration Setup:
Configures bspwm, sxhkd, polybar, and picom.
Sets up LightDM for display management.
Installs and configures Hack Nerd Fonts for better terminal and editor appearance.
Utility Scripts: Adds shell aliases and utility scripts to /usr/bin.

Requirements
To run the script, you need:
Supported System
Internet Connection: Required for downloading packages and updates.
Sudo Privileges: Necessary to install packages and modify system files.
Git: Required to clone the repository.
Yay: An AUR helper; the script will install it if it's not already present.
Hack Nerd Fonts: Included in the setup to enhance font support for terminals and code editors.

<h3 align="center"> Installation </h3>

For installation, you can follow the instructions below:

```bash
cd ~
mkdir rep
cd rep
git clone https://github.com/iv4n9f/essw0000cf
cd essw0000cf
chmod +x install.sh
./install.sh
```

Or use the one-liner:

```
cd ~ && mkdir rep && cd rep && git clone https://github.com/iv4n9f/essw0000cf && cd essw0000cf && chmod +x install.sh && ./install.sh
```

<h3 align="center"> TEST </h3>
This repository was successfully tested on:

Arch Linux minimal installation
Kali Linux
Other Debian-based systems could be compatible but have not been tested.

<h3 align="center"> PREVIEW </h3>

![Login Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/login.png)
![Desktop Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0001.png)
![Terminal Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0002.png)


<h3 align="center"> LICENSE </h3>

This project is licensed under the MIT License - see the LICENSE(LICENSE) file for details.