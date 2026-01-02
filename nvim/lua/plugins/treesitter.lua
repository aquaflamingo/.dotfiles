-- lua/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	-- add any direct dependencies here, e.g.
	build = ":TSUpdate",
	opts = {
		-- A list of parser names, or "all"
		ensure_installed = {
			"vimdoc",
			"lua",
			"markdown",
			"c",
			"rust",
			"go",
			"python",
			"typescript",
			"javascript",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		-- Treesitter based auto-pairing
		autopairs = {
			enable = true,
		},
		-- Provides context-aware commenting
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
	end,
}
