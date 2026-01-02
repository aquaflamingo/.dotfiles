-- lua/plugins/lsp.lua
--
-- The heart of the IDE functionality. This file configures the LSP (Language Server Protocol)
-- clients, which provide features like go-to-definition, code completion, diagnostics, and more.
-- It uses `nvim-lspconfig` to manage server configurations and defines the behavior
-- that occurs when an LSP client attaches to a buffer.

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- 1. Native Diagnostic Icons (v0.11+ way)
		-- In 2026, we don't use sign_define; we use vim.diagnostic.config signs.
		        local signs = {
		          { name = "DiagnosticSignError", text = "" },
		          { name = "DiagnosticSignWarn", text = "" },
		          { name = "DiagnosticSignHint", text = "" },
		          { name = "DiagnosticSignInfo", text = "" },
		        }		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = { border = "rounded", source = "always" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = signs.Error,
					[vim.diagnostic.severity.WARN] = signs.Warn,
					[vim.diagnostic.severity.HINT] = signs.Hint,
					[vim.diagnostic.severity.INFO] = signs.Info,
				},
			},
		})

		-- 2. Modern Keymaps (Using LspAttach autocmd)
		-- This is the industry standard for 2026. Avoids 'on_attach' boilerplate.
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				local opts = { buffer = bufnr, silent = true }
				local map = vim.keymap.set

				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				-- Document Highlight (if supported)
				if client and client.supports_method("textDocument/documentHighlight") then
					local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = bufnr,
						group = group,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = bufnr,
						group = group,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- 3. Mason & Capabilities
		require("mason").setup()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Check if blink is available; if so, merge its capabilities
		local has_blink, blink = pcall(require, "blink.cmp")
		if has_blink then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- 4. Server Setup (Using the new Native Bridge)
		-- NOTE: tsserver is now ts_ls!
		local servers = { "ts_ls", "lua_ls", "pyright", "html" }

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		-- High-Performance Server Loop
		-- Instead of framework setup, we use the core enable command
		for _, server in ipairs(servers) do
			-- Special settings for Lua
			local config = { capabilities = capabilities }
			if server == "lua_ls" then
				config.settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
					},
				}
			end

			-- The 0.11 Native Way (Replaces require('lspconfig')[server].setup)
			vim.lsp.enable(server, config)
		end
	end,
}
