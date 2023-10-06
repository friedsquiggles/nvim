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
        border = "double",
        position = "bottom",
        margin = { 2, 0, 2, 0 },
        padding = { 2, 2, 2, 2 },
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
      --prefix
      ["["] = { name = icons.ui.ChevronLeft .. " prev & first" },
      ["[b"] = { name = "prev buffer" },
      ["[B"] = { name = "first buffer" },
      ["[c"] = { name = "prev comment" },
      ["[C"] = { name = "first comment" },
      ["[d"] = { name = "prev diag" },
      ["[D"] = { name = "first diag" },
      ["[i"] = { name = "prev indent" },
      ["[I"] = { name = "first indent" },
      ["[j"] = { name = "prev jump" },
      ["[J"] = { name = "first jump" },
      ["[l"] = { name = "prev location" },
      ["[L"] = { name = "first location" },
      ["[m"] = { name = "prev outer class end" },
      ["[M"] = { name = "first outer class end" },
      ["[n"] = { name = "prev treesitter" },
      ["[N"] = { name = "first treesitter" },
      ["[o"] = { name = "prev oldfile" },
      ["[O"] = { name = "first oldfile" },
      ["[u"] = { name = "prev undo" },
      ["[U"] = { name = "first undo" },
      ["[x"] = { name = "prev conflict" },
      ["[X"] = { name = "first conflict" },

      ["]"] = { name = icons.ui.ChevronRight .. " next & last" },
      ["]b"] = { name = "next buffer" },
      ["]B"] = { name = "last buffer" },
      ["]c"] = { name = "next comment" },
      ["]C"] = { name = "last comment" },
      ["]d"] = { name = "next diag" },
      ["]D"] = { name = "last diag" },
      ["]i"] = { name = "next indent" },
      ["]I"] = { name = "last indent" },
      ["]j"] = { name = "next jump" },
      ["]J"] = { name = "last jump" },
      ["]l"] = { name = "next location" },
      ["]L"] = { name = "last location" },
      ["]m"] = { name = "next outer class end" },
      ["]M"] = { name = "last outer class end" },
      ["]n"] = { name = "next treesitter" },
      ["]N"] = { name = "last treesitter" },
      ["]o"] = { name = "next oldfile" },
      ["]O"] = { name = "last oldfile" },
      ["]u"] = { name = "next undo" },
      ["]U"] = { name = "last undo" },
      ["]x"] = { name = "next conflict" },
      ["]X"] = { name = "last conflict" },

      -- ["<leader>,"] = { name = "prev buffer" },

      ["<leader>b"] = { name = icons.ui.FolderOpen .. " buffers" },
      ["<leader>e"] = { name = icons.ui.List .. " explorer" },
      ["<leader>s"] = { name = icons.ui.Search .. " search" },
      ["<leader>g"] = { name = icons.cmp.copilot_alt .. " git" },
      ["<leader>x"] = { name = icons.misc.LspAvailable .. " trouble" },
      ["<leader>n"] = { name = icons.ui.Note .. " notifications" },
      ["<leader>t"] = { name = icons.ui.Toggle .. " toggle" },
      ["<leader>c"] = { name = icons.ui.Gear .. " config" },
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
