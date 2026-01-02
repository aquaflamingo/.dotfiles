-- lua/config/commands.lua
--
-- This file defines custom user commands for Neovim.

vim.api.nvim_create_user_command(
  'W',
  function(opts)
    local mkdir_cmd = "silent !mkdir -p %:h"
    local write_cmd = "write"

    -- Ensure parent directories exist before writing the file
    vim.cmd(mkdir_cmd)
    -- Write the current buffer to file
    vim.cmd(write_cmd)
  end,
  {
    desc = "Create parent directories and write current buffer",
    bang = true, -- Allow ! for force writing (e.g., :W!)
    nargs = "?", -- Allows optional arguments (e.g., :W new_file.txt)
  }
)
