return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>p", function()
      builtin.find_files()
    end)
    vim.keymap.set("n", "<leader><S-p>", function()
      builtin.git_files()
    end)
    vim.keymap.set("n", "<leader><S-g>", function()
      builtin.grep_string()
    end)
    vim.keymap.set("n", "<leader><S-f>", function()
      builtin.live_grep()
    end)
  end,
}
