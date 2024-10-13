return {
	"echasnovski/mini.starter",
	version = false,
	event = "VimEnter",
	config = function()
		local logo = table.concat({
			"            ██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          ",
			"            ██╔══██╗██╔══██╗██║   ██║██║████╗ ████║          ",
			"            ██████╔╝██████╔╝██║   ██║██║██╔████╔██║          ",
			"            ██╔══██╗██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║          ",
			"            ██████╔╝██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          ",
			"            ╚═════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          ",
		}, "\n")
		local pad = string.rep(" ", 22)
		local new_section = function(name, action, section)
			return { name = name, action = action, section = pad .. section }
		end
		local starter = require("mini.starter")
		local config = {
			evaluate_single = true,
			header = logo,
			items = {
				starter.sections.sessions(5, true),
				starter.sections.telescope(),
				new_section("Quit", "qa", "Exit"),
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(pad .. "░ ", false),
				starter.gen_hook.aligning("center", "center"),
			},
		}
		starter.setup(config)

		-- Update the footer with lazy stats after plugins have loaded
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local pad_footer = string.rep(" ", 8)
				starter.config.footer = pad_footer
					.. "⚡ Neovim loaded "
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				if vim.bo.filetype == "ministarter" then
					MiniStarter.refresh()
				end
			end,
		})
	end,
}
