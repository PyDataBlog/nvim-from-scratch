return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and "" or ""
				return icon .. count
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup({
			options = opts,
		})
	end,
}
