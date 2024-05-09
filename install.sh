#!/bin/bash

if [ "$(id -u)" == "0" ]; then
    echo "This script must be run as sudo user" >&2
    exit 1
fi

dir=$(pwd)

sudo uname -a

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "kali" ]; then
        system="kali"
    elif [ "$ID" = "ubuntu" ]; then
        system="ubuntu"
    else
        system="Unknown"
    fi
else
    echo "Warning: Unable to detect the operating system"
    system="Unknown"
fi

folder=$dir/$system/
$dir/$system/run.sh $folder

