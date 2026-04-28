#/bin/sh

set -x

apt-get update
apt-get full-upgrade -y
apt-get install -y pipewire* alsa* zstd zarchive-tools
apt purge -y alsa-hdspe*
rm -rf /etc/kernel/postinst.d/dkms
dpkg -i --force-overwrite /opt/*.deb
apt-get install -y linux-image-6.18-sdm845 linux-headers-6.18-sdm845
