return {

  -- align buffer indentation with project/folder
  { "tpope/vim-sleuth" },

  -- functional abstractions for nvim
  { "nvim-lua/plenary.nvim" },

  -- ui selection and input overrides
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  { "tpope/vim-rails" },

  { "LunarVim/bigfile.nvim" },

  -- import plugins folders
  { import = "jordan.config" },
  { import = "jordan.after" },
}
