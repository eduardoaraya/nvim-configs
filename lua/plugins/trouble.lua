return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      position = "left",
      use_diagnostic_sign = true,
      icons = true,
    })

    vim.fn.sign_define("DiagnosticSignError",
    {text = "✗ ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
    {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
    {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint"})

    vim.keymap.set("n", "<leader>;", function() trouble.toggle() end)
    vim.keymap.set("n", "<leader>;w", function() trouble.toggle("workspace_diagnostics") end)
    vim.keymap.set("n", "<leader>;d", function() trouble.toggle("document_diagnostics") end)
    vim.keymap.set("n", "<leader>;q", function() trouble.toggle("quickfix") end)
    vim.keymap.set("n", "<leader>;l", function() trouble.toggle("loclist") end)
    vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)
  end
}
