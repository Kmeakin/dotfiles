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

# Services
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/sddm.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/dhclient@enp3s0.service /usr/lib/systemd/system/dhclient@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket
