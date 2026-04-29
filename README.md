# mobuntu-recipes
 A set of debos recipes for building ubuntu-based image for mobile phones like a, OePlus 6/6T, Xiaomi Pocophone F1.

The default user is: 
- mobuntu with password 1234.

# Build

To build the image, you need to have debos. On a Debian-based system, install these dependencies by typing the following command in a terminal:

sudo apt install debos 

And open folder mobuntu-recipes and set, in terminal:

sudo bash build.sh

# Flashing image

Unlock bootloader in your device and, recreate partition table or flash userdata partition. Download edk2-msm, u-boot.
Set MassStorage and find partition: blkid | grep userdata

And set command:

sudo dd if=<mobuntu-image> of=/dev/<your-nr-partition> bs=1M status=progress

When flashing is over, reboot device and flash boot.img with fastboot.




