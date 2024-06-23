local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
  doc = require("jordan.ui.icons").get("documents", true),
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
  -- local trouble = require("trouble.providers.telescope")
  local builtin = require("telescope.builtin")
  local menus = require("jordan.ui.telescope-menus")

  telescope.setup({
    defaults = {
      path_display = function(_, path)
        local cwd = vim.fn.getcwd()
        local p = path:gsub(cwd, "")
        local tail = require("telescope.utils").path_tail(path)
        local text = tail .. "  " .. p .. " "
        local hl = { { { #tail + 1, #text }, "TelescopeResultsComment" } }
        return text, hl
      end,
      color_devicons = true,
      layout_strategy = "horizontal",
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
          -- ["<C-t>"] = trouble.open_with_trouble,
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
        copied = icons.doc.Files,
        deleted = icons.git.Remove,
        renamed = icons.git.Rename,
        staged = icons.git.Staged,
        unstaged = icons.git.Unstaged,
        unmerged = icons.git.Unmerged,
        untracked = icons.git.Untracked,
      },
    },

    -- config opts
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })

  -- load extensions
  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "notify")
  pcall(telescope.load_extension, "noice")

  -- quick search
  map("n", "<leader><space>", menus.getRecent(true), { desc = "recent" })
  map("n", "<leader>so", menus.getRecent(true), { desc = " [o]ld" })
  map("n", "<leader>sO", menus.getRecent(false), { desc = " [o]ld" })
  -- map("n", "<leader>/", menus.getRecentFiles, { desc = "recent files" })

  -- search for files by name
  map("n", "<leader>sf", menus.getFiles(false), { desc = " [f]iles" })
  map("n", "<leader>sF", menus.getFiles(true), { desc = " [f]iles" })

  -- search word under cursor (and by file type groups)
  map("n", "<leader>scc", menus.getCursor("*.*"), { desc = " [c]ursor" })
  map("n", "<leader>scc", menus.getCursor({ "*.css", ".scss" }), { desc = " [c]ss" })
  map("n", "<leader>scj", menus.getCursor({ "*.json", "*.jsonc" }), { desc = " [j]son" })
  map("n", "<leader>sct", menus.getCursor({ "*.ts", "!*.spec.ts" }), { desc = " [t]ypescript" })
  map("n", "<leader>scu", menus.getCursor({ "*.spec.ts" }), { desc = " [u]nit tests" })

  -- search text (and by file type groups)
  map("n", "<leader>st", menus.getText("*.*"), { desc = " [t]ext" })
  map("n", "<leader>stc", menus.getText({ "*.css", ".scss" }), { desc = " [c]ss" })
  map("n", "<leader>stj", menus.getText({ "*.json", "*.jsonc" }), { desc = " [j]son" })
  map("n", "<leader>stt", menus.getText({ "*.ts", "!*.spec.ts" }), { desc = " [t]ypescript" })
  map("n", "<leader>stu", menus.getText({ "*.spec.ts" }), { desc = " [u]nit tests" })

  -- lsp
  map("n", "<leader>sy", menus.getTreeSitter, { desc = " s[y]mbols" })
  map("n", "<leader>sr", menus.getLspRefs, { desc = " [r]eferences" })
  map("n", "<leader>sd", builtin.diagnostics, { desc = " [d]iags" })

  -- git
  map("n", "<leader>gg", menus.getGitStatus, { desc = " [g]it status" })
  map("n", "<leader>gb", menus.getGitBranches, { desc = " git [b]ranches" })
  map("n", "<leader>gl", menus.getGitCommits, { desc = " git [l]og" })

  -- config
  map("n", "<leader>sh", builtin.highlights, { desc = " [h]ighlights" })
  map("n", "<leader>sk", builtin.keymaps, { desc = " [k]eymaps" })
end

return M
