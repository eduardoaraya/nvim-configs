return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 1,
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
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    priority = 2,
    opts = { auto_install = true, },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "luau_lsp",
          "rust_analyzer",
          "angularls",
          "bashls",
          "clangd",
          -- "csharp_ls",
          "cmake",
          "cssls",
          "tailwindcss",
          -- "dockersl",
          "eslint",
          "gopls",
          -- "jsonsl",
          "html",
          "tsserver",
          "markdown_oxide",
          -- "ocamllsp",
          "rescriptls",
          "yamlls",
        },
        automatic_installation = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 2,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.angularls.setup({
        capabilities = capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.luau_lsp.setup({
        capabilities = capabilities
      })

    end
  }
}
