-- lua/plugins/nvim-tree.lua

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Recommended settings: disable netrw at the start
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- 1. Create the modern on_attach function
		-- This replaces the old view.mappings.list block
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- Apply default mappings (so you don't lose basic functionality)
			api.config.mappings.default_on_attach(bufnr)

			-- Add your custom mappings (Replaces your lines 58-63)
			vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("Vsplit"))
		end

		-- 2. Setup the tree
		require("nvim-tree").setup({
			on_attach = my_on_attach, -- Attach our custom keybinds here
			disable_netrw = true,
			hijack_netrw = true,

			filters = {
				dotfiles = false,
				custom = { ".git", "node_modules", ".cache" },
			},

			git = {
				enable = true,
				ignore = false,
			},

			renderer = {
				group_empty = true,
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
				},
			},

			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},

			view = {
				width = 30,
				side = "left",
			},

			actions = {
				change_dir = {
					enable = false,
					global = false,
				},
			},
		})
	end,
}
