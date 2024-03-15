return {
  "epwalsh/obsidian.nvim",
  version = "*",
  -- ft = "markdown", -- prevents loading on non-markdown files but also dashboard

  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "preservim/vim-markdown",
  },

  opts = {
    mappings = {

      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

      ["<C-x>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    workspaces = {
      {
        name = "personal",
        path = "~/dev/notes/personal",
      },
    },

    notes_subdir = "notes",
    new_notes_location = "notes_subdir",
    sort_by = "path",
    sort_reversed = true,

    daily_notes = {
      folder = "notes/daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },

    preferred_link_style = "wiki",

    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    ui = {
      enable = true,
      update_debounce = 200,
    },

    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
  },

  config = function(_, opts)
    vim.wo.conceallevel = 2
    require("obsidian").setup(opts)
  end,
}
