return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local lsputils = require("lspconfig.util")
    vim.keymap.set("n", "<leader>ff", function()
      print(lsputils.root_pattern(".git"))
      builtin.find_files({
        cwd = "%:p:h"
      })
    end, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
