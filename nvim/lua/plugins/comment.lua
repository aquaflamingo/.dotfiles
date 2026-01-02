-- lua/plugins/comment.lua

return {
	"numToStr/Comment.nvim",
	-- `opts = {}` is the same as calling `require('Comment').setup({})`
	opts = {},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}

