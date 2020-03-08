#!/usr/bin/env bash

set -x

# disable firstboot setup
systemctl disable hypersolid-firstboot.service

# enable autologin (via override config)
systemctl enable getty@tty1.service

# additional mountpoints
mkdir /mnt/data