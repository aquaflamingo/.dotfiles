-- lua/plugins/theme.lua

return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure the colorscheme is loaded first
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- The colorscheme is set in init.lua to ensure it's loaded very early
  end,
}
