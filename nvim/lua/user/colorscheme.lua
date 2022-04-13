-- Try to set the colorscheme and if not found just set default
local cs = "default"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. cs)

if not is_ok then
  vim.notify("colorscheme " .. cs .. " was not found!")
  return
end 
