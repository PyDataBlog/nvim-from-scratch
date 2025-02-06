return {
	"olimorris/codecompanion.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "iguanacucumber/magazine.nvim", name = "nvim-cmp" }, -- Optional: For using slash commands and variables in the chat buffer
		"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" }, -- Optional: For prettier markdown rendering
		},
		{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
	},
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					render_headers = false,
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
					slash_commands = {
						["file"] = {
							opts = {
								provider = "telescope",
							},
						},
						["buffer"] = {
							opts = {
								provider = "telescope",
							},
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
			},
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.5-sonnet",
							},
						},
					})
				end,
			},
		})
	end,
}
