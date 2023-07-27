!/usr/bin/env bash
# 0n1cOn3 - 2023 | Prepare system for chroot environemnt
mkdir /rescue
lsblk
read -p "Write the defective OS partition you wanna mount and hit enter: " partition
mount /dev/$partition /rescue
read -p "Write the EFI partition to mount and hit enter: " efi
mount /dev/$efi /rescue/boot
# initalising chroot variables
mount -t proc proc /rescue/proc
mount -t sysfs sys /rescue/sys
mount -o bind /dev /rescue/dev
mount -t devpts pts /rescue/dev/pts
mount -o bind /run /rescue/run
ln -s /etc/resolv.conf /rescue/etc/resolv.conf
#
echo "the chroot environment is ready. To start, type 'chroot /rescue'."
echo "To unmount chroot when you done, type 'unmount /rescue'
exit 0
