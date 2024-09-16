#!/bin/bash

dir=$1
shell=$(echo $SHELL | rev | cut -d "/" -f 1 | rev)
user=$(whoami)

# Actualiza los paquetes del sistema
sudo apt update && sudo apt upgrade -y

# Listado de paquetes a instalar en Kali Linux, incluyendo xrdp para RDP
packages="bspwm sxhkd polybar feh rofi jq gnome-terminal xclip dconf-cli bat nitrogen xorg lightdm-gtk-greeter dos2unix wget unzip picom xrdp"

sudo apt install -y $packages

# Configurar xrdp en el puerto 5039
sudo sed -i 's/3389/5039/g' /etc/xrdp/xrdp.ini

# Habilitar y reiniciar xrdp
sudo systemctl enable xrdp
sudo systemctl restart xrdp

# Convertir scripts al formato Unix
dos2unix $dir/../shared/bspwm/scripts/*

# Copiar y establecer permisos para los archivos de configuración
chmod +x  $dir/../shared/bspwm/bspwmrc && chmod +x  $dir/../shared/bspwm/scripts/*
cp -r $dir/../shared/bspwm $HOME/.config/
cp -r $dir/../shared/sxhkd $HOME/.config/
chmod +x $dir/../shared/polybar/launch.sh && chmod +x $dir/../shared/polybar/modules/*
cp -r $dir/../shared/polybar $HOME/.config/
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
echo "exec bspwm" > $HOME/.xinitrc
chmod +x $HOME/.xinitrc
cp -r $dir/../shared/picom $HOME/.config/

# Descargar e instalar las fuentes Hack
mkdir -p $HOME/Downloads
cd $HOME/Downloads
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
unzip Hack.zip
sudo mkdir -p /usr/share/fonts/Hack
sudo cp *.ttf /usr/share/fonts/Hack/.
cd $dir
cd $HOME/Downloads
git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp themes/* ~/.local/share/rofi/themes/
cd $dir
sudo cp $dir/../shared/utils/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp -r $dir/../shared/img $HOME/.

# Agregar alias al archivo de configuración de la shell
cat $dir/../shared/utils/alias >> $HOME/.$(echo $shell)rc

# Convertir scripts adicionales al formato Unix y copiarlos a /usr/bin
dos2unix $dir/../shared/utils/bin/*
sudo cp $dir/../shared/utils/bin/* /usr/bin/.

# Establecer permisos para los scripts en /usr/bin
sudo chmod 775 /usr/bin/background
sudo chmod 775 /usr/bin/set_target

# Ejecutar scripts adicionales
/usr/bin/set_target 8.8.8.8
chmod +x $dir/../shared/utils/gnome-terminal.sh
$dir/../shared/utils/gnome-terminal.sh $dir/../shared/utils/gnome.conf

sudo systemctl enable lightdm && sudo systemctl start lightdm
