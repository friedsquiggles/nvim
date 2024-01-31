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

    local icons = {
      ui = require("jordan.ui.icons").get("ui", true),
      git = require("jordan.ui.icons").get("git", true),
      cmp = require("jordan.ui.icons").get("cmp", true),
      kind = require("jordan.ui.icons").get("kind", true),
    }

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        color_devicons = true,
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        prompt_prefix = "   ",
        selection_caret = "  ",
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        layout_config = {
          vertical = {
            prompt_position = "top",
          },
        },

        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-t>"] = trouble.open_with_trouble,
          },
          n = {
            ["<c-t>"] = trouble.open_with_trouble,
          },
        },

        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
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
    local utils = require("telescope.utils")
    local menus = require("jordan.ui.telescope-menus")

    local map = vim.keymap

    -- main
    map.set("n", "<leader><space>", menus.getActiveBuffers, { desc = "active buffers" })
    map.set("n", "<leader>/", menus.getRecentFiles, { desc = "recent files" })

    -- search
    map.set("n", "<leader>sf", menus.getFindFiles, { desc = "files" })
    map.set("n", "<leader>sc", menus.getGrepCurrentWord, { desc = "cursor word" })
    map.set("n", "<leader>sg", menus.getLiveGrep, { desc = "grep" })

    -- symbols
    map.set("n", "<leader>ld", menus.getTreeSitter, { desc = "doc symbols" })
    map.set("n", "<leader>lr", menus.getLspRefs, { desc = "references" })
    -- map.set("n", "<leader>lq", menus.getQuickFix, { desc = "quick fix" })

    -- git files and commands
    map.set("n", "<leader>gs", menus.getGitStatus, { desc = "git status" })
    map.set("n", "<leader>gb", menus.getGitBranches, { desc = "git branches" })
    map.set("n", "<leader>gl", menus.getGitCommits, { desc = "git log" })

    -- reference
    map.set("n", "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
    map.set("n", "<leader>sh", builtin.highlights, { desc = "highlights" })
    map.set("n", "<leader>sk", builtin.keymaps, { desc = "keymaps" })
  end,
}
