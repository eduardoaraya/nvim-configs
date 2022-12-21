vim.g.material_theme_style = "darker-community"

local status, _ = pcall(vim.cmd, "colorscheme material")
 if not status then 
    print("Colorscheme not found!")
	return
end
