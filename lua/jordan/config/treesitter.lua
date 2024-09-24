return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
    auto_install = true,
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true, },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[A"] = "@parameter.inner" },
        },
      },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup(opts)
  end,
}
