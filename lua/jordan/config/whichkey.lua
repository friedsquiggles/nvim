return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local which_key = require("which-key")
    local icons = {
      ui = require("jordan.icons").get("ui", true),
      cmp = require("jordan.icons").get("cmp", true),
      misc = require("jordan.icons").get("misc", true),
      type = require("jordan.icons").get("type", true),
    }

    which_key.setup({
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1, 2 },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
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
    })

    local groups = {
      mode = { "n" },
      --prefix
      ["["] = { name = icons.ui.ChevronLeft .. " previous" },
      ["]"] = { name = icons.ui.ChevronRight .. " next" },
      ["<leader>b"] = { name = icons.ui.FolderOpen .. " buffers" },
      ["<leader>e"] = { name = icons.ui.List .. " explorer" },
      ["<leader>s"] = { name = icons.ui.Search .. " search" },
      ["<leader>g"] = { name = icons.cmp.copilot_alt .. " git" },
      ["<leader>x"] = { name = icons.misc.LspAvailable .. " trouble" },
      ["<leader>n"] = { name = icons.ui.Note .. " notifications" },
      ["<leader>t"] = { name = icons.ui.Toggle .. " toggle" },
      --ignore
      ["<leader>1"] = "which_key_ignore",
      ["<leader>2"] = "which_key_ignore",
      ["<leader>3"] = "which_key_ignore",
      ["<leader>4"] = "which_key_ignore",
      ["<leader>5"] = "which_key_ignore",
      ["<leader>6"] = "which_key_ignore",
      ["<leader>7"] = "which_key_ignore",
      ["<leader>8"] = "which_key_ignore",
      ["<leader>9"] = "which_key_ignore",
      ["<leader>0"] = "which_key_ignore",
    }

    which_key.register(groups)
  end,
}
