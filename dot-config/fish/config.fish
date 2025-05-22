if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias add-to-list="set --prepend --global --export"

# Homebrew
add-to-list HOMEBREW_PREFIX /opt/homebrew
add-to-list HOMEBREW_CELLAR /opt/homebrew/Cellar
add-to-list HOMEBREW_REPOSITORY /opt/homebrew

add-to-list PATH /opt/homebrew/bin
add-to-list PATH /opt/homebrew/sbin
add-to-list INFOPATH /opt/homebrew/share/info

## LLVM
add-to-list PATH "/opt/homebrew/opt/llvm/bin"
add-to-list LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
add-to-list CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

## GCC
add-to-list PATH /opt/homebrew/opt/binutils/bin
add-to-list LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
add-to-list CPPFLAGS "-I/opt/homebrew/opt/binutils/include"

# Cargo
add-to-list PATH $HOME/.cargo/bin

# (Neo)vi(m)
alias vi="nvim"
alias vim="nvim"
alias nvimdiff="nvim -d"
alias vimdiff="nvimdiff"
set --global --export EDITOR nvim
set --global --export VISUAL nvim

# Convience aliases
alias which="type --all"
alias ls="eza --all --header --icons --hyperlink --git --binary"
alias ll="ls -l"
alias l="ls -l"
alias cat="bat --theme 'Solarized (light)'"
alias rg="rg --smart-case"

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
