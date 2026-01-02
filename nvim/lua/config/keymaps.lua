-- 2026 Neovim Configuration: Core Keymaps
-- For more information, see `:help key-mapping`

-- Shorten function name for readability
local keymap = vim.keymap.set

-- General options for keymaps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Normal Mode
---------------------------------------------------

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>d", ":bd!<CR>", opts)

-- Edit/Source Neovim config
keymap("n", "<leader>ev", ":split $MYVIMRC<CR>", opts)
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- Move selected lines up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Toggle background
keymap("n", "<leader>b", ":let &background = ( &background == 'dark'? 'light' : 'dark' )<CR>", opts)

-- Fuzzy Finder (fzf-lua)
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<C-p>", "<cmd>FzfLua files<CR>", opts)
keymap("n", "<C-q>", "<cmd>FzfLua quickfix<CR>", opts)
keymap("n", "<C-f>", "<cmd>FzfLua live_grep<CR>", opts)
keymap("n", "<C-y>", "<cmd>FzfLua buffers<CR>", opts)
keymap("n", "<leader>t", ":FzfLua ", opts)

-- File Tree
keymap("n", "<leader>f", "<cmd>NvimTreeOpen<CR>", opts)

-- Git
keymap("n", "<leader>gs", "<cmd>Git<CR>", opts)

-- Visual Mode
---------------------------------------------------

-- Keep indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected lines up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Preserve the default register when pasting over a selection
keymap("v", "p", '"_dP', opts)

-- Visual Block Mode
---------------------------------------------------

-- Move selected lines up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode
---------------------------------------------------

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Quickfix List
---------------------------------------------------
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprevious<CR>", opts)
