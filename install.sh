#!/usr/bin/env bash

# Determine platform
OS="$(uname -s)"

echo "🛠️ Installing dotfiles on $OS..."

# Set home dir
if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
  HOME_DIR="$HOME"
elif [[ "$OS" == MINGW* || "$OS" == CYGWIN* ]]; then
  HOME_DIR="/c/Users/$(whoami)"
else
  echo "❌ Unsupported OS: $OS"
  exit 1
fi

# Backup dir
BACKUP_DIR="$HOME_DIR/dotfiles_backup_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Symlink function
link() {
  src=$1
  dest=$2

  if [ -e "$dest" ]; then
    echo "🔁 Backing up $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR"
  fi

  echo "🔗 Linking $src → $dest"
  ln -s "$src" "$dest"
}

# Neovim
mkdir -p "$HOME_DIR/.config"
link "$(pwd)/nvim" "$HOME_DIR/.config/nvim"

# Bash
[ -f "$(pwd)/bash/.bashrc" ] && link "$(pwd)/bash/.bashrc" "$HOME_DIR/.bashrc"

# Git
[ -f "$(pwd)/git/.gitconfig" ] && link "$(pwd)/git/.gitconfig" "$HOME_DIR/.gitconfig"

echo "✅ Dotfiles installation complete!"

