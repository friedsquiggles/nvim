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
          width = 0.8,
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

    vim.keymap.set(
      "n",
      "<leader>sr",
      require("telescope.builtin").oldfiles,
      { desc = "recent files" }
    )

    vim.keymap.set(
      "n",
      "<leader>sb",
      require("telescope.builtin").buffers,
      { desc = "existing buffers" }
    )

    vim.keymap.set("n", "<leader><space>", function()
      require("telescope.builtin").current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({})
      )
    end, { desc = "current buffer" })

    vim.keymap.set(
      "n",
      "<leader>gf",
      require("telescope.builtin").git_files,
      { desc = "git files" }
    )

    vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "files" })

    vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "help" })

    vim.keymap.set(
      "n",
      "<leader>sw",
      require("telescope.builtin").grep_string,
      { desc = "current word" }
    )

    vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "grep" })

    vim.keymap.set(
      "n",
      "<leader>sd",
      require("telescope.builtin").diagnostics,
      { desc = "diagnostics" }
    )
  end,
}
