-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Inspiration and reference:
-- https://github.com/wbthomason/packer.nvim#quickstart
-- https://github.com/jdhao/nvim-config/blob/master/lua/plugins.lua
-- https://dev.to/slydragonn/how-to-set-up-neovim-for-windows-and-linux-with-lua-and-packer-2391

-- Bootstrap packer on a new machine
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Load extenions
return require('packer').startup(function(use)
  
  -- Packer can manage itself: https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- Theme: https://github.com/catppuccin/nvim
  use {
    'catppuccin/nvim',
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme "catppuccin"
    end
  }

  -- Indent blankline: https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({})
    end
  }

  -- Nvim tree: https://github.com/nvim-tree/nvim-tree.lua
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
    tag = 'nightly',
    config = function()
      require("configs.nvim-tree")
    end
  }

  -- Treesitter: https://github.com/nvim-treesitter/nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require("configs.treesitter")
    end,
  }

  -- Telescope: https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep'
    }
  }



  -- Toggle term: https://github.com/akinsho/toggleterm.nvim
  use {
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
        size = 10,
        open_mapping = [[<F7>]],
        shading_factor = 2,
        direction = "float",
        float_opts = {
          border = "curved",
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        }
      })
		end
	}

  -- Which key: https://github.com/folke/which-key.nvim
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end
  }

  -- Hop: https://github.com/phaazon/hop.nvim
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require("hop").setup({
        keys = 'etovxqpdygfblzhckisuran'
      })
    end
  }

end)
