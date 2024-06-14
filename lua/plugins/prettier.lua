return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependences = {"neovim/nvim-lspconfig"},
    config = function()
      require("null-ls").setup({
        on_attach = function(client, bufnr)
          local event = "BufWritePre" -- or "BufWritePost"
          local async = event == "BufWritePost"
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>ps", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
              buffer = bufnr,
              group = group,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = async })
              end,
              desc = "[lsp] format on save",
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>ps", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end
      })
    end
  },
  "MunifTanjim/prettier.nvim",
  config = function()
    local prettier = require("prettier")
    prettier.setup({
      bin = 'prettier', -- or `'prettierd'` (v0.22+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            -- if `false`, skips checking `package.json` for `"prettier"` key
            check_package_json = true,
          })
        end,
        runtime_condition = function()
          -- return false to skip running prettier
          return true
        end,
        timeout = 5000,
      }
    })
  end
}
