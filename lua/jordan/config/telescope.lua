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
  local t = require("telescope")
  local a = require("telescope.actions")
  local b = require("telescope.builtin")
  local m = require("jordan.ui.telescope-menus")

  t.setup({
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
          ["<ESC>"] = a.close,
          ["<TAB>"] = a.toggle_selection + a.move_selection_next,
          ["<C-k>"] = a.move_selection_previous,
          ["<C-j>"] = a.move_selection_next,
          ["<C-q>"] = a.send_selected_to_qflist + a.open_qflist,
          ["<C-u>"] = a.preview_scrolling_up,
          ["<C-d>"] = a.preview_scrolling_down,
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
  pcall(t.load_extension, "fzf")
  pcall(t.load_extension, "notify")
  pcall(t.load_extension, "noice")

  -- quick search
  map("n", "<leader><space>", m.recent(true), { desc = "recent" })
  map("n", "<leader>so", m.recent(true), { desc = "[o]ld" })
  map("n", "<leader>sO", m.recent(false), { desc = "[o]ld" })
  -- map("n", "<leader>/", menus.getRecentFiles, { desc = "recent files" })

  -- search for files by name
  map("n", "<leader>sf", m.files(false), { desc = "[f]iles" })
  map("n", "<leader>sF", m.files(true), { desc = "[f]iles" })

  -- search word under cursor (and by file type groups)
  map("n", "<leader>scc", m.cursor("*.*"), { desc = "[c]ursor" })
  map("n", "<leader>scc", m.cursor({ "*.css", ".scss" }), { desc = "[c]ss" })
  map("n", "<leader>sch", m.cursor({ "*.html" }), { desc = "[h]tml" })
  map("n", "<leader>scj", m.cursor({ "*.json", "*.jsonc" }), { desc = "[j]son" })
  map("n", "<leader>sct", m.cursor({ "*.ts", "!*.spec.ts" }), { desc = "[t]ypescript" })
  map("n", "<leader>scu", m.cursor({ "*.spec.ts" }), { desc = "[u]nit tests" })

  -- search text (and by file type groups)
  map("n", "<leader>st", m.text("*.*"), { desc = "[t]ext" })
  map("n", "<leader>ssc", m.text({ "*.css", ".scss" }), { desc = "[c]ss" })
  map("n", "<leader>ssh", m.text({ "*.html" }), { desc = "[h]tml" })
  map("n", "<leader>ssj", m.text({ "*.json", "*.jsonc" }), { desc = "[j]son" })
  map("n", "<leader>sst", m.text({ "*.ts", "!*.spec.ts" }), { desc = "[t]ypescript" })
  map("n", "<leader>ssu", m.text({ "*.spec.ts" }), { desc = "[u]nit tests" })

  -- lsp
  map("n", "<leader>sy", m.treesitter, { desc = "s[y]mbols" })
  map("n", "<leader>sr", m.refs, { desc = "[r]eferences" })
  map("n", "<leader>sd", b.diagnostics, { desc = "[d]iags" })

  -- git
  map("n", "<leader>gg", m.status, { desc = "[g]it status" })
  map("n", "<leader>gb", m.branches, { desc = "git [b]ranches" })
  map("n", "<leader>gl", m.commits, { desc = "git [l]og" })

  -- config
  map("n", "<leader>sh", b.highlights, { desc = "[h]ighlights" })
  map("n", "<leader>sk", b.keymaps, { desc = "[k]eymaps" })
  map("n", "<leader>sn", t.extensions.notify.notify, { desc = "[n]otifications" })
end

return M
