local icons = {
  diagnostics = require("jordan.icons").get("diagnostics", true),
  git = require("jordan.icons").get("git", true),
  ui = require("jordan.icons").get("ui", true),
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
      tabpages = true,
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.diagnostics.Error },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = icons.diagnostics.Warning },
        [vim.diagnostic.severity.INFO] = { enabled = true, icon = icons.diagnostics.Information },
        [vim.diagnostic.severity.HINT] = { enabled = true, icon = icons.diagnostics.Hint },
      },
      gitsigns = {
        added = { enabled = true, icon = icons.git.Add },
        changed = { enabled = true, icon = icons.git.Mod },
        deleted = { enabled = true, icon = icons.git.Remove },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = { left = "▎" },
      separator_at_end = true,
      modified = { button = icons.ui.Circle },
      pinned = { button = icons.ui.Pin, filename = true },
      preset = "default",
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = true },
      inactive = { button = icons.ui.Close },
      visible = { modified = { buffer_number = false } },
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)
    local map = vim.keymap

    -- general navigation
    map.set(
      "n",
      "<Leader>,",
      "<Cmd>BufferPrevious<CR>",
      { desc = "previous buffer", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>.",
      "<Cmd>BufferNext<CR>",
      { desc = "next buffer", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader><",
      "<Cmd>BufferMovePrevious<CR>",
      { desc = "move buffer left", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>>",
      "<Cmd>BufferMoveNext<CR>",
      { desc = "move buffer right", noremap = true, silent = true }
    )

    -- go to buffer
    map.set("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>", { desc = "", noremap = true, silent = true })
    map.set("n", "<Leader>0", "<Cmd>BufferLast<CR>", { desc = "", noremap = true, silent = true })

    -- selections
    map.set(
      "n",
      "<Leader>bp",
      "<Cmd>BufferPin<CR>",
      { desc = "pin buffer", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>bc",
      "<Cmd>BufferClose<CR>",
      { desc = "close buffer", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>bC",
      "<Cmd>BufferCloseAllButCurrent<CR>",
      { desc = "close other buffers", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<C-p>",
      "<Cmd>BufferPick<CR>",
      { desc = "pick buffer", noremap = true, silent = true }
    )

    -- set buffer sorting
    map.set(
      "n",
      "<Leader>bb",
      "<Cmd>BufferOrderByBufferNumber<CR>",
      { desc = "", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>bd",
      "<Cmd>BufferOrderByDirectory<CR>",
      { desc = "", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>bl",
      "<Cmd>BufferOrderByLanguage<CR>",
      { desc = "", noremap = true, silent = true }
    )
    map.set(
      "n",
      "<Leader>bw",
      "<Cmd>BufferOrderByWindowNumber<CR>",
      { desc = "", noremap = true, silent = true }
    )
  end,
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
