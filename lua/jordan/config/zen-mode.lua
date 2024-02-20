local M = {
  "folke/zen-mode.nvim",
}

local window_opts = {
  backdrop = 0.95,
  width = 120,
  height = 1,
  options = {
    signcolumn = "no",
    number = false,
    relativenumber = false,
    cursorline = false,
    cursorcolumn = false,
    foldcolumn = "0",
    list = false,
    colorcolumn = "",
    winhighlight = "Normal:Normal",
  },
}

local plugin_opts = {
  gitsigns = { enabled = true },
  tmux = { enabled = true },
  twilight = { enabled = true },
  wezterm = { enabled = true },
}

-- Set options
M.opts = {
  window = window_opts,
  plugins = plugin_opts,
}

return M
