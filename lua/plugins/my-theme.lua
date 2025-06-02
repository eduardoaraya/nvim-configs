return {
  'catppuccin/nvim',
  --"rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opt = {},
  config = function ()
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
  --  vim.cmd.colorscheme "kanagawa"
  end
}
