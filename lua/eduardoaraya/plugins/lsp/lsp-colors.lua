local status, lsp_colors = pcall(require, "lsp-colors")

lsp_colors.setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#i29a7f",
  Hint = "#10B981"
})
