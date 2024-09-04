return {
	"mg979/vim-visual-multi",
	setup = function()
		vim.g.VM_maps = {}
		vim.g.VM_maps["Find Under"] = "<C-n>"
		vim.g.VM_maps["Find Subword Under"] = "<C-n>"
	end,
}
