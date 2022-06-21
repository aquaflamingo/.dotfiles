-- Functions

-- When inside a buffer use :W to create the parent directory and save the
-- buffer
--

vim.api.nvim_create_user_command(
  'W', 
  function(opts) 
    local mkdir_cmd = "silent !mkdir -p %:h"
    local write_cmd = "write"

    vim.cmd(mkdir_cmd)
    vim.cmd(write_cmd)
  end,
{})

vim.api.nvim_create_user_command(
  'Rename',
  function(opts)
    print("not implemented")
  end,
{})

