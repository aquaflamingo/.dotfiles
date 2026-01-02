-- lua/plugins/misc.lua
-- Other utility plugins

return {
  -- Smoothly navigate between tmux and Neovim panes
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = true,
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
      })
    end,
  },

  -- An optional companion plugin for copilot.lua
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "zbirenbaum/copilot.lua",
    },
    lazy = true,
  },
}