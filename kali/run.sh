#!/bin/bash

dir=$1
shell=$(echo $SHELL | rev | cut -d "/" -f 1 | rev)
user=$(whoami)

dos2unix $dir/../shared/bspwm/scripts/*
packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf-cli bat nitrogen libpango1.0-dev compton"
sudo apt-get install $packages -y
cp -r $dir/../shared/bspwm $HOME/.config/ && chmod +x $HOME/.config/bspwm/scripts/* && cp -r $dir/../shared/sxhkd $HOME/.config/ && cp -r $dir/../shared/polybar $HOME/.config/ && cp /etc/X11/xinit/xinitrc $HOME/.xinitrc && echo "exec bspwm" > $HOME/.xinitrc && chmod +x $HOME/.xinitrc && cp -r $dir/../shared/compton $HOME/.config/
mkdir -p $HOME/Downloads && cd $HOME/Downloads && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip" && unzip Hack.zip &&  sudo mkdir -p /usr/share/fonts/Hack && sudo cp *.ttf /usr/share/fonts/Hack/. && cd $dir
cat $dir/../shared/utils/alias >> $HOME/.$(echo $shell)rc
dos2unix $dir/../shared/utils/bin/* && sudo cp $dir/../shared/utils/bin/* /usr/bin/.

sudo chmod 775 /usr/bin/background && sudo chmod 775 /usr/bin/set_target
/usr/bin/set_target 8.8.8.8
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf