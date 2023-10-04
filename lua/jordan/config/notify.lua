local icons = {
  diagnostics = require("jordan.icons").get("diagnostics"),
  ui = require("jordan.icons").get("ui"),
}

return {
  "rcarriga/nvim-notify",
  dependencies = "plenary.nvim",
  keys = {
    {
      "<leader>nd",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },

  opts = {
    timeout = 5000,
    stages = "fade",
    fps = 20,

    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,

    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,

    render = "default",

    icons = {
      ERROR = icons.diagnostics.Error,
      WARN = icons.diagnostics.Warning,
      INFO = icons.diagnostics.Information,
      DEBUG = icons.ui.Bug,
      TRACE = icons.ui.Pencil,
    },

    level = "INFO",
  },

  init = function()
    local banned_messages = { "No information available" }
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      return require("notify")(msg, ...)
    end
  end,
}
