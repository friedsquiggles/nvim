return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")
    local themes = require("telescope.themes")

    local icons = {
      ui = require("jordan.icons").get("ui", true),
      git = require("jordan.icons").get("git", true),
    }

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        color_devicons = true,
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        prompt_prefix = "   ",
        selection_caret = "  ",
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = trouble.open_with_trouble,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },
          n = {
            ["<c-t>"] = trouble.open_with_trouble,
          },
        },

        pickers = {
          oldfiles = {
            cwd_only = true,
          },
        },

        vimgrep_arguments = {
          "rg",
          "-L",
          -- "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },

        git_icons = {
          added = icons.git.Add,
          changed = icons.git.Mod,
          copied = ">",
          deleted = icons.git.Remove,
          renamed = icons.git.Rename,
          staged = icons.git.Staged,
          unstaged = icons.git.Unstaged,
          unmerged = icons.git.Unmerged,
          untracked = icons.git.Untracked,
        },

        layout_config = {
          width = 0.9,
          height = 0.6,
          preview_cutoff = 100,
          horizontal = {
            prompt_position = "top",
            results_width = 0.8,
            preview_width = 0.5,
          },
          vertical = {
            prompt_position = "top",
            width = 0.6,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    local builtin = require("telescope.builtin")
    local menus = require("jordan.telescope-menus")

    local getBufferFzyDropdown = function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({}))
    end

    local map = vim.keymap

    -- find buffers
    map.set("n", "<leader>sr", menus.getRecentFiles, { desc = "recent buffers" })
    map.set("n", "<leader>sb", builtin.buffers, { desc = "active buffers" })
    map.set("n", "<leader>sf", menus.getFindFiles, { desc = "find files" })

    -- find text
    map.set("n", "<leader><space>", getBufferFzyDropdown, { desc = "search current buffer" })
    map.set("n", "<leader>sc", menus.getGrepCurrentWord, { desc = "current word" })
    map.set("n", "<leader>st", menus.getLiveGrep, { desc = "text" })

    -- symbols
    map.set("n", "<leader>ld", menus.getTreeSitter, { desc = "show document symbols" })
    map.set("n", "<leader>lr", menus.getLspRefs, { desc = "show references" })
    map.set("n", "<leader>lw", menus.getLspWorkspaceSymbols, { desc = "show workspace symbols" })
    map.set("n", "<leader>lq", menus.getQuickFix, { desc = "show quick fix" })

    -- git files and commands
    map.set("n", "<leader>gf", builtin.git_files, { desc = "git files" })
    map.set("n", "<leader>gs", menus.getGitStatus, { desc = "git status" })
    map.set("n", "<leader>gb", menus.getGitBranches, { desc = "git branches" })
    map.set("n", "<leader>gl", menus.getGitCommits, { desc = "git log" })

    -- reference
    map.set("n", "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
    map.set("n", "<leader>sh", builtin.help_tags, { desc = "help" })
  end,
}
