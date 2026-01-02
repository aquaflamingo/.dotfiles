-- lua/plugins/bufferline.lua

return {
	"akinsho/bufferline.nvim",
	-- Don't use icons
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				-- Use "ordinal" to show tab numbers
				numbers = "ordinal",
				-- Use a simple separator
				separator_style = "thin",
				-- Show buffer icons
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				-- Other options from your config
				max_name_length = 30,
				max_prefix_length = 30,
				tab_size = 21,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				-- Use devicons
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or (level:match("warning") and " " or "")
					return " " .. icon .. count
				end,
			},
		})
	end,
}
