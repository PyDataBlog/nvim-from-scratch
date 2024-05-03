return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
    },
  },
  config = function(_, opts)
    require("bufferline").setup {
      options = opts,
    }
  end
}

