#!/usr/bin/env bash

set -x

# disable firstboot setup
systemctl disable hy-firstboot.service

# enable autologin (via override config)
systemctl enable getty@tty1.service