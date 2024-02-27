local M = {
  "stevearc/oil.nvim",
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("oil").setup()

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return M
