#! /bin/bash

echo "Copy configuration files"
cp -v -r etc/* /etc

echo "Update package cache"
dnf check-update

echo "Install TLP"
dnf install tlp tlp-rdw --assumeyes
dnf remove power-profiles-daemon
systemctl enable --now tlp.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

echo "Install Visual Studio Code and WineHQ"
dnf install code winehq-stable --assumeyes

echo "Install Console"
dnf install gnome-console --assumeyes
