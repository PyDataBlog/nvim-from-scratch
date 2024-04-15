return 	{
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
        require("chatgpt").setup()
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
}