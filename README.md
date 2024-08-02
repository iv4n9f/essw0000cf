<h4 align="center"> ESSW0000CF </h4>
<h3 align="center"> Linux Environment Configuration </h3>

![Author](https://img.shields.io/badge/Author-iv4n9f-purple?style=plastic&logo=github&logoColor=white)
![Version](https://img.shields.io/badge/Version-0.01-green?style=plastic&logo=git&logoColor=white)
![Language](https://img.shields.io/badge/Language-Bash-blue?style=plastic&logo=stackedit&logoColor=white)
![Status](https://img.shields.io/badge/Status-Working-yellow?style=plastic&logo=lineageos&logoColor=white)
![License](https://img.shields.io/badge/License-OpenSource-cyan?style=plastic&logo=creativecommons&logoColor=white)

> [!NOTE]
> The content of this repository is under development and is subject to change. Please verify that the content is compatible with your system and requirements.

> [!IMPORTANT]
> By default, the WAN module in Polybar displays your public IP address on the screen. We plan to add an option to hide it in future updates, but for now, please be cautious when taking or sharing screenshots, as it may reveal sensitive information.
> The WAN module is enabled by default to help you monitor your traffic's destination when connected through a VPN. However, if you are not using a VPN, sharing this information could pose a security risk.
> To disable the WAN module, open the file `~/.config/polybar/config.ini` and remove `wan` from line 49.

<h3 align="center"> Description </h3>

This repository contains my personal Linux desktop configuration, primarily tested and supported on Kali Linux and Arch Linux.

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

<h3 align="center"> Technologies </h3>

![Technologies](https://skillicons.dev/icons?i=linux,bash)

![Systems](https://skillicons.dev/icons?i=arch,kali)


<h3 align="center"> Content & Dependencies </h3>

Content :

```
X-Server                    -   Provides the graphical server for the Linux desktop environment.
LightDM Greeter             -   Sets up LightDM as the display manager with the GTK greeter.
Hack Nerd Fonts             -   Installs Hack Nerd Fonts for improved terminal and editor appearance.
bspwm                       -   A tiling window manager.
sxhkd                       -   A hotkey daemon to manage keyboard shortcuts.
polybar                     -   A fast and customizable status bar for X11.
feh                         -   An image viewer and wallpaper setter.
rofi                        -   A window switcher, application launcher, and more.
jq                          -   A lightweight command-line JSON processor.
gnome-terminal              -   A terminal emulator for GNOME.
xclip                       -   A command-line interface to X selections.
dconf                       -   A low-level configuration system.
bat                         -   A cat clone with syntax highlighting.
nitrogen                    -   A wallpaper setter.
pango                       -   A library for text layout and rendering.
xorg-server                 -   The X server for graphical operations.
xorg-xinit                  -   Tool for initializing the X Window System.
picom                       -   A lightweight compositor for X11.
dos2unix                    -   A utility to convert text files from DOS to Unix format.
wget                        -   A command-line utility to download files from the web.
unzip                       -   A utility to extract compressed files.
gnome-themes-standard       -   Standard themes for GNOME desktop environments.
Additional Shell Scripts    -   Adds various utility scripts and aliases to /usr/bin.
```

Requirements :

```
Supported System
Internet Connection         -   Required for downloading packages and updates.
Sudo Privileges             -   Necessary to install packages and modify system files.
Git                         -   Required to clone the repository.
```

<h3 align="center"> TEST </h3>

This repository was successfully tested on:

```
Arch Linux minimal installation
Kali Linux
Other Debian-based systems could be compatible but have not been tested.
```

<h3 align="center"> PREVIEW </h3>

![Login Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/login.png)
![Desktop Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0001.png)
![Terminal Screen](https://github.com/iv4n9f/essw0000cf/blob/main/images/0002.png)


<h3 align="center"> LICENSE </h3>

This project is licensed under the MIT License - see the [LICENSE](https://github.com/iv4n9f/essw0000cf/blob/main/LICENSE) file for details.