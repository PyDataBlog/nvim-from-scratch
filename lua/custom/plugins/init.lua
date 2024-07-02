return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{
		"christoomey/vim-tmux-navigator",
		event = "BufReadPre", -- load on startup
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
			{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
		},
	},
}
