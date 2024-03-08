local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts = {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = false,
    },

    presets = {
      operators = false,
      motions = false,
      text_objects = true,
      windows = false,
      nav = false,
      z = true,
      g = true,
    },
  },

  window = {
    border = "double",
    position = "bottom",
    margin = { 4, 4, 4, 4 },
    padding = { 4, 4, 4, 4 },
  },

  layout = {
    height = { min = 10, max = 25 },
    width = { min = 20, max = 40 },
    spacing = 6,
    align = "left",
  },

  triggers_nowait = {
    "`",
    "'",
    "g`",
    "g'",
    '"',
    "<c-r>",
    "z=",
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
