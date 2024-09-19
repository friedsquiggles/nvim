local icons = {
  git = require("jordan.ui.icons").get("git", true),
  ui = require("jordan.ui.icons").get("ui", true),
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
      component_separators = "|",
      section_separators = ""
    },

    sections = {
      -- left side
      lualine_a = {
        { "mode", separator = "", fmt = function(str) return str:sub(1,1) end },
      },

      lualine_b = {
        { "buffers", mode = 1, },
        { "filename", path = 1, shorting_target = 60, },
      },

      lualine_c = {
        { "diagnostics", },
      },

      -- right side
      lualine_x = {
        { "diff" },
      },

      lualine_y = {
        { "branch" },
      },

      lualine_z = {
        { "progress", padding = { left = 1, right = 1 }, },
      },
    },
  },
}
