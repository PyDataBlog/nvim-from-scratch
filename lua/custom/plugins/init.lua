return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},
}
