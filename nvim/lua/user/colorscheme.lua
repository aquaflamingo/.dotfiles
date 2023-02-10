-- Try to set the colorscheme and if not found just set default

local scheme_dawnfox = "dawnfox"
local scheme_nordfox = "nordfox"
local scheme_duskfox = "duskfox"
local scheme_nightfox = "nightfox"

local cs = scheme_nightfox

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. cs)

if not is_ok then
  vim.notify("colorscheme " .. cs .. " was not found!")
  return
end 
