#/bin/sh

set -x

rsync -avxHAX /opt/alsa/* /usr/share/alsa/
systemctl mask alsa-state alsa-restore
systemctl set-default graphical.target

rm -rf /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

apt-get -y autoremove --purge
apt clean
