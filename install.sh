#!/bin/bash
set -euo pipefail

if [[ "$(id -u)" == "0" ]]; then
    echo "This script must not be run as root" >&2
    exit 1
fi

dir=$(dirname "$(readlink -f "$0")")

sudo uname -a

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    case "$ID" in
        kali|ubuntu|arch)
            system="$ID"
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

if [[ -x "$run_script" ]]; then
    bash "$run_script" "$folder"
else
    echo "Error: The script $run_script does not exist or is not executable" >&2
    exit 1
fi
