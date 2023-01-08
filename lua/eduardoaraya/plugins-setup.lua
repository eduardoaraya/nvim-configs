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
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
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
    -- use("morhetz/gruvbox")
    use({ "kaicataldo/material.vim", branch="main" })

    -- UTILS
    use("nvim-lualine/lualine.nvim")
    use("christoomey/vim-tmux-navigator")
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("szw/vim-maximizer")
    use ('sheerun/vim-polyglot')

    -- ESSENTIALS
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("terrortylor/nvim-comment")
  
    -- TELESCOPE
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    
    -- AUTOCOMPLETION
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    -- SNIPPETS
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
   
    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("folke/lsp-colors.nvim") 
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")
    use("jose-elias-alvarez/null-ls.nvim")    
    use("MunifTanjim/prettier.nvim")

    -- ERROR LENS
    use("folke/trouble.nvim")


    if packer_bootstrap then     
        packer.sync()
    end
end)

