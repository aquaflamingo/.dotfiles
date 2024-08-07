
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("Nvim Tree status was bad") 
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	print("Nvim Tree config status was bad: ")
	print(config_status_ok) 
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  -- following options are the default
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  actions = {
    change_dir = {
        -- Do not change current working directory if you use the nvim-tree
        enable = false,
        global = false,
        restrict_above_cwd = false,
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
