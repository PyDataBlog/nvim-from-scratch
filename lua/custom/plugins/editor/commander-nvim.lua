return {
	"FeiyouG/commander.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>fc", "<CMD>Telescope commander<CR>", mode = "n" },
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("commander").setup({
			components = {
				"DESC",
				"KEYS",
				"CAT",
			},
			sort_by = {
				"DESC",
				"KEYS",
				"CAT",
				"CMD",
			},
			integration = {
				telescope = {
					enable = true,
				},
				lazy = {
					enable = false,
					set_plugin_name_as_cat = true,
				},
			},
		})
	end,
}
