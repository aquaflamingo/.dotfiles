local is_ok, _ = pcall(require, "lspconfig")
if not is_ok then
  return
end

require ("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
