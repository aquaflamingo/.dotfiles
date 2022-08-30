local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name 
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
-- Shift+l or +h 
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Quick vim
keymap("n", "<leader>ev", ":split $HOME/.config/nvim<CR>", opts)
keymap("n", "<leader>sv", ":source $HOME/.config/nvim/init.lua<CR>", opts)

-- Move text up and down with alt key
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Switch background to light or darkmode
keymap("n", "<leader>b", ":let &background = ( &background == 'dark'? 'light' : 'dark' )<CR>", opts)

-- Delete buffer
keymap("n", "<leader>d", ":bd!<CR>", opts)

-- Tabs
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<C-y>", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>t", ":Telescope ", opts)

--- Tree
keymap("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", opts)

-- Fugitive
keymap("n", "<leader>gs", "<cmd>Git<CR>", opts)
keymap("n", "<leader>cf", "<cmd><C-U>Git commit --fixup=<C-R>=<SID>SquashArgument()<CR>", opts)
keymap("n", "<leader>cc", "<cmd><C-U>Git commit<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- When pasting, do not save the text pasted over 
-- into the default register. Just hold onto it.
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Quick fix --
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprevious<CR>", opts)
