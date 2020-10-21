# locale
echo "LANG=en_GB.UTF-8" > "$(CreateFile /etc/locale.conf)"
cat >> "$(GetPackageOriginalFile glibc /etc/locale.gen)" <<EOF
en_US.UTF-8 UTF-8
en_GB.UTF-8 UTF-8
EOF

# keymap
echo "KEYMAP=uk" > "$(CreateFile /etc/vconsole.conf)"

# timezone
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/London

# sudoers
cat >> "$(GetPackageOriginalFile sudo /etc/sudoers)" <<EOF
%wheel ALL=(ALL) ALL
EOF

# sddm
cat >> "$(CreateFile /etc/sddm.conf.d/kde_settings.conf)" <<EOF
[Theme]
Current=breeze
EOF

