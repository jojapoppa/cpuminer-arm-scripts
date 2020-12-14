e2label /dev/loop1 ROOTFS

fatlabel /dev/loop0 BOOT
mlabel -i /dev/loop0
