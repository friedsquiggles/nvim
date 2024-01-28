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
        marks = false,
        registers = false,
        spelling = {
          enabled = false,
        },

        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = false,
          nav = true,
          z = true,
          g = true,
        },
      },

      window = {
        border = "double",
        position = "bottom",
        margin = { 2, 0, 2, 0 },
        padding = { 2, 2, 2, 2 },
      },

      layout = {
        height = { min = 16, max = 24 },
        width = { min = 20, max = 40 },
        spacing = 5,
        align = "center",
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

    which_key.register({
      -- flash
      l = {
        name = "flash",
        s = {
          function()
            require("flash").jump()
          end,
          "flash jump",
        },
        t = {
          function()
            require("flash").treesitter()
          end,
          "flash treesitter",
        },
        r = {
          function()
            require("flash").treesitter_search()
          end,
          "flash treesitter search",
        },
        c = {
          function()
            require("flash").jump({
              pattern = vim.fn.expand("<cword>"),
            })
          end,
          "flash cursor word",
        },
      },
    }, { prefix = "<leader>" })
  end,
}
