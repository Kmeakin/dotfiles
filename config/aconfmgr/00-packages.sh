# base packages
AddPackage base
AddPackageGroup base-devel
AddPackage linux linux-firmware intel-ucode efibootmgr
AddPackage dhcpcd dhclient
AddPackage --foreign aconfmgr-git
AddPackage --foreign pikaur

# KDE
AddPackageGroup plasma
AddPackage dolphin konsole
AddPackage --foreign systemd-kcm

# Arc theme
AddPackage arc-gtk-theme arc-icon-theme
AddPackage --foreign arc-kde kvantum-theme-arc
f="$(GetPackageOriginalFile arc-icon-theme /usr/share/icons/Arc/index.theme)"
sed -i 's/Inherits=Moka,Faba,elementary,Adwaita,gnome,hicolor/Inherits=breeze,hicolor/' "$f"

# Other graphical stuff
AddPackage firefox

# Shell tools/dev
AddPackage git
AddPackage vi gvim neovim
AddPackage tree ranger
AddPackage emacs
AddPackage ripgrep
AddPackage --foreign atool-git

# rust
AddPackage rustup rust-analyzer sccache

