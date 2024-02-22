local icons = {
  ui = require("jordan.ui.icons").get("ui"),
  diagnostics = require("jordan.ui.icons").get("diagnostics"),
}

-- Module: trouble.nvim
local M = {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
}

-- Module options
M.opts = {
  position = "bottom",
  height = 30,
  width = 50,
  icons = true,
  fold_open = icons.ui.ArrowOpen,
  fold_closed = icons.ui.ArrowClosed,
  group = true,
  padding = true,

  mode = "workspace_diagnostics",
  action_keys = {
    close = "q",
    cancel = "<Esc>",
    refresh = "r",
    jump = { "<CR>", "<TAB>" },
    open_split = { "<C-x>" },
    open_vsplit = { "<C-v>" },
    open_tab = { "<C-t>" },
    jump_close = { "o" },
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = { "zM", "zm" },
    open_folds = { "zR", "zr" },
    toggle_fold = { "zA", "za" },
    previous = "k",
    next = "j",
  },
  indent_lines = true,
  auto_open = false,
  auto_close = true,
  auto_preview = true,
  auto_fold = true,
  auto_jump = { "lsp_definitions" },
  signs = {
    error = icons.diagnostics.Error,
    warning = icons.diagnostics.Warning,
    hint = icons.diagnostics.Hint,
    information = icons.diagnostics.Information,
    other = icons.diagnostics.Question,
  },
  use_diagnostic_signs = false,
}

-- Module configuration
M.config = function(_, opts)
  local map = vim.keymap.set
  require("trouble").setup(opts)

  -- Keybindings
  map("n", "<leader>xx", function()
    require("trouble").toggle()
  end, { desc = "open" })

  map("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end, { desc = "workspace" })

  map("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
  end, { desc = "document" })

  map("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
  end, { desc = "quickfix" })

  map("n", "<leader>xl", function()
    require("trouble").toggle("loclist")
  end, { desc = "loclist" })

  map("n", "<leader>xr", function()
    require("trouble").toggle("lsp_references")
  end, { desc = "references" })
end

return M
