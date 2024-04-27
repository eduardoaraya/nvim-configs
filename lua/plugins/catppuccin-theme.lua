return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        mini = {
          enabled = true,
          identscope_color = "",
        }
      }
    })
  vim.cmd.colorscheme "catppuccin-mocha"
  end
}
