return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local pkey = "t"

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-t>"] = trouble.open_with_trouble,
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
          "--color=never",
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
          preview_cutoff = 120,
          horizontal = {
            prompt_position = "top",
            results_width = 0.8,
          },
          vertical = { width = 0.5 },
        },
        color_devicons = true,
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        prompt_prefix = "    ",
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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

    local getBufferFzyDropdown = function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))
    end

    local map = vim.keymap

    map.set("n", "<leader>sr", builtin.oldfiles, { desc = "list recent files" })

    map.set("n", "<leader>sb", builtin.buffers, { desc = "list open buffers" })

    map.set("n", "<leader><space>", getBufferFzyDropdown, { desc = "search current buffer" })

    -- git
    map.set("n", "<leader>gf", builtin.git_files, { desc = "git files" })
    map.set("n", "<leader>gcs", builtin.git_status, { desc = "git status" })
    map.set("n", "<leader>gcb", builtin.git_branches, { desc = "git branches" })
    map.set("n", "<leader>gcl", builtin.git_commits, { desc = "git log" })

    map.set("n", "<leader>sf", builtin.find_files, { desc = "files" })

    map.set("n", "<leader>sh", builtin.help_tags, { desc = "help" })

    map.set("n", "<leader>sw", builtin.grep_string, { desc = "current word" })

    map.set("n", "<leader>sg", builtin.live_grep, { desc = "grep" })

    map.set("n", "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
  end,
}
