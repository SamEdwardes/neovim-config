#!/bin/sh

# Install nvim
echo "Installing nvim..."
curl -LJO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
mkdir /opt/nvim
tar -xf nvim-linux64.tar.gz -C /opt/nvim
rm nvim-linux64.tar.gz
ln -s /opt/nvim/nvim-linux64/bin/nvim /usr/local/bin/nvim
echo "nvim installation complete!"

# Configure nvim
echo "Configuring nvim..."
mkdir -p "$HOME/.config"
git clone https://github.com/SamEdwardes/neovim-config.git "$HOME/.config/nvim"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo "nvim configuration complete!"

echo "\n\nneovim has successfully been installed and configured. The first time you run nvim it will take about 30 seconds to install the packges. You can start neovim by running..."
echo "\nnvim"