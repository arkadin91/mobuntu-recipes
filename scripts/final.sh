#!/bin/sh

set -eu

echo "Install firmware, kernel and firefox-esr"
dpkg -i --force-overwrite /opt/*.deb

echo "Fix alsa-ucm-conf"
wget https://gitlab.com/sdm845-mainline/alsa-ucm-conf/-/archive/sdm845-phones/alsa-ucm-conf-sdm845-phones.tar.gz
tar -xvzf alsa-ucm-conf-sdm845-phones.tar.gz -C /usr/share/alsa/
rm -rf alsa-ucm-conf-sdm845-phones.tar.gz 

echo "Mask for workng speakers"
systemctl mask alsa-state alsa-restore

echo "For working internet if, you wanna change image in chroot"
rm -rf /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "Install gnome-shell-extensions"
apt-get install -y gnome-shell-extension-manager gnome-shell-extensions

echo "Clean packages"
apt-get -y autoremove --purge

echo "Disable verify gnome-shell-extension"
gsettings set org.gnome.shell disable-extension-version-validation true

echo "Force scale 3.0"
glib-compile-schemas /usr/share/glib-2.0/schemas

echo "For resizing rootfs partition"
systemctl enable grow-rootfs.service
