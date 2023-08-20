#!/usr/bin/env bash

set -x

# disable firstboot setup
systemctl disable hypersolid-firstboot.service

# enable autologin (via override config)
systemctl enable getty@tty1.service

# additional mountpoints
mkdir /mnt/data

# acpid
systemctl enable acpid.service

# systemd network management
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl disable smartmontools.service

# systemd managed resolve.conf
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
