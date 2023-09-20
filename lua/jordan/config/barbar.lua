local icons = {
  diagnostics = require("jordan.icons").get("diagnostics", true),
  git = require("jordan.icons").get("git", true),
}
return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = false,
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.diagnostics.Error },
        [vim.diagnostic.severity.WARN] = { enabled = false, icon = icons.diagnostics.Warning },
        [vim.diagnostic.severity.INFO] = { enabled = false, icon = icons.diagnostics.Information},
        [vim.diagnostic.severity.HINT] = { enabled = true, icon = icons.diagnostics.Hint },
      },
      gitsigns = {
        added = { enabled = true, icon = icons.git.Add },
        changed = { enabled = true, icon = icons.git.Mod_alt },
        deleted = { enabled = true, icon = icons.git.Remove },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = { left = "▎", right = "" },
      separator_at_end = true,
      modified = { button = "●" },
      pinned = { button = "", filename = true },
      preset = "default",
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = true },
      inactive = { button = "×" },
      visible = { modified = { buffer_number = false } },
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)
    -- code
    local map = vim.keymap
    local mopts = { noremap = true, silent = true }

    map.set("n", "<Leader>,", "<Cmd>BufferPrevious<CR>", mopts)
    map.set("n", "<Leader>.", "<Cmd>BufferNext<CR>", mopts)
    map.set("n", "<Leader><", "<Cmd>BufferMovePrevious<CR>", mopts)
    map.set("n", "<Leader>>", "<Cmd>BufferMoveNext<CR>", mopts)
    map.set("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>", mopts)
    map.set("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>", mopts)
    map.set("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>", mopts)
    map.set("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>", mopts)
    map.set("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>", mopts)
    map.set("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>", mopts)
    map.set("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>", mopts)
    map.set("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>", mopts)
    map.set("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>", mopts)
    map.set("n", "<Leader>0", "<Cmd>BufferLast<CR>", mopts)
    map.set("n", "<Leader>bp", "<Cmd>BufferPin<CR>", mopts)
    map.set("n", "<Leader>bc", "<Cmd>BufferClose<CR>", mopts)
    map.set("n", "<C-p>", "<Cmd>BufferPick<CR>", mopts)
    map.set("n", "<Leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", mopts)
    map.set("n", "<Leader>bd", "<Cmd>BufferOrderByDirectory<CR>", mopts)
    map.set("n", "<Leader>bl", "<Cmd>BufferOrderByLanguage<CR>", mopts)
    map.set("n", "<Leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", mopts)
  end,
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
