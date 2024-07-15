# List all of the commands
default:
  @just --list

# Update this repo with the lastet version from my dotfiles config
refresh:
  cp -r ~/projects/personal/dotfiles/dotfiles/.config/nvim/ .
