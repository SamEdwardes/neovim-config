#!/bin/sh

# Install nvim
echo "Installing nvim..."
curl -LJO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

user=$(whoami)

if [ "$user" = 'root' ]; then
    mkdir /opt/nvim
    tar -xf nvim-linux64.tar.gz -C /opt/nvim
    ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/local/bin/nvim
else
    mkdir -p "$HOME/.local/nvim"
    tar -xf nvim-linux64.tar.gz -C "$HOME/.local/nvim"
    ln -s "$HOME/.local/nvim"/nvim-linux64/bin/nvim "$HOME/bin/nvim"
fi
rm nvim-linux64.tar.gz
echo "nvim installation complete!"

# Configure nvim
echo "Configuring nvim..."
mkdir -p "$HOME/.config"
git clone https://github.com/SamEdwardes/neovim-config.git "$HOME/.config/nvim"
# Seems to be a bug where it will fail the first time. So run it twice.
# https://github.com/wbthomason/packer.nvim/issues/502
echo "Syncing nvim packages..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > /dev/null 2>&1
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo ""
echo "neovim configuration complete!"

echo ""
echo "neovim has successfully been installed and configured. The first time you run nvim it will take about 30 seconds to install the packges. You can start neovim by running..."
echo ""
echo "nnvim"