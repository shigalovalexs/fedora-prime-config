#! /bin/bash

echo "Copy configuration files"
cp -vr etc/* /etc

echo "Install Bibata Original Ice cursor theme"
wget -P /tmp https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.3/Bibata-Original-Ice.tar.gz
tar -xvf /tmp/Bibata-Original-Ice.tar.gz -C /usr/share/icons

echo "Update system databases"
dconf update

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
