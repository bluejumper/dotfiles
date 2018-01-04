#!/bin/sh

# This script will load the necessary VirtualBox kernel modules, before launching virtualbox.

sudo modprobe vboxdrv &
sudo modprobe vboxpci &
sudo modprobe vboxnetadp &
sudo modprobe vboxnetflt &

read -p "Start virtualbox? [y:n] " -n 1 ans

if [ $ans == "y" ]; then
  virtualbox &
fi