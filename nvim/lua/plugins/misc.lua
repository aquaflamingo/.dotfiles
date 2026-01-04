-- lua/plugins/misc.lua
-- Other utility plugins

return {
	-- Smoothly navigate between tmux and Neovim panes
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local ntn = require("nvim-tmux-navigation")
			ntn.setup({
				disable_when_zoomed = true, -- matches your preference
			})
			-- tmux "sends" the keys back to it
			vim.keymap.set("n", "<C-h>", ntn.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", ntn.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", ntn.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", ntn.NvimTmuxNavigateRight)
		end,
	},

	-- -- An optional companion plugin for copilot.lua
	-- {
	--   "olimorris/codecompanion.nvim",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "zbirenbaum/copilot.lua",
	--   },
	--   lazy = true,
	-- },
}
