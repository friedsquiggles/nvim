local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

-- Keybindings
M.keys = {
  {
    "s",
    mode = { "n", "x", "o" },
    function()
      require("flash").jump()
    end,
    desc = "flash",
  },
  {
    "S",
    mode = { "n", "x", "o" },
    function()
      require("flash").treesitter()
    end,
    desc = "flash (ts)",
  },
}

-- Flash.nvim settings
M.opts = {
  modes = {
    treesitter_search = {
      label = {
        rainbow = { enabled = true },
      },
    },
  },
  label = {
    uppercase = false,
  }
}

-- Setup function
function M.config(_, opts)
  require("flash").setup(opts)
end

return M
