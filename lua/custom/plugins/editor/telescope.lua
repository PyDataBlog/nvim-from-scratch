return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"debugloop/telescope-undo.nvim",
		"andrew-george/telescope-themes",
		"dharmx/telescope-media.nvim",
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2", -- Ensure correct branch for Harpoon
		},
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local harpoon = require("harpoon")
		harpoon:setup({})

		-- Toggle telescope to show Harpoon marks
		local conf = require("telescope.config").values
		_G.toggle_telescope = function(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				undo = {
					-- telescope-undo.nvim config
				},
				file_browser = {
					hijack_netrw = false,
				},
			},
		})

		-- Load telescope extensions
		telescope.load_extension("fzf")
		telescope.load_extension("undo")
		telescope.load_extension("themes")
		telescope.load_extension("media")
		telescope.load_extension("file_browser")
		telescope.load_extension("noice")
	end,
}
