return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
--    local isCapsLockOn = function()
--      local handle = io.popen("xset q | grep 'Caps Lock:'")
--      if (handle ~= nil) then
--        local result = handle:read("*a")
--        handle:close()
--        return result:match("on") ~= nil
--      end
--      return false;
--    end
--    local warnings = function()
--       if isCapsLockOn() then
--         return [[ON]]
--       else
--         return [[OFF]]
--       end
--    end
    require("lualine").setup {
      options = {
        --theme = 'gruvbox',
        inactive_sesctions = {},
      },
      sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
    }
  end
}
