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
            ["<C-u>"] = false,
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
            width = 0.5,
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

    -- local getRecentFiles = function()
    --   builtin.oldfiles(themes.get_dropdown({
    --     previewer = false,
    --   }))
    -- end

    local getBufferFzyDropdown = function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({}))
    end

    local map = vim.keymap

    -- find buffers
    map.set("n", "<leader>sr", builtin.oldfiles, { desc = "recent buffers" })
    map.set("n", "<leader>sb", builtin.buffers, { desc = "active buffers" })
    map.set("n", "<leader>sf", builtin.find_files, { desc = "find files" })

    -- find text
    map.set("n", "<leader><space>", getBufferFzyDropdown, { desc = "search current buffer" })
    map.set("n", "<leader>sw", builtin.grep_string, { desc = "current word" })
    map.set("n", "<leader>st", builtin.live_grep, { desc = "text" })

    -- git files and commands
    map.set("n", "<leader>gf", builtin.git_files, { desc = "git files" })
    map.set("n", "<leader>gs", builtin.git_status, { desc = "git status" })
    map.set("n", "<leader>gb", builtin.git_branches, { desc = "git branches" })
    map.set("n", "<leader>gl", builtin.git_commits, { desc = "git log" })

    -- reference
    map.set("n", "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
    map.set("n", "<leader>sh", builtin.help_tags, { desc = "help" })
  end,
}
