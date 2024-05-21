return {
  "NeogitOrg/neogit",
  tag = "v0.0.1",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    require("neogit").setup()
    vim.keymap.set("n", "<leader>v", ":Neogit cwd=%:p:h<CR>")
    vim.keymap.set("n", "<leader>vt", ":Neogit cwd=%:p:h<CR>")
  end
}
