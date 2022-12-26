local opt = vim.opt 

-- line numbers
opt.ignorecase = true
-- opt.number = true
opt.relativenumber = true
-- tabs & identations

opt.tabstop = 2
opt.shiftwidth = 2 
opt.expandtab = true
opt.autoindent = true

-- line
opt.wrap = false
opt.linespace = 3 

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true


-- aparence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guifont="JetBrains Mono"
opt.cursorcolumn = true
-- backspace
-- opt.backspace = "indent,eol,smart"

-- clipboard
opt.clipboard:append("unnamedplus")

-- slip windows
opt.splitright = true
opt.splitbelow = true


opt.iskeyword:append("-")

