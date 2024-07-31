local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts = {
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
    border = "double",
    -- position = "bottom",
    padding = { 2, 2, 2, 2 },
  },

  layout = {
    height = { min = 16, max = 25 },
    width = { min = 20, max = 40 },
    spacing = 4,
    align = "left",
  },

  hidden = { "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },

  icons = {
    group = "",
  },

  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
}

M.config = function(_, opts)
  local wk = require("which-key")
  wk.setup(opts)
end

return M
