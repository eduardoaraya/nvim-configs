vim.g.mapleader = " "

local keymap = vim.keymap
-- shortcuts
keymap.set("n", "<C-s>", ":w<CR>")
-- split window
keymap.set("n", "<leader>[", "<C-w>v")
keymap.set("n", "<leader>]", "<C-w>s")
keymap.set("n", "<leader>=", "<C-w>=")
keymap.set("n", "<leader>x", ":close<CR>")	


-- manager tabs
keymap.set("n", "<leader>tb", ":tabnew<CR>")	
keymap.set("n", "<leader>tc", ":tabclose<CR>")	
keymap.set("n", "<leader>tx", ":close<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")	
keymap.set("n", "<leader>tm", ":MaximizerToggle<CR>")

-- relaod configs
keymap.set("n", "<leader>#", ":source $MYVIMRC<CR>")
