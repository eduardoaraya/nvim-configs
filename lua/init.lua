local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Relase branch
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_vim_options, _ = pcall(require, "options")
if not status_vim_options then 
	print("There is no options")
  return
end
local status_keymaps, _ = pcall(require, "keymaps")
if not status_vim_options then 
	print("There is no options")
  return
end
local status_lazy, lazy = pcall(require, "lazy")
if not status_lazy then 
	print("There is no lazy.nvim")
  return
end

lazy.setup("plugins")
