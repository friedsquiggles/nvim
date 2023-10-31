local icons = {
  ui = require("jordan.ui.icons").get("ui"),
  diagnostics = require("jordan.ui.icons").get("diagnostics"),
}

return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    fold_open = icons.ui.ArrowOpen, -- icon used for open folds
    fold_closed = icons.ui.ArrowClosed, -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list

    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    action_keys = {
      close = "q", -- close the list
      cancel = "<Esc>", -- cancel the preview and get back to your last window / buffer / cursor
      refresh = "r", -- manually refresh
      jump = { "<CR>", "<TAB>" }, -- jump to the diagnostic or open / close folds
      open_split = { "<C-x>" }, -- open buffer in new split
      open_vsplit = { "<C-v>" }, -- open buffer in new vsplit
      open_tab = { "<C-t>" }, -- open buffer in new tab
      jump_close = { "o" }, -- jump to the diagnostic and close the list
      toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
      toggle_preview = "P", -- toggle auto_preview
      hover = "K", -- opens a small popup with the full multiline message
      preview = "p", -- preview the diagnostic location
      close_folds = { "zM", "zm" }, -- close all folds
      open_folds = { "zR", "zr" }, -- open all folds
      toggle_fold = { "zA", "za" }, -- toggle fold of current file
      previous = "k", -- preview item
      next = "j", -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = true, -- automatically fold a file trouble list at creation
    auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
    signs = {
      error = icons.diagnostics.Error,
      warning = icons.diagnostics.Warning,
      hint = icons.diagnostics.Hint,
      information = icons.diagnostics.Information,
      other = icons.diagnostics.Question,
    },
    use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
  },

  config = function(_, opts)
    require("trouble").setup(opts)

    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").toggle()
    end, { desc = "open" })

    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, { desc = "workspace_diagnostics" })

    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, { desc = "document" })

    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, { desc = "quickfix" })

    vim.keymap.set("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, { desc = "loclist" })

    vim.keymap.set("n", "<leader>xr", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "references" })
  end,
}
