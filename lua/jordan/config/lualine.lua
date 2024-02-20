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
      lualine_a = {
        { "mode", separator = "" },
      },

      lualine_b = {
        { "buffers" },
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
      },

      lualine_x = {
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

      lualine_y = {
        { "location", separator = " ", padding = { left = 0, right = 1 } },
      },

      lualine_z = {
        { "progress", padding = { left = 1, right = 1 } },
      },
    },
  },
}
