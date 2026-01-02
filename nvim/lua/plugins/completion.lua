return {
	"saghen/blink.cmp",
	lazy = false, -- Blink is high performance; loading it early is fine
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets", -- Highly recommended for actual snippets
	},
	-- In 2026, '*' pulls the latest stable pre-built binary
	version = "*",

	-- Use 'opts' instead of 'config' for better merging with blink's defaults
	opts = {
		-- 1. Configure snippet expansion
		snippet = {
			preset = "luasnip",
		},

		-- 2. Define Key Mappings
		-- In blink, we use a simple command-based table, NOT nvim-cmp functions.
		keymap = {
			preset = "none", -- We define our own below
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },

			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},

		-- 3. Appearance (The 2026 API)
		completion = {
			menu = { border = "rounded" },
			documentation = {
				auto_show = true,
				window = { border = "rounded" },
			},
		},

		-- 4. Sources
		-- No need for cmp.config.sources() logic. Just list the providers.
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- OPTIONAL: Modern UI features
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
	},
}
