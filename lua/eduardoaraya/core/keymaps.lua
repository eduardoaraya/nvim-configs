vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")


-- plugins
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")
