local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	 local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	 local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	 -- Enable completion triggered by <c-x><c-o>
	 buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	 -- Mappings.
	 local opts = { noremap=true, silent=true }

	 -- See `:help vim.lsp.*` for documentation on any of the below functions
	 buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	 buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	 buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	 buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	 buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	 buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	 buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	 buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	 buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	 buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	 buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	 buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	 buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	 buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	 buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	 buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	 buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- Map buffer local keybindings when the language server attaches
-- FULL LIST https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- See Ruby https://github.com/castwide/solargraph
-- See Python https://github.com/microsoft/pyright
-- See Rust https://rust-analyzer.github.io/manual.html#installation
-- See Go https://github.com/golang/tools/tree/master/gopls
-- See Bash https://github.com/bash-lsp/bash-language-server
-- See Crystal https://github.com/elbywan/crystalline
-- See Docker https://github.com/rcjsuen/dockerfile-language-server-nodejs
-- See Vim https://github.com/iamcco/vim-language-server
-- See C# https://github.com/omnisharp/omnisharp-roslyn
-- See Terraform https://github.com/hashicorp/terraform-ls
-- See SourceKit https://github.com/apple/sourcekit-lsp
--
local servers = {
	 ruby = {'solargraph'},
	 python = {'pyright'}, 
	 rust = {'rust_analyzer'}, 
	 go ={'gopls'},
	 bash ={'bashls'},
	 crystal ={'crystalline'},
	 docker ={'dockerls'},
	 vim ={'vimls'},
	 swift ={'sourcekit'},
}

for k, lsp in pairs(servers) do
	 server = lsp[1]

	 nvim_lsp[server].setup {
			on_attach = on_attach,
			flags = {
				 debounce_text_changes = 150,
			}
	 }
end
