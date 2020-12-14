#make kernelversion gives us 4.16.1

SEE: https://github.com/150balbes/Amlogic_S905-u-boot

#help as here, https://tinkering-is-fun.blogspot.com/2019/02/espressobin-rebuilding-kernel-based-on.html

#skip this
#this runs from scripts folder 
./mkuboot.sh -A arm -O linux -C none -T kernel -a 0x80008000 -e 0x80008000 -n 'Linux-4.16.1' -d /root/Amlogic_s905-kernel/arch/arm64/boot/Image /root/Amlogic_s905-kernel/arch/arm64/boot/uImage 

#DO THIS INSTEAD

#in arm64/boot create tmp folder
#in install.sh comment out section "User may have custom install script" ... we will install to tmp
./install.sh 4.16.1 Image /root/Amlogic_s905-kernel/System.map tmp
#or... (not sure which!)
make INSTALL_MOD_PATH=tmp modules_install

#files in tmp useful for /boot
cp the tmp files into /lib/modules (needed later for mkinitramfs)

#no didn't help... but somehow something went in there...
#cp vmlinux-4.16.1 /lib/modules/4.16.1/
#cp System.map-4.16.1 /lib/modules/4.16.1/

#from /boot folder of build dir (Image is renamed to vmlinuz)
dd if=Image of=/root/gold/vmlinuz-4.16.1

mkinitramfs -r /dev/root -c gzip -o initrd.img 4.16.1
cp that over to gold/boot as initrd.img-4.16.1

#run this from a temp folder with the initrd.img file in there...
sudo mkimage -A arm -O linux -T ramdisk -a 0x0 -e 0x0 -n initrd.img-4.16.1 -d initrd.img-4.16.1 uInitrd-4.16.1
#cp that over to gold/boot as uInitrd

#this runs from the /boot folder
mkbootimg --kernel /root/Amlogic_s905-kernel/arch/arm64/boot/Image.gz --ramdisk initrd.img-4.16.1 -o new_boot.img
#(that gets renamed to linux.img for gold/boot

