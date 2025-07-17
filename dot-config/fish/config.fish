if status is-interactive
    # Prompt
    tide configure                     \
       --auto                          \
       --style='Lean'                  \
       --prompt_colors='True color'    \
       --show_time='24-hour format'    \
       --lean_prompt_height='One line' \
       --prompt_spacing=Compact        \
       --icons='Many icons'            \
       --transient=No
end

# XDG base directories
# See https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

alias push-front "set --prepend --global --export"
alias push-back  "set --append  --global --export"
alias unset      "set --erase"

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
else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
push-front PATH "$(dirname $(rustup which cargo))"
push-front PATH "$CARGO_HOME/bin"

function alias-many
    set cmd $argv[1]
    for arg in $argv[2..]
        alias "$arg" "$cmd"
    end
end

# (Neo)vi(m)
alias-many "nvim" "vi" "vim"
alias-many "nvim -d" "vimdiff" "nvimdiff"
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
        bat "$argv[1]"
    end
end

alias bat   "bat --theme 'Solarized (light)'"
alias cat   "cat-or-ls"
alias rg    "rg --smart-case"
alias mkdir "mkdir -p"

alias-many "git add"             gadd ga
alias-many "git clone"           gclone gcl
alias-many "git commit"          gcommit gcomm gcom gc
alias-many "git diff"            gdiff gd
alias-many "git diff --staged"   gdiffs gds
alias-many "git init"            ginit gi
alias-many "git log"             glog gl
alias-many "git log --oneline"   glog1 gl1
alias-many "git push"            gpush gpsh
alias-many "git pull"            gpull gpll gp
alias-many "git status"          gstatus gstat gs
alias-many "git status --staged" gstatuss gstats gss
alias-many "git unstage"         gunstage gun gu
abbr --command git "unstage" "restore --staged"

function git-ammend
    # TODO
end

function manswitch
    man $argv[1] | less -p "^ +$argv[2]"
end


function last-history-item
    echo $history[1]
end
abbr -a !! --position anywhere --function last-history-item

# Theme
fish_config theme choose 'Solarized Dark'

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
