# mobuntu-recipes
 A set of debos recipes for building a
ubuntu-based image for mobile phones like a, OePlus 6/6T, Xiaomi Pocophone F1.

The default user is: 
- mobuntu with password 1234.

# Build

To build the image, you need to have debos. On a Debian-based system, install these dependencies by typing the following command in a terminal:

sudo apt install debos xz-util android-sdk-libsparse-utils yq mkbootimg

And open folder mobuntu-recipes and set, in terminal:

sudo bash build.sh

# Install

In this case, we not converting to the sparse android img. Only flashing building, if you have rooted device download edk2-msm or u-boot.




