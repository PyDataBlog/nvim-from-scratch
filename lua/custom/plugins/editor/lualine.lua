return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "stevearc/overseer.nvim" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local overseer = require("overseer")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
					{
						function()
							return vim.g.remote_neovim_host and ("Remote: %s"):format(vim.uv.os_gethostname()) or ""
						end,
						padding = { right = 1, left = 1 },
						separator = { left = "", right = "" },
					},
					{
						"overseer",
						label = "", -- Prefix for task counts
						colored = true, -- Color the task icons and counts
						symbols = {
							[overseer.STATUS.FAILURE] = "F:",
							[overseer.STATUS.CANCELED] = "C:",
							[overseer.STATUS.SUCCESS] = "S:",
							[overseer.STATUS.RUNNING] = "R:",
						},
						unique = false, -- Unique-ify non-running task count by name
						name = nil, -- List of task names to search for
						name_not = false, -- When true, invert the name search
						status = nil, -- List of task statuses to display
						status_not = false, -- When true, invert the status search
					},
				},
			},
		})
	end,
}
