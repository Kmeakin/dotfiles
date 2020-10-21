# timezone
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/London

# locale
echo "LANG=en_GB.UTF-8" > "$(CreateFile /etc/locale.conf)"
cat >> "$(GetPackageOriginalFile glibc /etc/locale.gen)" <<EOF
en_US.UTF-8 UTF-8
en_GB.UTF-8 UTF-8
EOF

# keymap
echo "KEYMAP=uk" > "$(CreateFile /etc/vconsole.conf)"

# hostname
echo "karl-desktop" > "$(CreateFile /etc/hostname)"
cat >> "$(GetPackageOriginalFile filesystem /etc/hosts)" <<EOF
127.0.0.1	localhost
::1	localhost
EOF

# fstab
cat >> "$(GetPackageOriginalFile filesystem /etc/fstab)" <<EOF
# /dev/sdc2 UUID=5714353f-adaa-4bb4-a2ec-451549d0a3b7
LABEL=ROOT          	/         	ext4      	rw,relatime	0 1

# /dev/sdc1 UUID=1718-C85B
LABEL=BOOT          	/boot     	vfat      	rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,errors=remount-ro	0 2
EOF

# sudoers
cat >> "$(GetPackageOriginalFile sudo /etc/sudoers)" <<EOF
%wheel ALL=(ALL) ALL
EOF

# sddm
cat >> "$(CreateFile /etc/sddm.conf.d/kde_settings.conf)" <<EOF
[Theme]
Current=breeze
EOF

