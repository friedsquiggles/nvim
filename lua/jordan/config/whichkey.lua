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

    -- normal mode opts
    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    -- local mappings = {
    --   [";"] = { "<cmd>Alpha<cr>", "" },
    --   ["/"] = { "<cmd><cr>", "" },
    --   ["?"] = { "<cmd><cr>", "" },
    --   [">"] = { "<cmd><cr>", "" },
    --   ["<lt>"] = { "<cmd><cr>", "" },
    --   --groups
    --   ["a"] = { name = "" },
    --   ["b"] = { name = "[b]uffers" },
    --   ["c"] = { name = "" },
    --   ["d"] = { name = "[d]ebug" },
    --   ["e"] = { name = "" },
    --   ["f"] = { name = "" },
    --   ["g"] = { name = "[g]it" },
    --   ["h"] = { name = "" },
    --   ["i"] = { name = "" },
    --   ["j"] = { name = "" },
    --   ["k"] = { name = "" },
    --   ["l"] = { name = "[l]sp" },
    --   ["m"] = { name = "" },
    --   ["n"] = { name = "" },
    --   ["o"] = { name = "[o]utline" },
    --   ["p"] = { name = "" },
    --   ["q"] = { name = "" },
    --   ["s"] = { name = "[s]earch" },
    --   ["t"] = { name = "" },
    --   ["u"] = { name = "" },
    --   ["v"] = { name = "" },
    --   ["w"] = { name = "" },
    --   ["x"] = { name = "diagnosti[x]" },
    --   ["y"] = { name = "" },
    --   ["z"] = { name = "" },
    -- }

    -- insert mode options
    local vopts = {
      mode = "v",
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    -- local v_mappings = {}

    -- insert mode options
    local iopts = {
      mode = "i",
      prefix = "<C-i>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    -- local i_mappings = {}

    which_key.register(groups)
  end,
}
