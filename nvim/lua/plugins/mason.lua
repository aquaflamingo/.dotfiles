-- lua/plugins/mason.lua

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Enable Mason and configure automatic installation of LSPs, formatters, and linters
    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already installed
      ensure_installed = {
        "pyright",
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "ts_ls",
        "bashls",
        "dockerls",
        "jsonls",
        "marksman",
        "yamlls",
      },
    })

    -- Install formatters and linters
    mason_tool_installer.setup({
      ensure_installed = {
        "stylua", -- lua formatter
        "prettier", -- ts/js formatter
        "flake8", -- python linter
        "black", -- python formatter
      },
    })
  end,
}