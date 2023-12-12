return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  dependencies = {
    "nvim-treesitter/playground",
    "HiPhish/rainbow-delimiters.nvim",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },

  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "css",
      "git_rebase",
      "gitattributes",
      "gitignore",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "regex",
      "tsx",
      "typescript",
      "query",
      "vim",
      "vimdoc",
      "yaml",
    },

    ignore_install = {
      "go",
      "julia",
      "java",
      "javac",
    },

    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["uc"] = "@comment.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]["] = "@function.outer",
          ["]m"] = "@class.outer",
        },
        goto_next_end = {
          ["]]"] = "@function.outer",
          ["]M"] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["[m"] = "@class.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
          ["[M"] = "@class.outer",
        },
      },
    },

    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gd",
          list_definitions = "gl",
          list_definitions_toc = "gL",
          goto_next_usage = "gn",
          goto_previous_usage = "gp",
        },
      },
      smart_rename = {
        enable = true,
        keymaps = { smart_rename = "gR" },
      },
    },

    autotag = {
      enable = true,
    },
  },

  config = function(_, opts)
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterViolet",
        "RainbowDelimiterBlue",
        "RainbowDelimiterCyan",
        "RainbowDelimiterYellow",
        "RainbowDelimiterOrange",
        "RainbowDelimiterRed",
      },
      blacklist = { "c", "cpp" },
    }

    if type(opts.ensure_installed) == "table" then
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end

    require("nvim-treesitter.configs").setup(opts)
  end,
}
