<h4 align="center"> ESSW0000CF </h4>
<h3 align="center"> Linux Environment Configuration </h3>

> [!NOTE]
> The content of this repository may change over time. We recommend that you review it carefully to confirm that it is suitable for your systems and conditions.

> [!IMPORTANT]
> The code is open source and you can use it as you like and check it on your system. All the tests that have been done are confirmed in the "TEST" section so you can know in advance on which systems it is compatible.

> [!IMPORTANT]
> The WAN module enabled in polybar by default shows your public IP on the screen. A function will be added later to hide it easily, but for now, keep it in mind when taking screenshots or sharing screenshots.
> The purpose of this module is to know where your traffic is going when you are connected through a VPN and that is why it is enabled by default. However, if you don't have a VPN, it can be dangerous to share that information.
> To disable it, just go to the file `~/.config/polybar/config.ini` and delete `wan` from line 49.

<h3 align="center"> Description </h3>

This repository contains my personal Linux desktop configuration, primarily tested and supported on Kali Linux and Arch Linux.

<h3 align="center"> Requirements </h3>

The following requirements are needed for a successful installation:

- One of the supported systems (Kali Linux or Arch Linux)
- Internet connection
- Sudo privileges
- `git` installed on your system

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

<h3 align="center"> Functionality </h3>
The installation script performs the following tasks:

Yay Installation: Installs yay if not already installed. Yay is an AUR helper to install packages from the Arch User Repository.
System Update: Updates the system using pacman.
Package Installation: Installs various packages necessary for the desktop environment, including:
bspwm, sxhkd, polybar, feh, rofi, jq, gnome-terminal, xclip, dconf, bat, nitrogen, pango, xorg-server, xorg-xinit, picom, lightdm-gtk-greeter, dos2unix, wget, unzip, gnome-themes-standard.
Configuration Setup:
Converts scripts to Unix format.
Copies and sets permissions for configuration files for bspwm, sxhkd, polybar, picom.
Sets up bspwm to start with startx.
Installs Hack fonts.
Configures LightDM with GTK greeter.
Aliases and Additional Scripts: Adds useful aliases to the shell configuration file and copies additional scripts to /usr/bin.
LightDM Configuration: Enables and starts LightDM.

<h3 align="center"> TEST </h3>
This repository was successfully tested on:

Arch Linux minimal installation
Kali Linux
Other Debian-based systems could be compatible but have not been tested.

<h3 align="center"> PREVIEW </h3>

![Login Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/login.png)
![Desktop Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0001.png)
![Terminal Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0002.png)