local function create_skip_filter(pattern)
  return {
    filter = { event = "msg_show", find = pattern },
    opts = { skip = true },
  }
end

local disabled_message_prefixes = {
  "^[/?].*", -- Search up/down
  "E486: Pattern not found:", -- Search not found
  "%d+ changes?;", -- Undo/redo
  "%d+ fewer lines", -- Delete multiple lines
  "%d+ more lines", -- Undo delete multiple lines
  "%d+ lines ", -- Other action on multiple lines
  "Already at newest change", -- Redone
  '"[^"]+" %d+L, %d+B', -- Save
  "written",
  "mini.surround"
}

local filter_message_routes = vim.tbl_map(create_skip_filter, disabled_message_prefixes)
local other_routes = {
  { view = "split", filter = { event = "msg_show", min_height = 20 } },
}

local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

function M.config()
  require("noice").setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },

      progress = { enabled = false },
      hover = { enabled = true },

      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        opts = {}, -- merged with defaults from documentation
      },
    },

    routes = vim.list_extend(filter_message_routes, other_routes),

    presets = {
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },

    views = {

      cmdline_popup = {
        position = {
          row = 20,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
      },

      hover = {
        view = "popup",
        relative = "cursor",
        enter = false,
        anchor = "auto",
        size = {
          width = "auto",
          height = "auto",
          max_height = 20,
          max_width = 120,
        },
        border = {
          style = "rounded",
          padding = { 0, 0 },
        },
        position = { row = 2, col = 0 },
        win_options = {
          wrap = true,
          linebreak = true,
        },
      },

      virtualtext = {
        backend = "virtualtext",
        format = { "{message}" },
        hl_group = "NoiceVirtualText",
      },

      popupmenu = {
        backend = "cmp",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  })
end

return M
