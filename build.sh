#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH
IMG_FILE="mobuntu-sdm845-`date +%Y%m%d`.img"
ARGS="--disable-fakemachine"
username=
password=

while getopts "up" opt
do
  case "$opt" in
    u ) username="$OPTARG" ;;
    p ) password="$OPTARG" ;;
  esac
done

if [ "$username" ]; then
  ARGS="$ARGS -t username:\"$username\""
fi

if [ "$password" ]; then
  ARGS="$ARGS -t password:\"$password\""
fi

ARGS="$ARGS --scratchsize=10G"

if [ ! "$image_only" ]; then
  debos $ARGS rootfs.yaml || exit 1
fi
debos $ARGS -t image:$IMG_FILE image.yaml

echo "Compressing partitions $IMG_FILE..."
gzip --keep --force $IMG_FILE
