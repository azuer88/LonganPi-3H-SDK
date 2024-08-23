chroot "$1" useradd --home-dir /home/$USER_NAME --create-home $USER_NAME --shell /bin/bash
echo "Executing: echo $USER_NAME:$USER_PASS | chroot \"$1\" chpasswd"
echo $USER_NAME:$USER_PASS | chroot "$1" chpasswd
chroot "$1" usermod -a -G dialout $USER_NAME
chroot "$1" usermod -a -G cdrom $USER_NAME
chroot "$1" usermod -a -G audio $USER_NAME
chroot "$1" usermod -a -G video $USER_NAME
chroot "$1" usermod -a -G plugdev $USER_NAME
chroot "$1" usermod -a -G users $USER_NAME
chroot "$1" usermod -a -G netdev $USER_NAME
chroot "$1" usermod -a -G input $USER_NAME
chroot "$1" usermod -a -G sudo $USER_NAME
echo root:root | chroot "$1" chpasswd
sed -i -e s/workstation=no/workstation=yes/g "$1"/etc/avahi/avahi-daemon.conf
echo U_BOOT_PARAMETERS=\"console=tty0 console=ttyS0,115200 rootwait earlycon clk_ignore_unused rw\" >> "$1"/etc/default/u-boot
echo U_BOOT_ROOT=\"root=LABEL=lpi3h-root\" >> "$1"/etc/default/u-boot
cat "$1"/etc/default/u-boot
cp ./build/*.deb "$1/opt/" 
chroot "$1" sh -c "dpkg -i /opt/*.deb"
