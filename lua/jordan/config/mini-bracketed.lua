return {
  "echasnovski/mini.bracketed",
  event = "BufReadPost",
  config = function()
    local bracketed = require("mini.bracketed")
    bracketed.setup({})
  end,
}
