-- https://github.com/nvim-treesitter/nvim-treesitter

local status, nvimtree = pcall(require, "nvim-tree")

if not status then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>" , {silent = true, noremap = true})

nvimtree.setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
})
