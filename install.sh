#!/bin/bash

set -e  # Exit on errors

# Detect brew
if command -v brew &>/dev/null; then
  echo "Homebrew already installed."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/usr/local/bin/brew shellenv 2>/dev/null || /opt/homebrew/bin/brew shellenv)"

# apps
brew install --cask iterm2 google-chrome obsidian visual-studio-code imazing nordvpn

# code
brew install node nvm python

# terminal
brew install tldr eza zoxide bat neofetch zsh-autosuggestions zsh-syntax-highlighting

# Dotfile symlinks
# -f option will overwrite the destination file if it exists!
ln -sf "$PWD/zshrc" "$HOME/.zshrc"
ln -sf "$PWD/gitconfig" "$HOME/.gitconfig"

echo "Install complete!"