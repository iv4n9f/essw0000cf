#!/bin/bash

dir=$1
shell=$(echo $SHELL | rev | cut -d "/" -f 1 | rev)
user=$(whoami)

# Install yay if not already installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Proceeding with installation."
    sudo pacman -S --noconfirm --needed base-devel git
    cd $HOME
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd $dir
else
    echo "yay is already installed."
fi

sudo pacman -Syu --noconfirm

# List of packages to install on Arch Linux
packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf bat nitrogen pango xorg-server xorg-xinit picom lightdm-gtk-greeter dos2unix wget unzip gnome-themes-standard"
sudo pacman -S --noconfirm $packages

# Convert scripts to Unix format
dos2unix $dir/../shared/bspwm/scripts/*

# Copy and set permissions for configuration files
chmod +x  $dir/../shared/bspwm/bspwmrc && chmod +x  $dir/../shared/bspwm/scripts/*
cp -r $dir/../shared/bspwm $HOME/.config/
cp -r $dir/../shared/sxhkd $HOME/.config/
chmod +x $dir/../shared/polybar/launch.sh && chmod +x $dir/../shared/polybar/modules/*
cp -r $dir/../shared/polybar $HOME/.config/
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
echo "exec bspwm" > $HOME/.xinitrc
chmod +x $HOME/.xinitrc
cp -r $dir/../shared/picom $HOME/.config/

# Download and install Hack fonts
mkdir -p $HOME/Downloads
cd $HOME/Downloads
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
unzip Hack.zip
sudo mkdir -p /usr/share/fonts/Hack
sudo cp *.ttf /usr/share/fonts/Hack/.
cd $dir
sudo cp $dir/../shared/utils/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp $dir/../shared/img $HOME/.


# Add aliases to the shell configuration file
cat $dir/../shared/utils/alias >> $HOME/.$(echo $shell)rc

# Convert additional scripts to Unix format and copy them to /usr/bin
dos2unix $dir/../shared/utils/bin/*
sudo cp $dir/../shared/utils/bin/* /usr/bin/.

# Set permissions for scripts in /usr/bin
sudo chmod 775 /usr/bin/background
sudo chmod 775 /usr/bin/set_target

# Execute additional scripts
/usr/bin/set_target 8.8.8.8
chmod +x $dir/../shared/utils/gnome-terminal.sh
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf

sudo systemctl enable lightdm && sudo systemctl start lightdm
