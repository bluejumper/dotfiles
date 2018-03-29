#!/bin/sh

# Storage
udisksctl mount -b /dev/disk/by-uuid/ca1402ae-4e97-495a-8838-db681f792f16
# dsk
udisksctl mount -b /dev/disk/by-uuid/28447F70447F3F9C
# sheepdog
sudo mount /dev/disk/by-uuid/126c9341-f461-4932-81b5-dbc998346a1c /mnt/usb1
