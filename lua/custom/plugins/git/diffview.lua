return {
  -- optional: for diffview.nvim integration
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- lazy, only load diffview by these commands
  cmd = {
    "DiffviewFileHistory",
    "DiffviewOpen",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
}
