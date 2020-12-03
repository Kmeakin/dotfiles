#!/usr/bin/env bash

if [[ "${HOSTNAME}" != "karl-desktop" ]]; then return; fi

# hostname
echo "karl-desktop" >"$(CreateFile /etc/hostname)"
cat >>"$(GetPackageOriginalFile filesystem /etc/hosts)" <<EOF
127.0.0.1	localhost
::1	localhost
EOF

# fstab
cat >>"$(GetPackageOriginalFile filesystem /etc/fstab)" <<EOF
# /dev/sdc2 UUID=5714353f-adaa-4bb4-a2ec-451549d0a3b7
LABEL=ROOT          	/         	ext4      	rw,relatime	0 1

# /dev/sdc1 UUID=1718-C85B
LABEL=BOOT          	/boot     	vfat      	rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,errors=remount-ro	0 2
EOF

