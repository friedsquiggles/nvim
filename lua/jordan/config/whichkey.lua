local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts = {
  preset = "helix",
  plugins = {
    marks = true,
    registers = false,
    spelling = {
      enabled = false,
    },

    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },

  win = {
    border = "rounded",
    no_overlap = false,
    title = false,
    height = { min = 10, max = 80 },
    padding = { 2, 2, 2, 2 },
  },

  layout = {
    height = { min = 16, max = 25 },
    width = { min = 20, max = 40 },
    spacing = 4,
    align = "left",
  },

  sort = { "alphanum" },

  icons = {
    group = "",
  },
}

M.config = function(_, opts)
  local wk = require("which-key")
  wk.setup(opts)
end

return M
