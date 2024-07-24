#!/bin/bash

# Define variables
dir=$1
shell=$(echo $SHELL | rev | cut -d "/" -f 1 | rev)
user=$(whoami)

# List of packages to install
packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf-cli bat nitrogen libpango1.0-dev compton gnome-themes-standard"

# Install packages
sudo apt-get install $packages -y

# Convert scripts to Unix format
dos2unix $dir/../shared/bspwm/scripts/*

# Copy and configure configuration files
cp -r $dir/../shared/bspwm $HOME/.config/
chmod +x $HOME/.config/bspwm/scripts/*
cp -r $dir/../shared/sxhkd $HOME/.config/
cp -r $dir/../shared/polybar $HOME/.config/
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
echo "exec bspwm" > $HOME/.xinitrc
chmod +x $HOME/.xinitrc
cp -r $dir/../shared/compton $HOME/.config/

# Download and install Hack fonts
mkdir -p $HOME/Downloads
cd $HOME/Downloads
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
unzip Hack.zip
sudo mkdir -p /usr/share/fonts/Hack
sudo cp *.ttf /usr/share/fonts/Hack/.
cd $dir
sudo cp $dir/../shared/utils/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

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
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf
