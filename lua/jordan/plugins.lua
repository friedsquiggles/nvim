return {
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-sleuth" },
  { "nvim-lua/plenary.nvim" },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "echasnovski/mini.cursorword", version = "*", opts = {} },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
    config = function()
      require("fidget").setup({})
    end,
  },

  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    config = false,
    dependencies = { "nvim-lspconfig" },
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("mini.comment").setup({})
    end,
  },

  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- import plugins from config folder
  { import = "jordan.config" },
}
