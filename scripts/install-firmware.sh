#!/bin/bash

set -e


fw_archive="https://github.com/arkadin91/packages-sdm845/releases/download/OnePlus6T/firmware-oneplus-sdm845.tar.gz"
kernel_image="https://github.com/arkadin91/packages-sdm845/releases/download/OnePlus6T/linux-image-7.1.0-rc1-sdm845.deb"
kernel_headers="https://github.com/arkadin91/packages-sdm845/releases/download/OnePlus6T/linux-headers-7.1.0-rc1-sdm845.deb"

echo "Fetching firmware and kernel"
wget "$fw_archive" "$kernel_image" "$kernel_headers"
mkdir firmware

echo "Extracting firmware"
tar -C firmware -xzf $(basename "$fw_archive")
ls firmware/

echo "Installing firmware and kernel"
cp -RT firmware/* /usr
dpkg -i linux-image-7.1.0-rc1-sdm845.deb linux-headers-7.1.0-rc1-sdm845.deb

echo "Cleaning up"
rm -rf firmware
rm -f $(basename "$fw_archive")
rm -rf *.deb

echo "Done!"
