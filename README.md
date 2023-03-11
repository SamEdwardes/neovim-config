# My neovim config

## Usage

```bash
# Install neovim (Mac)
brew install neovim

# Install neovim (Linux)
sudo snap install --beta nvim --classic
sudo apt-get update && sudo apt-get install build-essential

# Test the install
nvim --version

# Clone configuration
mkdir ~/.config
git clone https://github.com/SamEdwardes/neovim-config.git ~/.config/nvim

# Install and sync the extensions
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Open nvim
nvim
```