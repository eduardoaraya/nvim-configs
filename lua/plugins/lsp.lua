local servers = { 
  "lua_ls",
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
}
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
        ensure_installed = servers,
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
      local util = require("lspconfig.util")
      local on_attach = function(_, bufnr)
        local attach_opts = { silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
        vim.keymap.set('n', '<C-gh>', vim.lsp.buf.signature_help, attach_opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
        vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
      end
      for _, lsp_server in ipairs(servers) do
        lspconfig[lsp_server].setup({ 
          capabilities = capabilities,
          on_attach = on_attach,
          root_dir = util.root_pattern("package.json");
        })
      end
      vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    end
}
