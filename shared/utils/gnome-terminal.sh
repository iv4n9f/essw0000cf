#!/bin/bash

gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
dconf load /org/gnome/terminal/legacy/profiles:/ < $1