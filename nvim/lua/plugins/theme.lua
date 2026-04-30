-- lua/plugins/theme.lua

-- Additional Configs:
-- { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 }, -- Provides: nordfox, nightfox, carbonfox, etc.

return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- make sure the colorscheme is loaded first
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- The colorscheme is set in init.lua to ensure it's loaded very early
	end,
}
