return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)
	end,
}
