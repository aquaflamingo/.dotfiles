-- Functions

-- When inside a buffer use :W to create the parent directory and save the
-- buffer
--
vim.api.nvim_create_user_command(
  'W', 
  function(opts) 
    vim.cmd "silent !mkdir -p %:h"
    vim.cmd "write"
  end,
  {})
