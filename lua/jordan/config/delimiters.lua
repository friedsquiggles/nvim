return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rd = require("rainbow-delimiters")
    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = rd.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
      },
      blacklist = { "c", "cpp" },
    })
  end,
}
