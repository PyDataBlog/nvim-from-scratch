return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				rainbow_delimiters = true,
				render_markdown = true,
				lsp_trouble = true,
				dropbar = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
				dap = true,
				dap_ui = true,
				neotest = true,
				notify = false,
				noice = true,
				ufo = true,
				overseer = true,
				flash = true,
				mason = false,
				semantic_tokens = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				telescope = {
					enabled = true,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "text", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
	end,
}
