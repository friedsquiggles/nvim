local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
}

local map = vim.keymap.set

local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

M.config = function()
  local telescope = require("telescope")
  local act = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")
  local builtin = require("telescope.builtin")
  local menus = require("jordan.ui.telescope-menus")

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
        prompt_position = "top",
      },

      mappings = {
        i = {
          ["<ESC>"] = act.close,
          ["<TAB>"] = act.toggle_selection + act.move_selection_next,
          ["<C-k>"] = act.move_selection_previous,
          ["<C-j>"] = act.move_selection_next,
          ["<C-q>"] = act.send_selected_to_qflist + act.open_qflist,
          ["<C-u>"] = act.preview_scrolling_up,
          ["<C-d>"] = act.preview_scrolling_down,
          ["<C-t>"] = trouble.open_with_trouble,
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

  -- quick search
  map("n", "<leader><space>", menus.getActiveBuffers, { desc = "active buffers" })
  map("n", "<leader>/", menus.getRecentFiles, { desc = "recent files" })

  -- search
  map("n", "<leader>sf", menus.getFindFiles, { desc = "files" })
  map("n", "<leader>sc", menus.getGrepCurrentWord, { desc = "cursor word" })
  map("n", "<leader>sw", menus.getLiveGrep, { desc = "grep" })
  map("n", "<leader>sy", menus.getTreeSitter, { desc = "doc symbols" })
  map("n", "<leader>sr", menus.getLspRefs, { desc = "references" })
  map("n", "<leader>sg", menus.getGitStatus, { desc = "git status" })
  map("n", "<leader>sb", menus.getGitBranches, { desc = "git branches" })
  map("n", "<leader>sl", menus.getGitCommits, { desc = "git log" })
  map("n", "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
  map("n", "<leader>sh", builtin.highlights, { desc = "highlights" })
  map("n", "<leader>sk", builtin.keymaps, { desc = "keymaps" })
end

return M
