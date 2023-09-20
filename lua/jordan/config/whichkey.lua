return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local which_key = require("which-key")
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
        border = "shadow",
        position = "bottom",
        margin = { 0, 1, 1, 5 },
        padding = { 1, 2, 1, 2 },
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
