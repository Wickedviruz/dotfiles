# Wicked Dotfiles

These are the config tiles i use to set up my development environmnet across different machines - linux, windows ( via WSL or native )

## What's included?

- ** Neovim (`nvim/`)**
  - My full lua-based config.
  - cheatsheet


## How to use it

Clone this repo onto any new system and symlink the files where needed.

```bash
git clone https://github.com/Wickedviruz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Setup script
The setup script will:
- Backup any existing config files.
- Symlink files to your home directory
- Optionally install plugins or required tools (Neovim ect..)

## Kepping in sync
To update the dotfiles from a machine where you have made changes:

sync.sh:
```bash
#!/usr/bin/env bash

echo "📤 Exporting current config..."

# Hitta plattform
OS="$(uname -s)"
if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
  HOME_DIR="$HOME"
elif [[ "$OS" == MINGW* || "$OS" == CYGWIN* ]]; then
  HOME_DIR="/c/Users/$(whoami)"
else
  echo "❌ Unsupported OS: $OS"
  exit 1
fi

DOTFILES_DIR="$(pwd)"

# Exportera Neovim
NVIM_SRC="$HOME_DIR/.config/nvim"
NVIM_DEST="$DOTFILES_DIR/nvim"

if [ -d "$NVIM_SRC" ]; then
  echo "🔁 Syncing Neovim config..."
  rm -rf "$NVIM_DEST"
  cp -r "$NVIM_SRC" "$NVIM_DEST"
else
  echo "⚠️ No Neovim config found at $NVIM_SRC"
fi

# Git sync
echo "🔄 Pulling latest changes from GitHub..."
git pull --rebase

echo "📦 Adding and committing..."
git add .
git commit -m "Auto-sync on $(date '+%Y-%m-%d %H:%M:%S')" || echo "🟢 No changes to commit."

echo "🚀 Pushing to GitHub..."
git push

echo "✅ All done! Your config is backed up and online. 💾"

```


Feel free to fork or use anything in here. Everyones setup is different. This is just mine. 😄
