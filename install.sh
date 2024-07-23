#!/bin/bash

if [ "$(id -u)" == "0" ]; then
    echo "This script must not be run as root" >&2
    exit 1
fi

dir=$(pwd)

sudo uname -a

if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        kali)
            system="kali"
            ;;
        ubuntu)
            system="ubuntu"
            ;;
        arch)
            system="arch"
            ;;
        *)
            system="Unknown"
            echo "Warning: Unable to detect the operating system"
            ;;
    esac
else
    echo "Warning: Unable to detect the operating system"
    system="Unknown"
fi

folder="$dir/$system"
run_script="$folder/run.sh"

if [ -f "$run_script" ]; then
    bash "$run_script" "$folder"
else
    echo "Error: The script $run_script does not exist" >&2
    exit 1
fi
