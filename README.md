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

```bash
cd ~/.dotifles
git add .
git commit -m "Updated configs from...."
git push
```

Also there is sync.sh

```bash
#!/bin/bash
# sync.sh

cd "$(dirname "$0")"
git pull origin main
git add .
git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main
```


Feel free to fork or use anything in here. Everyones setup is different. This is just mine. 😄
