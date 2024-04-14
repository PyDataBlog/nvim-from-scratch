local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { import = "custom.plugins" },
    { import = "custom.plugins.completion" },
    { import = "custom.plugins.dap" },
    { import = "custom.plugins.editor" },
    { import = "custom.plugins.git" },
    { import = "custom.plugins.go" },
    { import = "custom.plugins.lsp" },
    { import = "custom.plugins.motion" },
    { import = "custom.plugins.python" },
    { import = "custom.plugins.rust" },
    { import = "custom.plugins.themes" },
    { import = "custom.plugins.tools" },
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = true,
    },
  }
)
