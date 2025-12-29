-- =================================================
-- Tokyo night theme
-- =================================================
-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night"
--     })
--     vim.cmd("colorscheme tokyonight")
--   end
-- }

-- =================================================
-- Catppuccin-Mocha theme
-- =================================================
return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = false,
        gitsigns = false,
        nvimtree = true,
        treesitter = true,
        notify = false,
      },
    })
    vim.cmd("colorscheme catppuccin")
  end
}
