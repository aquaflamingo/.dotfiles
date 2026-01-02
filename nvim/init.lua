-- 2026 Neovim Configuration: Main Entrypoint

-- Set leader key before any plugins are loaded
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
require("core.lazy")

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.commands")

-- Setup lazy.nvim to load plugins
require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
  -- Ensures plugins are correctly loaded on startup
  install = {
    colorscheme_body = "colorscheme tokyonight-storm",
  },
  -- Automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false, -- Don't notify on startup, we can check manually
  },
  -- Handle performance tracking and reporting
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Set the colorscheme after plugins are loaded
-- A protected call is used to gracefully handle the initial setup
-- before the colorscheme is installed.
pcall(vim.cmd, "colorscheme tokyonight-storm")