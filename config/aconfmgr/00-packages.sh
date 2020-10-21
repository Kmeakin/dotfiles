# base packages
AddPackage base
AddPackageGroup base-devel
AddPackage man-db inetutils wget pkgfile
AddPackage linux linux-firmware intel-ucode efibootmgr
AddPackage dhcpcd dhclient
AddPackage --foreign pikaur aconfmgr-git

# KDE
AddPackageGroup plasma
AddPackage dolphin konsole
AddPackage --foreign systemd-kcm
AddPackage --foreign jumpapp

# Arc theme
AddPackage arc-gtk-theme arc-icon-theme
AddPackage --foreign arc-kde kvantum-theme-arc
f="$(GetPackageOriginalFile arc-icon-theme /usr/share/icons/Arc/index.theme)"
sed -i 's/Inherits=Moka,Faba,elementary,Adwaita,gnome,hicolor/Inherits=breeze,hicolor/' "$f"

# Other graphical stuff
AddPackage firefox

# Dev
AddPackage git
AddPackage vi gvim neovim
AddPackage emacs
AddPackage ripgrep

# Rust
AddPackage rustup rust-analyzer sccache

# Shell tools
AddPackage tree ranger
AddPackage stow
AddPackage pass
AddPackage --foreign atool-git

# Bash
AddPackage bash-completion

# Zsh
AddPackage zsh
AddPackage --foreign zsh-zinit-git 

