return {
  "smoka7/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
  config = function()
    require("hop").setup()
  end,
}
