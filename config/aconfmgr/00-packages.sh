# base packages
AddPackage base
AddPackageGroup base-devel
AddPackage man-db inetutils wget pkgfile
AddPackage linux linux-firmware intel-ucode efibootmgr
AddPackage dhcpcd
AddPackage --foreign pikaur aconfmgr-git
AddPackage reflector
AddPackage xdg-user-dirs

# KDE
AddPackageGroup plasma
AddPackage dolphin konsole okular spectacle
AddPackage --foreign systemd-kcm
AddPackage --foreign jumpapp

# Arc theme
AddPackage arc-gtk-theme arc-icon-theme
AddPackage --foreign arc-kde kvantum-theme-arc
f="$(GetPackageOriginalFile arc-icon-theme /usr/share/icons/Arc/index.theme)"
sed -i 's/Inherits=Moka,Faba,elementary,Adwaita,gnome,hicolor/Inherits=breeze,hicolor/' "$f"

# Other graphical stuff
AddPackage firefox
AddPackage steam
AddPackage thunderbird
AddPackage vlc
AddPackage --foreign ferdi-bin
AddPackage --foreign runelite
AddPackage --foreign spotify
AddPackage --foreign zoom

# Dev
AddPackage git
AddPackage vi gvim neovim
AddPackage --foreign emacs-git
AddPackage --foreign visual-studio-code-bin

# for some reason these are required for VSCode pair programming to work
AddPackage qtkeychain gnome-keyring

# Shell tools
AddPackage tree ranger
AddPackage stow
AddPackage pass browserpass
AddPackage --foreign pass-git-helper
AddPackage --foreign atool-git
AddPackage fd ripgrep tokei
AddPackage --foreign dust
AddPackage openssh

# C/C++
AddPackage clang lld llvm ccache valgrind

# Bash
AddPackage bash-completion bash-language-server shellcheck shfmt

# Java
CreateLink /usr/lib/jvm/default java-14-openjdk
CreateLink /usr/lib/jvm/default-runtime java-14-openjdk

# Haskell
AddPackage ghc

# Rust
AddPackage rustup rust-analyzer sccache

# Zsh
AddPackage zsh
AddPackage --foreign zsh-zinit-git
