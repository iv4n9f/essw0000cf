#!/bin/bash

dir=$1
shell=$(echo $SHELL | rev | cut -d "/" -f 1 | rev)
user=$(whoami)

packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf-cli bat nitrogen libpango1.0-dev"
sudo apt-get install $packages -y
cp -r $dir/../shared/bspwm $HOME/.config/ && cp -r $dir/../shared/sxhkd $HOME/.config/ && cp -r $dir/../shared/polybar $HOME/.config/ && cp /etc/X11/xinit/xinitrc $HOME/.xinitrc && echo "exec bspwm" > $HOME/.xinitrc && chmod +x $HOME/.xinitrc
mkdir -p $HOME/Downloads && cd $HOME/Downloads && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip" && unzip Hack.zip &&  sudo mkdir -p /usr/share/fonts/Hack && sudo cp *.ttf /usr/share/fonts/Hack/. && cd $dir
cat $dir/../shared/utils/alias >> $HOME/.$(echo $shell)rc
dos2unix $dir/../shared/utils/bin/* | sudo chown $user:$user $dir/../shared/utils/bin/* && chmod 775 $dir/../shared/utils/bin/* && sudo cp $dir/../shared/utils/bin/* /usr/bin/.
mkdir -p $HOME/Pictures && cp $dir/../shared/resources/wallpaper.png $HOME/Pictures/.
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf

