return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- Set to false to always pull the latest features
	build = "make", -- Important: Requires cargo and make installed on your system

	opts = {
		provider = "copilot", -- Primary AI engine
		auto_suggestions_provider = "copilot", -- Use Copilot for ghost text

		-- NEW 2025/2026 PROVIDER STRUCTURE
		providers = {
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "gpt-4o", -- Balanced for speed/logic in 2026
				proxy = nil,
				timeout = 30000,
				temperature = 0,
				extra_request_body = {
					max_tokens = 4096,
				},
			},
			-- Example: Gemini config (can be swapped via :AvanteSwitchProvider)
			gemini = {
				model = "gemini-2.0-flash",
				extra_request_body = {
					max_tokens = 8192,
					temperature = 0,
				},
			},
		},

		-- UI and Behavior
		behaviour = {
			auto_suggestions = false, -- Set to true for Copilot-style ghost text
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			minimize_diff = true, -- Better for small screens
		},

		windows = {
			position = "right",
			width = 35,
			sidebar_header = {
				enabled = true,
				align = "center",
			},
		},
	},

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			-- Bridge for Copilot Auth
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false }, -- Avante handles suggestions
					panel = { enabled = false },
				})
			end,
		},
		{
			-- Beautiful rendering of AI markdown
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
		{
			-- Support for pasting images into the AI chat
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
				},
			},
		},
	},
}
