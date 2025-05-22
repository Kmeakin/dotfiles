set unstable := true

_default:
    @just --justfile {{justfile()}} --list

# Install dependencies
bootstrap:
    brew install just stow

# Install dotfiles into $HOME
install:
    stow --verbose \
        --target "$HOME" \
        --dotfiles \
        --ignore justfile \
        --ignore readme.md \
        --stow .
        