return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    },
    "peitalin/vim-jsx-typescript"
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_lsp.default_capabilities()
   -- local capabilities = vim.tbl_deep_extend(
   --   "force",
   --   {},
   --   vim.lsp.protocol.make_client_capabilities(),
   --   cmp_lsp.default_capabilities())

      -- TODO: Configure omnisharp to run inside a docker
      --local lspconfig = require("lspconfig")
      --local config = require("lspconfig.configs")
      --config.docker_omnisharp = {
        --  default_config = {
          --    cmd = { "ncat", "0.0.0.0", "2000" },
          --    root_dir = require('lspconfig/util').root_pattern("*.csproj", "*.sln"),
          --    filetypes = { "cs", "vb" },
          --    enable_editorconfig_support = true,
          --    --enable_roslyn_analyzers = true,
          --    organize_imports_on_format = true,
          --  }
          --}
          --lspconfig.docker_omnisharp.setup({})

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "angularls",
          "bashls",
          "clangd",
          "cmake",
          "cssls",
          "tailwindcss",
          "eslint",
          "gopls",
          "html",
          -- "tsserver",
          "markdown_oxide",
          "rescriptls",
          "yamlls",
          -- "omnisharp",
          -- "estlint",
          -- "docker_ls",
          "vtsls"
          --"javascriptreact"
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,
          ["tsserver"] = function()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            lspconfig.tsserver.setup {
              capabilities = capabilities,
              root_dir = util.root_pattern("package.json", ".git"), -- TODO: Make this dynamic by the servers table... use the table with these configs
              single_file_supporte = true,
              init_options = {
                preferences = {
                  importModuleSpecifierPreference = "relative",
                  importModuleSpecifierEnding = "minimal"
                }
              }
            }
          end,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,
        }
      })

      -- CMP config
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })

      require("lsp_lines").setup()
     -- vim.fn.sign_define("DiagnosticSignError",
     -- {text = "✗ ", texthl = "DiagnosticSignError"})
     -- vim.fn.sign_define("DiagnosticSignWarn",
     -- {text = " ", texthl = "DiagnosticSignWarn"})
     -- vim.fn.sign_define("DiagnosticSignInfo",
     -- {text = " ", texthl = "DiagnosticSignInfo"})
     -- vim.fn.sign_define("DiagnosticSignHint",
     -- {text = "", texthl = "DiagnosticSignHint"})
      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
        update_in_insert = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }

