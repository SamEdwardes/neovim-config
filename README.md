# My neovim config

## Usage

```bash
# Install neovim (Mac)
brew install neovim

# Install neovim (Linux)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

# Clone this repo
git clone https://github.com/SamEdwardes/neovim-config.git ~/.config/nvim

# Install and sync the extensions
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```