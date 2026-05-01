#!/bin/sh

set -eu

echo "Install firmware"
dpkg -i --force-overwrite /opt/*.deb

echo "Install kernel mobian-6.18-sdm845"
apt-get install -y linux-image-6.18-sdm845 linux-headers-6.18-sdm845

echo "Fix alsa-ucm-conf"
wget https://repo.mobian.org/pool/main/a/alsa-ucm-conf/alsa-ucm-conf_1.2.15.3-1mobian3_all.deb
dpkg -i --force-overwrite alsa-ucm-conf_1.2.15.3-1mobian3_all.deb
apt-mark hold alsa-ucm-conf

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

echo "Enabling shell-extensions"
gnome-extensions enable aurora-shell@luminusos.github.io
gnome-extensions enable touchup@mityax
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

echo "For resizing rootfs partition"
systemctl enable grow-rootfs.service
