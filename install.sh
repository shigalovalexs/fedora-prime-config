#! /bin/bash

echo "Copy configuration files"
cp -vr etc/* /etc

echo "Install Bibata Original Ice cursor theme"
wget -P /tmp https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.3/Bibata-Original-Ice.tar.gz
tar -xvf /tmp/Bibata-Original-Ice.tar.gz -C /usr/share/icons

echo "Update system databases"
dconf update

echo "Install Visual Studio Code and WineHQ repository"
wget -O /etc/yum.repos.d/vscode.repo https://packages.microsoft.com/yumrepos/vscode/config.repo
wget -O /etc/yum.repos.d/winehq.repo https://dl.winehq.org/wine-builds/fedora/$(rpm -E %fedora)/winehq.repo
dnf -y check-update

echo "Install RPM Fusion repository"
dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y check-update
dnf -y groupupdate core

echo "Install TLP"
dnf -y install tlp tlp-rdw
dnf -y remove power-profiles-daemon
systemctl enable --now tlp.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

echo "Install Visual Studio Code and WineHQ"
dnf -y install code winehq-stable

echo "Install Console"
dnf -y install gnome-console

echo "Install multimedia codecs"
dnf -y swap ffmpeg-free ffmpeg --allowerasing
dnf -y install intel-media-driver