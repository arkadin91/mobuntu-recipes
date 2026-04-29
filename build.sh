#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH
IMG_FILE="mobuntu-sdm845-`date +%Y%m%d`.img"
ARGS="--disable-fakemachine"

ARGS="$ARGS --scratchsize=10G"

if [ ! "$image_only" ]; then
  debos $ARGS rootfs.yaml || exit 1
fi
debos $ARGS -t image:$IMG_FILE image.yaml

