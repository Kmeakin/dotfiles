if status is-interactive
    # Commands to run in interactive sessions can go here
end

# XDG base directories
# See https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

alias add-to-list="set --prepend --global --export"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"

add-to-list PATH /opt/homebrew/bin
add-to-list PATH /opt/homebrew/sbin
add-to-list INFOPATH /opt/homebrew/share/info
add-to-list MANPATH /opt/homebrew/share/man

## LLVM
add-to-list PATH "/opt/homebrew/opt/llvm/bin"
add-to-list LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
add-to-list CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

## GCC
add-to-list PATH "/opt/homebrew/opt/binutils/bin"
add-to-list LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
add-to-list CPPFLAGS "-I/opt/homebrew/opt/binutils/include"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
add-to-list PATH "$(dirname $(rustup which cargo))"
add-to-list PATH "$CARGO_HOME/bin"

# Hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile \
         "$XDG_CONFIG_HOME/hammerspoon/init.lua"

# (Neo)vi(m)
alias vi="nvim"
alias vim="nvim"
alias nvimdiff="nvim -d"
alias vimdiff="nvimdiff"
export EDITOR=nvim
export VISUAL=nvim

# Convience aliases
alias which="type --all"
alias ls="eza --all --header --icons --hyperlink --git --binary"
alias ll="ls -l"
alias l="ls -l"
alias cat="bat --theme 'Solarized (light)'"
alias rg="rg --smart-case"

alias gadd="git add"
alias gclone="git clone"
alias gcommit="git commit"; alias gcom="git commit"; alias gc="git commit"
alias gdiff="git diff"; alias gd="git diff"
alias ginit="git init"
alias glog="git log"; alias gl="git log"
alias glog1="git log --online"; alias gl1="git log --online"
alias gpush="git push"
alias gpull="git pull"
alias gstatus="git status"; alias gstat="git status"; alias gs="git status"

# Prompt
tide configure \
       --auto \
       --style=Lean \
       --prompt_colors='True color' \
       --show_time='24-hour format' \
       --lean_prompt_height='One line' \
       --prompt_spacing=Compact \
       --icons='Many icons' \
       --transient=No
