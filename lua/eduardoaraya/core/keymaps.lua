vim.g.mapleader = " "

local keymap = vim.keymap


-- shortcuts
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<C-s>", ":w<CR>")



-- plugins

-- Tree explorer
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

-- split window
keymap.set("n", "<leader>1", "<C-w>v")
keymap.set("n", "<leader>2", "<C-w>s")
keymap.set("n", "<leader>3", "<C-w>=")
keymap.set("n", "<leader>x", ":close<CR>")	


-- manager tabs
keymap.set("n", "<leader>n", ":tabnew<CR>")	
keymap.set("n", "<leader>c", ":tablose<CR>")	
keymap.set("n", "<leader>x", ":close<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")	

keymap.set("n", "<leader>tm", ":MaximizerToggle<CR>")
