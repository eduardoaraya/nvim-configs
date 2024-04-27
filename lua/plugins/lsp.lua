return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_peding = "➜",
          package_unistalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { 
        "lua_sl",
        "rust_analyzer",
        "angularls",
        "bashsl",
        "clangd",
        "charp_ls",
        "cmake",
        "css",
        "dockersl",
        "eslint",
        "gopls",
        "jsonsl",
        "html",
        "tsserver",
        "markdown_oxide",
        "ocamllsp",
        "rescriptls",
        "yamlls",
      },
      automatic_installation = true
    })

    require("lspconfig").angularsl.setup({})
  end
}
