local icons = {
  diagnostics = require("jordan.ui.icons").get("diagnostics"),
  ui = require("jordan.ui.icons").get("ui"),
}

local M = {
  "rcarriga/nvim-notify",
}

M.opts = {
  timeout = 3000,
  render = "minimal",

  max_height = function()
    return math.floor(vim.o.lines * 0.25)
  end,

  max_width = function()
    return math.floor(vim.o.columns * 0.45)
  end,

  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },
}

M.config = function()
  vim.notify = require("notify")
  require("telescope").load_extension("notify")
end

return M
