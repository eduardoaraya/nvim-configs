vim.g.mapleader = " "

local keymap = vim.keymap


-- shortcuts
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<C-s>", ":w<CR>")



-- plugins

-- Tree explorer
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

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
