-- lua/plugins/git.lua
-- Contains plugins related to Git integration

return {
  -- Git wrapper - :Git status, :Git commit, etc.
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = true,
  },

  -- Git status signs in the sign column
  {
    "airblade/vim-gitgutter",
    event = "BufReadPre",
    lazy = true,
  },
}
