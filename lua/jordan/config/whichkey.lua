local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  documents = require("jordan.ui.icons").get("documents", true),
  misc = require("jordan.ui.icons").get("misc", true),
  type = require("jordan.ui.icons").get("type", true),
}

local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts = {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = false,
    },

    presets = {
      operators = false,
      motions = false,
      text_objects = true,
      windows = false,
      nav = false,
      z = true,
      g = true,
    },
  },

  window = {
    border = "double",
    position = "bottom",
    margin = { 4, 4, 4, 4 },
    padding = { 4, 4, 4, 4 },
  },

  layout = {
    height = { min = 10, max = 25 },
    width = { min = 20, max = 40 },
    spacing = 6,
    align = "left",
  },

  triggers_nowait = {
    "`",
    "'",
    "g`",
    "g'",
    '"',
    "<c-r>",
    "z=",
  },

  hidden = { "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },

  icons = {
    group = "",
  },

  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
}

M.config = function(_, opts)
  local wk = require("which-key")
  wk.setup(opts)

  local groups = {
    mode = { "n" },

    -- previous
    ["["] = {
      name = " previous",
      g = {
        "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
        "prev hunk",
      },
    },

    -- next
    ["]"] = {
      name = " next",
      g = {
        "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
        "next hunk",
      },
    },

    --ignore
    ["<leader>1"] = "which_key_ignore",
    ["<leader>2"] = "which_key_ignore",
    ["<leader>3"] = "which_key_ignore",
    ["<leader>4"] = "which_key_ignore",
    ["<leader>5"] = "which_key_ignore",
    ["<leader>6"] = "which_key_ignore",
    ["<leader>7"] = "which_key_ignore",
    ["<leader>8"] = "which_key_ignore",
    ["<leader>9"] = "which_key_ignore",
    ["<leader>0"] = "which_key_ignore",
  }

  wk.register(groups)

  wk.register({

    -- exit and close
    ["q"] = { "<cmd>bw<cr>", icons.ui.Close .. " close" },
    ["Q"] = { "<cmd>qa!<cr>", icons.ui.Power .. " quit!" },

    -- buffers
    ["."] = { "<cmd>bn<cr>", icons.ui.Power .. " next buffer" },
    [","] = { "<cmd>bp<cr>", icons.ui.Power .. " prev buffer" },

    -- ai
    a = {
      name = icons.ui.Wizard .. " ai",
      s = { "<cmd>Copilot status<cr>", "status" },
      p = { "<cmd>Copilot panel<cr>", "panel" },
      e = { "<cmd>Copilot enable<cr>", "enable" },
      x = { "<cmd>Copilot disable<cr>", "disable" },
    },

    -- buffer
    b = {
      name = icons.documents.Files .. " buffer",
      c = { "<cmd>bd<cr>", "close buffer" },
    },

    -- config
    c = {
      name = icons.ui.Gear .. " config",
    },

    -- git
    g = {
      name = icons.cmp.copilot_alt .. " git",
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "preview hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "reset hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "reset buffer" },
      a = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "stage hunk" },
      A = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "stage buffer" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "undo stage hunk",
      },
      s = { "<cmd>Telescope git_status<cr>", "status" },
      b = { "<cmd>Telescope git_branches<cr>", "branches" },
      c = { "<cmd>Telescope git_commits<cr>", "commits" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "checkout commit(file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "git diff",
      },
    },

    -- LSP
    l = {
      name = icons.misc.LspAvailable .. " lsp",
      a = { "<cmd>Lspsaga code_action<cr>", "code action" },
      d = { "<cmd>Lspsaga peek_definition<cr>", "peek def" },
      D = { "<cmd>Lspsaga goto_definition<cr>", "goto def" },
      -- f = { "<cmd>LspZeroFormat<cr>", "Format" },
      g = { "<cmd>Lspsaga finder<cr>", "finder" },
      G = { "<cmd>Telescope lsp_references<cr>", "refs" },
      h = { "<cmd>Lspsaga hover_doc<cr>", "hover" },
      i = { "<cmd>Telescope diagnostics<cr>", "diag" },
      I = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "diag (ws)" },
      j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "next diag" },
      k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "prev diag" },
      l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "toggle lsp lines" },
      L = { "<cmd>LspInfo<cr>", "lsp info" },
      o = { "<cmd>Lspsaga outline<cr>", "outline" },
      p = { "<cmd>Telescope lsp_incoming_calls<cr>", "incoming calls" },
      P = { "<cmd>Telescope lsp_outgoing_calls<cr>", "outgoing calls" },
      r = { "<cmd>Lspsaga rename<cr>", "rename" },
      R = { "<cmd>Lspsaga project_replace<cr>", "replace" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols (doc)" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "symbols (ws)" },
      t = { "<cmd>Lspsaga peek_type_definition<cr>", "peek type def" },
      T = { "<cmd>Lspsaga goto_type_definition<cr>", "goto type def" },
    },

    -- notes
    n = {
      name = icons.ui.Notes .. " notes",
      n = { "<cmd>ObsidianNew<cr>", "new note" },
      o = { "<cmd>ObsidianOpen<cr>", "open note" },
      r = { "<cmd>ObsidianRename<cr>", "rename note" },
      d = { "<cmd>ObsidianToday<cr>", "daily note" },
      t = { "<cmd>ObsidianTomorrow<cr>", "tomorrow's note" },
      y = { "<cmd>ObsidianYesterday<cr>", "yesterday's note" },
      s = { "<cmd>ObsidianSearch<cr>", "search notes" },
      f = { "<cmd>ObsidianFollowLink<cr>", "follow url" },
      p = { "<cmd>ObsidianQuickSwitch<cr>", "switch" },
      l = {
        name = "list...",
        b = { "<cmd>ObsidianBacklinks<cr>", "backlinks" },
        t = { "<cmd>ObsidianTags<cr>", "tags" },
      },
    },

    -- search
    s = {
      name = icons.ui.Search .. " search",
      n = { "<cmd>lua require('telescope').extensions.notify.notify({})<cr>", "notify" },
    },

    -- toggle
    t = {
      name = icons.ui.Toggle .. " toggle",
      z = {
        "<cmd>ZenMode<cr>",
        "zen mode",
      },
    },

    -- window
    w = {
      name = icons.ui.Window .. " window",

      -- move cursor to window
      j = { "<C-w><C-j>", "move cursor down" },
      k = { "<C-w><C-k>", "move cursor up" },
      h = { "<C-w><C-h>", "move cursor left" },
      l = { "<C-w><C-l>", "move cursor right" },

      -- move window
      J = { "<C-w>j", "move window down" },
      K = { "<C-w>k", "move up" },
      H = { "<C-w>h", "move left" },
      L = { "<C-w>l", "move right" },

      -- vertical split
      v = { "<cmd>vsplit<cr>", "split vertical" },
      V = { "<cmd>vnew<cr>", "split new vertical" },

      -- horizontal split
      b = { "<cmd>split<cr>", "split horizontal" },
      B = { "<cmd>new<cr>", "split new horizontal" },
    },

    x = {
      name = icons.ui.Diagnostic .. "diag/fix",
    },
  }, {
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps })
  })
end

return M
