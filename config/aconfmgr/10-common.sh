#!/usr/bin/env bash

# locale
echo "LANG=en_GB.UTF-8" >"$(CreateFile /etc/locale.conf)"
cat >>"$(GetPackageOriginalFile glibc /etc/locale.gen)" <<EOF
en_US.UTF-8 UTF-8
en_GB.UTF-8 UTF-8
EOF

# keymap
echo "KEYMAP=uk" >"$(CreateFile /etc/vconsole.conf)"

# timezone
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/London

# sudoers
cat >>"$(GetPackageOriginalFile sudo /etc/sudoers)" <<EOF
%wheel ALL=(ALL) ALL
EOF

# sddm
cat >>"$(CreateFile /etc/sddm.conf.d/kde_settings.conf)" <<EOF
[Theme]
Current=breeze

[X11]
UserAuthFile=.local/var/run/Xauthority
EOF

# makepkg
makepkg="$(GetPackageOriginalFile pacman /etc/makepkg.conf)"
patch "${makepkg}" <<"EOF"
45c45
< #MAKEFLAGS="-j2"
---
> MAKEFLAGS="-j$(nproc)"
64c64
< BUILDENV=(!distcc color !ccache check !sign)
---
> BUILDENV=(!distcc color ccache check !sign)
146c146
< PKGEXT='.pkg.tar.zst'
---
> PKGEXT='.pkg.tar'
EOF

# pacman
pacman="$(GetPackageOriginalFile pacman /etc/pacman.conf)"
patch "${pacman}" <<"EOF"
92,93c92,93
< #[multilib]
< #Include = /etc/pacman.d/mirrorlist
---
> [multilib]
> Include = /etc/pacman.d/mirrorlist
EOF

# Services
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/sddm.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
CreateLink /etc/systemd/system/multi-user.target.wants/reflector.service /usr/lib/systemd/system/reflector.service
CreateLink /etc/systemd/system/timers.target.wants/reflector.timer /usr/lib/systemd/system/reflector.timer
