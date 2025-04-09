return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require 'window-picker'.setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },
              buftype = { 'terminal', "quickfix" },
            },
          },
        })
      end,
    },
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>b", ":Neotree filesystem toggle<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    -- vim.cmd(":Neotree filesystem reveal left")
    require("neo-tree").setup({
      winbar = false,
      statusline = false,
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '󰌵',
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = "✓",
            deleted   = "✗",
            modified  = "●",
            renamed   = "●",
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "✧",
            staged    = "✦",
            conflict  = "",
          }
        }
      }
    })
  end,
}

