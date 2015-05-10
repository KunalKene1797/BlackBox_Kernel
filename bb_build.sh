#
# Copyright © 2015, Varun Chitre "kunalkene1797" <kunalkene1797@gmail.com>
#
# Custom build script for BlackBox Kernel's
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#
# Init Script
KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/arch/arm/boot/zImage
BUILD_START=$(date +"%s")
# Color Code Script
red='\033[0;31m'
yellow='\033[0;33m'
# Tweakable Options Below
export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER="kunalkene1797"
export KBUILD_BUILD_HOST="Perilous-Beast"
# Compilation Scripts Are Below
compile_kernel ()
{
echo -e "***********************************************"
echo -e "         Compiling BlackBox kernel             "
echo -e "***********************************************"
make $codename$_defconfig
make
if ! [ -a $ZIMAGE ];
then
echo -e "$red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi
}
# Finalizing Script Below
case $1 in
clean)
make ARCH=arm -j8 clean mrproper
rm -rf include/linux/autoconf.h
;;
*)
compile_kernel
;;
esac
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
