local cmd = vim.cmd

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
 
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        cmd [[packadd packer.nvim]]
        return true
    end
  return false
end


local packer_bootstrap = ensure_packer()


cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])


local status, packer = pcall(require, "packer")

if not status then
	print("Status not found on: plugins-setup.lua")
 return
end


return packer.startup(function(use)
	-- Plugin to load other plugins
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

     
	-- THEME 
    use("dracula/vim")

    -- UTILS
    use("christoomey/vim-tmux-navigator")
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("szw/vim-maximizer")
    
    -- ESSENTIALS
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("numToStr/Comment.nvim")
    
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    
    if (packer_bootstrap) then     
        print("sync packers")
        require("packer").sync()
    end
end)

