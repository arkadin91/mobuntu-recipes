#/bin/sh

set -x

echo "Install firmware and kernel"
dpkg -i --force-overwrite /opt/*.deb

echo "Fix alsa-ucm-conf"
wget https://repo.mobian.org/pool/main/a/alsa-ucm-conf/alsa-ucm-conf_1.2.15.3-1mobian3_all.deb
dpkg -i --force-overwrite alsa-ucm-conf_1.2.15.3-1mobian3_all.deb

echo "Mask for workng speakers"
systemctl mask alsa-state alsa-restore
systemctl set-default graphical.target

echo "For working internet if, you wanna change image in chroot"
rm -rf /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "Clean packages"
apt-get -y autoremove --purge

echo "For resizing rootfs partition"
systemctl enable grow-rootfs.service
