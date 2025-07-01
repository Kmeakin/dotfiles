if status is-interactive
    # Commands to run in interactive sessions can go here
end

# XDG base directories
# See https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

alias push-front="set --prepend --global --export"
alias push-back="set --append --global --export"
alias unset="set --erase"

# Homebrew
if test "$(uname)" = "Darwin"
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"

    push-front PATH /opt/homebrew/bin
    push-front PATH /opt/homebrew/sbin

    push-front INFOPATH /opt/homebrew/share/info
    push-front MANPATH /opt/homebrew/share/man

    # Use the built-in search paths if all other entries fail
    push-back INFOPATH ""
    push-back MANPATH ""

    ## LLVM
    push-front PATH "/opt/homebrew/opt/llvm/bin"
    push-front LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
    push-front CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

    ## GCC
    push-front PATH "/opt/homebrew/opt/binutils/bin"
    push-front LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
    push-front CPPFLAGS "-I/opt/homebrew/opt/binutils/include"

    # Hammerspoon
    defaults write org.hammerspoon.Hammerspoon MJConfigFile \
        "$XDG_CONFIG_HOME/hammerspoon/init.lua"
end

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
push-front PATH "$(dirname $(rustup which cargo))"
push-front PATH "$CARGO_HOME/bin"

# (Neo)vi(m)
alias vi       "nvim"
alias vim      "nvim"
alias nvimdiff "nvim -d"
alias vimdiff  "nvimdiff"
export EDITOR=nvim
export VISUAL=nvim

# Pager
export LESS="--ignore-case --mouse --use-color --RAW-CONTROL-CHARS"

# Convience aliases
alias which "type --all"
alias ls "eza --all --header --icons --hyperlink --git --binary"
alias ll "ls -l"; alias l "ls -l"

function cat-or-ls
    if test -d "$argv[1]"
        ls "$argv[1]"
    else
        bat --theme 'Solarized (light)' "$argv[1]"
    end
end

alias cat   "cat-or-ls"
alias rg    "rg --smart-case"
alias mkdir "mkdir -p"

alias gadd    "git add"           ; alias ga    "git add"    ;
alias gclone  "git clone"         ; alias gcl   "git clone"  ;
alias gcommit "git commit"        ; alias gcom  "git commit" ; alias gc "git commit"  ;
alias gdiff   "git diff"          ; alias gd    "git diff"   ;
alias ginit   "git init"          ; alias gi    "git init"   ;
alias glog    "git log"           ; alias gl    "git log"    ;
alias glog1   "git log --oneline" ; alias gl1   "git log1"   ;
alias gpush   "git push"          ; alias gpsh  "git push"   ; alias gps "git push"   ;
alias gpull   "git pull"          ; alias gpll  "git pull"   ; alias gpl "git pull"   ; alias gp "git pull" ;
alias gstatus "git status"        ; alias gstat "git status" ; alias gs  "git status" ;

function git-ammend
    # TODO
end

# Prompt
tide configure                         \
       --auto                          \
       --style='Lean'                  \
       --prompt_colors='True color'    \
       --show_time='24-hour format'    \
       --lean_prompt_height='One line' \
       --prompt_spacing=Compact        \
       --icons='Many icons'            \
       --transient=No
