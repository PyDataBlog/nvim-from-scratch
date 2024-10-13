return {
	"echasnovski/mini.indentscope",
	version = "*", -- Use the latest version
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"alpha",
				"dashboard",
				"fzf",
				"help",
				"lazy",
				"lazyterm",
				"mason",
				"neo-tree",
				"notify",
				"toggleterm",
				"Trouble",
				"trouble",
				"mini-starter",
				"NvimTree",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
	config = function(_, opts)
		require("mini.indentscope").setup(opts)
	end,
}
