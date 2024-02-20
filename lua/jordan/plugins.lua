return {

  -- git from nvim command line
  { "tpope/vim-fugitive" },

  -- browse and open github links
  { "tpope/vim-rhubarb" },

  -- align buffer indentation with project/folder
  { "tpope/vim-sleuth" },

  -- motions for editing around text objects
  { "tpope/vim-surround" },

  -- function abstractions for nvim
  { "nvim-lua/plenary.nvim" },

  -- ui selection and input overrides
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- highlight word under cursor
  { "echasnovski/mini.cursorword", version = "*", opts = {} },

  -- clear visual distractions
  {
    "folke/zen-mode.nvim",
    opts = {
      wezterm = {
        enable = true,
      },
    },
  },

  -- dim out of scope code
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- neovim config helper
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- comment toggler and helper
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("mini.comment").setup({})
    end,
  },

  -- highlight trailing whitespace
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- import plugins from config folder
  { import = "jordan.config" },
  { import = "jordan.after" },
}
