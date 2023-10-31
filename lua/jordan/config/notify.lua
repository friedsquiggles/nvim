local icons = {
  diagnostics = require("jordan.icons").get("diagnostics"),
  ui = require("jordan.icons").get("ui"),
}

return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")

    require("notify").setup({
      stages = "fade_in_slide_out",
      on_open = nil,
      on_close = nil,
      render = "default",
      timeout = 3000,
      max_width = nil,
      max_height = nil,
      -- background_colour = "#000000",
      minimum_width = 50,
      icons = {
        ERROR = icons.diagnostics.Error,
        WARN = icons.diagnostics.Warning,
        INFO = icons.diagnostics.Information,
        DEBUG = icons.ui.Bug,
        TRACE = icons.ui.Pencil,
      },
    })

    require("telescope").load_extension("notify")
  end,
}
