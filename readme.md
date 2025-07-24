Karl Meakin's dotfiles.

# Installation

```bash
# Install Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages:
brew bundle install -v

# Link dotfiles:
stow --verbose --target="$HOME" --dotfiles --stow dot-config
```
