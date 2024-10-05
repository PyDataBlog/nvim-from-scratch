return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
