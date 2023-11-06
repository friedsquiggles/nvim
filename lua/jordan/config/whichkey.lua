return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local which_key = require("which-key")
    local icons = {
      ui = require("jordan.ui.icons").get("ui", true),
      cmp = require("jordan.ui.icons").get("cmp", true),
      misc = require("jordan.ui.icons").get("misc", true),
      type = require("jordan.ui.icons").get("type", true),
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
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },

      window = {
        border = "double",
        position = "bottom",
        margin = { 2, 0, 2, 0 },
        padding = { 2, 2, 2, 2 },
      },

      layout = {
        height = { min = 4, max = 16 }, -- min and max height of the columns
        width = { min = 20, max = 40 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
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

      hidden = { "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },

      icons = {
        group = "",
      },

      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
    })

    local groups = {
      mode = { "n" },
      ["<leader>b"] = { name = icons.ui.FolderOpen .. "buffers" },
      ["<leader>d"] = { name = icons.ui.Bug .. "diag" },
      ["<leader>e"] = { name = icons.ui.List .. "explorer" },
      ["<leader>s"] = { name = icons.ui.Search .. "search" },
      ["<leader>g"] = { name = icons.cmp.copilot_alt .. "git" },
      ["<leader>l"] = { name = icons.misc.LspAvailable .. "lsp" },
      ["<leader>x"] = { name = icons.ui.Fire .. "trouble" },
      ["<leader>t"] = { name = icons.ui.Toggle .. "toggle" },
      ["<leader>c"] = { name = icons.ui.Gear .. "config" },

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
