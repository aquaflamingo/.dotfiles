-- lua/plugins/icons.lua
-- This file is not strictly necessary, as other plugins
-- can list "nvim-tree/nvim-web-devicons" as a dependency.
-- However, creating it makes the dependency explicit and allows
-- for central configuration if ever needed.

return {
  "nvim-tree/nvim-web-devicons",
  lazy = true, -- It will be loaded automatically by other plugins
}