-- Check that navigator plugin works 
local nav_status_ok, nav = pcall(require, "nvim-tmux-navigation")
if not nav_status_ok then
  return
end

nav.setup {
  -- defaults to false
  disable_when_zoomed = true, 
  keybindings = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
  }
}
