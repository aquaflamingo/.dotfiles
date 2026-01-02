-- 2026 Neovim Configuration: Core Options
-- For more information, see `:help option-list`

local options = {
	-- Files and Backup
	clipboard = "unnamedplus",
	backup = false, -- creates a backup file
	swapfile = false, -- creates a swapfile
	undofile = true, -- enable persistent undo
	writebackup = false, -- if a file is being edited by another program, it is not allowed to be edited
	autoread = true, -- Have neovim reload the file automatically if it has changed externally

	-- Encoding
	fileencoding = "utf-8", -- the encoding written to a file

	-- UI
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	cursorline = true, -- highlight the current line
	  mouse = "a",           -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)

	-- Search
	incsearch = true, -- find next match as we type the search
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	smartcase = true, -- smart case

	-- Indentation
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	smartindent = true, -- make indenting smarter again

	-- Window Splits
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window

	-- Scrolling
	scrolloff = 8,
	sidescrolloff = 8,

	-- Wrapping
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, break lines at 'breakat'
	list = true, -- display invisible chars
	listchars = "tab:⇥·,trail:·", -- Set tab and trail characters

	-- Completion
	completeopt = { "menuone", "noselect" }, -- configure how completions behave
	conceallevel = 0, -- so that `` is visible in markdown files

	-- Spelling
	spell = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Neovim 0.10+ compatible way to set whichwrap
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,],h,l"

vim.cmd([[set iskeyword+=-]])
-- vim.cmd [[set formatoptions-=cro]] -- This is better handled by formatters or filetype plugins
