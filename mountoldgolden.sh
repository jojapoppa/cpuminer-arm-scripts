fdisk -l /media/usb/golden.img
echo "start * 512 is our offset to partition 2"
mount -o loop,offset=101711872 /media/usb/golden.img /root/golden/

... similar thing for gold.img

(offset is again from fdisk -l /media/usb/gold.img)
(512 * offset for partition = #)
losetup -o251658240 /dev/loop1 /media/usb/gold.img
mkfs.ext4 /dev/loop1

the later loopback needs to be a rootfs ... like this
mkfs.ext4 -m 0 -N 75000 /dev/loop3

(marks 2nd partition as the rootfs)
e2label /dev/loop3 ROOTFS

if the new partition is smaller... copy data with rsync...
cp -av src/* dest
then...
rsync -aHAX golden/* gold

later...
umount /root/blah
losetup -D

remember: block devices like an ssd drive just mount directly
(no loopback with losetup...)
mount /dev/mmcblk1p1 /root/gold

