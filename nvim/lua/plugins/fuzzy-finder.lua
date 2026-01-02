-- lua/plugins/fuzzy-finder.lua

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		-- Configure fzf-lua to use a rounded border theme
		fzf.setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
			winopts = {
				border = {
					style = "rounded",
					hl = {
						border = "FloatBorder",
					},
				},
			},
			-- You can add further customizations here if needed
		})
	end,
}
