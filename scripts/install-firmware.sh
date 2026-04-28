#!/bin/bash

set -e

echo "Fetching firmware"
fw_archive="https://gitlab.com/sdm845-mainline/firmware-oneplus-sdm845/-/archive/prepackaged-release/firmware-oneplus-sdm845-prepackaged-release.tar.gz"
wget "$fw_archive"
mkdir firmware
echo "Extracting firmware"
tar -C firmware -xzf $(basename "$fw_archive")
ls firmware/
echo "Installing firmware"
cp -RT firmware/* /usr
echo "Cleaning up"
rm -rf firmware
rm -f $(basename "$fw_archive")
echo "Done!"
