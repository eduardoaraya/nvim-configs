local opt = vim.opt

-- line numbers
opt.ignorecase = true
opt.number = true
opt.relativenumber = true
--
--
-- tabs & identations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- aparence
opt.wrap = false
opt.linespace = 16

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guifont = "JetBrains Mono"
-- opt.guifont = "Fira Code"
-- opt.highlight = true
-- theme 


vim.highlight.DiagnosticError = "guifg=Red"
vim.highlight.DiagnosticWarn = "guifg=DarkOrange"
vim.highlight.DiagnosticInfo = "guifg=Blue"
vim.highlight.Diagnostichint = "guifg=Green"

-- opt.cursorcolumn = true
-- opt.backspace = "indent,eol,smart"

-- clipboard
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.api.nvim_set_option("clipboard", "unnamed")
vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
