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
  -- use("dracula/vim")
  -- use("rafamadriz/neon")
    use({ "kaicataldo/material.vim", branch="main" })
    use("nvim-lualine/lualine.nvim")

    -- UTILS
    use("christoomey/vim-tmux-navigator")
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("szw/vim-maximizer")
    use ('sheerun/vim-polyglot')

    -- ESSENTIALS
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("numToStr/Comment.nvim")
    
    -- TELESCOPE
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    
    -- AUTOCOMPLETION
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- SNIPPETS
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
   
    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")
    

    -- ERROR LENS
    use("folke/trouble.nvim")


    if (packer_bootstrap) then     
        print("sync packers")
        require("packer").sync()
    end
end)

