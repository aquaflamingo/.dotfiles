require"bufferline".setup{
	 options = {
			show_buffer_icons = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
	 },
	 highlights = {
			tab = {
				 guifg = 'grey',
			},
			tab_selected = {
				 guifg = "yellow",
			},
			-- buffer_selected = {
			-- 		guifg = normal_fg,
			-- 		guibg = 'darkblue',
			-- 		gui = "bold,italic"
			-- },
	 },
	 groups = {
			options = {
				 toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				 {
						name = "Tests", -- Mandatory
						highlight = {gui = "underline", guisp = "blue"}, -- Optional
						priority = 2, -- determines where it will appear relative to other groups (Optional)
						matcher = function(buf) -- Mandatory
							 return buf.filename:match('%_test') or buf.filename:match('%_spec')
						end,
				 },
				 {
						name = "Docs",
						highlight = {gui = "undercurl", guisp = "green"},
						auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
						matcher = function(buf)
							 return buf.filename:match('%.md') or buf.filename:match('%.txt')
						end,
						separator = { -- Optional
						style = require('bufferline.groups').separator.tab
				 }
			},
	 }
}
}

