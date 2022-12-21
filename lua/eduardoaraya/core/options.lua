local opt = vim.opt 

-- line numbers
opt.ignorecase = true
opt.number = true

-- tabs & identations

opt.tabstop = 4
opt.shiftwidth = 4 
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

-- backspace
-- opt.backspace = "indent,eol,smart"

-- clipboard
opt.clipboard:append("unnamedplus")

-- slip windows
opt.splitright = true
opt.splitbelow = true


opt.iskeyword:append("-")

