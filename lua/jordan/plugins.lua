return {

  -- align buffer indentation with project/folder
  { "tpope/vim-sleuth" },

  -- functional abstractions for nvim
  { "nvim-lua/plenary.nvim" },

  -- ui selection and input overrides
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- neovim config helper
  { "folke/neodev.nvim" },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon").setup()
      harpoon:setup({})

      vim.keymap.set("n", "<leader>m", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<leader>ht", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      vim.keymap.set("n", "<leader>sm", function()
        toggle_telescope(harpoon:list())
      end, { desc = "harpoon [m]arks" })
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-plenary",
      -- "nvim-neotest/neotest-dotnet",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-plenary"),
          -- require("neotest-dotnet"),
        },
      })
    end,
  },

  -- import plugins folders
  { import = "jordan.config" },
  { import = "jordan.after" },
}
