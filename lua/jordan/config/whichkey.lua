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
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
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

    -- todo - custom mappings by category
    -- local normalOpts = {
    --   mode = "n",
    --   prefix = "<leader>",
    --   buffer = nil,
    --   silent = true,
    --   noremap = true,
    --   nowait = true,
    -- }
    --
    -- local normalMappings = {
    --   c = { name = icons.ui.Gear .. "Config" },
    --   b = { name = icons.ui.FolderOpen .. "Buffers" },
    --   e = { name = icons.ui.List .. "Explorer" },
    --   f = { name = icons.ui.Search .. "Find" },
    --   g = { name = icons.cmp.copilot_alt .. "Git" },
    --   l = { name = icons.cmp.LspAvailable .. "LSP" },
    --   r = { name = icons.ui.CodeAction .. "LSP" },
    --   t = { name = icons.type.Boolean .. "Toggle" },
    --   ["["] = { name = icons.type.Boolean .. "Previous" },
    --   ["]"] = { name = icons.type.Boolean .. "Next" },
    -- }
    --
    -- local visualOpts = {
    --   mode = "v",
    --   prefix = "<leader>",
    --   silent = true,
    --   noremap = true,
    --   nowait = true,
    -- }
    -- local visualMappings = {}
    --
    local groups = {
      mode = { "n" },
      ["["] = { name = "previous" },
      ["]"] = { name = "next" },
      ["<leader>b"] = { name = "+buffers" },
      ["<leader>e"] = { name = "+explorer" },
      -- ["<leader>d"] = { name = "+debug" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>g"] = { name = "+git" },
      -- ["<leader>h"] = { name = "+hop" },
      -- ["<leader>l"] = { name = "+lsp" },
      -- ["<leader>m"] = { name = "+markdown" },
      -- ["<leader>r"] = { name = "+code_runner" },
      ["<leader>t"] = { name = "+toggle" },
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
