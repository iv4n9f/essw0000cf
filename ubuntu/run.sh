#!/bin/bash

dir=$1
shell=${SHELL##*/}

# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependencias esenciales
sudo apt install -y git build-essential curl wget unzip dos2unix

# Instalar paquetes necesarios en Ubuntu
packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf-cli bat nitrogen xorg picom lightdm lightdm-gtk-greeter dos2unix wget unzip fonts-hack-ttf gnome-themes-extra"
sudo apt install -y $packages

# Convertir scripts a formato Unix
dos2unix $dir/../shared/bspwm/scripts/*

# Copiar y establecer permisos para archivos de configuración
chmod +x  $dir/../shared/bspwm/bspwmrc && chmod +x  $dir/../shared/bspwm/scripts/*
mkdir -p $HOME/.config/bspwm
cp -r $dir/../shared/bspwm/* $HOME/.config/bspwm/
mkdir -p $HOME/.config/sxhkd
cp -r $dir/../shared/sxhkd/* $HOME/.config/sxhkd/
chmod +x $dir/../shared/polybar/launch.sh && chmod +x $dir/../shared/polybar/modules/*
mkdir -p $HOME/.config/polybar
cp -r $dir/../shared/polybar/* $HOME/.config/polybar/
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
echo "exec bspwm" > $HOME/.xinitrc
chmod +x $HOME/.xinitrc
mkdir -p $HOME/.config/picom
cp -r $dir/../shared/picom/* $HOME/.config/picom/

# Descargar y descomprimir las fuentes Hack
mkdir -p $HOME/Downloads
cd $HOME/Downloads
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
unzip Hack.zip -d hack-fonts
sudo mkdir -p /usr/share/fonts/truetype/hack
sudo cp hack-fonts/*.ttf /usr/share/fonts/truetype/hack/.
sudo fc-cache -f -v  # Refrescar caché de fuentes

# Descargar y copiar temas de Rofi
git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp themes/* ~/.local/share/rofi/themes/
cd $dir
sudo cp $dir/../shared/utils/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -r $dir/../shared/img $HOME/.

# Añadir alias al archivo de configuración del shell
cat $dir/../shared/utils/alias >> $HOME/.$(echo $shell)rc

# Convertir scripts adicionales a formato Unix y copiarlos a /usr/local/bin
dos2unix $dir/../shared/utils/bin/*
sudo cp $dir/../shared/utils/bin/* /usr/local/bin/.

# Establecer permisos para los scripts en /usr/local/bin
sudo chmod 775 /usr/local/bin/background
sudo chmod 775 /usr/local/bin/set_target

# Ejecutar scripts adicionales
/usr/local/bin/set_target 8.8.8.8
chmod +x $dir/../shared/utils/gnome-terminal.sh
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf

# Habilitar y iniciar lightdm
sudo systemctl enable lightdm && sudo systemctl start lightdm
