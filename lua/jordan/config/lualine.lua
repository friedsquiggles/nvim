local icons = {
  git = require("jordan.ui.icons").get("git", true),
  ui = require("jordan.ui.icons").get("ui", true),
  misc = require("jordan.ui.icons").get("misc", true),
  diagnostics = require("jordan.ui.icons").get("diagnostics", true),
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  event = "VeryLazy",

  opts = {
    options = {
      theme = "catppuccin",
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },

      lualine_b = {
        { "branch" },
        {
          "diff",
          symbols = {
            added = icons.git.Add,
            modified = icons.git.Mod,
            removed = icons.git.Remove,
          },
        },
      },

      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warning,
            info = icons.diagnostics.Information,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = icons.ui.Modified_alt } },
      },

      lualine_x = {
        { "searchcount" },
      },

      lualine_y = {
        { "location", separator = " ", padding = { left = 1, right = 0 } },
        { "progress", padding = { left = 0, right = 2 } },
      },

      lualine_z = {
        function()
          return icons.misc.Watch .. os.date("%R")
        end,
      },
    },
  },
}
