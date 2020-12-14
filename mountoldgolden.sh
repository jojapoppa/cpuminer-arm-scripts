losetup -o 1048576 /dev/loop0 /media/usb/newgold.img
losetup -o 251658240 /dev/loop1 /media/usb/newgold.img
mount /dev/loop0 /root/oldgolden
mount /dev/loop1 /root/oldgolden2
