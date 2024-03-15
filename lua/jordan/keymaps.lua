local wk = require("which-key")

local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  documents = require("jordan.ui.icons").get("documents", true),
  misc = require("jordan.ui.icons").get("misc", true),
  type = require("jordan.ui.icons").get("type", true),
}

-- keymap options for normal mode, with leader
local normal_leader_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps })
}

-- keymap options for normal mode, without leader
local normal_leaderless_opts = {
  mode = "n",
}

-- keymap options for insert mode
local insert_opts = {
  "i",
}

-- keymap options for visual mode
local visual_opts = {
  "v",
}

-- keys to be ignored in normal mode
local wki = "which_key_ignore"
local ignore = {
  ["<leader>1"] = wki,
  ["<leader>2"] = wki,
  ["<leader>3"] = wki,
  ["<leader>4"] = wki,
  ["<leader>5"] = wki,
  ["<leader>6"] = wki,
  ["<leader>7"] = wki,
  ["<leader>8"] = wki,
  ["<leader>9"] = wki,
  ["<leader>0"] = wki,
}

-- Ignore keys in normal mode
wk.register(ignore, normal_leaderless_opts)

-- keymaps for normal mode, after pressing leader key
local normal_leader_keys = {

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
      "<cmd>lua require 'gitsigns'.diffthis()<cr>",
      "git diff",
    },
    D = {
      "<cmd>lua require 'gitsigns'.diffthis('~')<cr>",
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

    -- create or edit notes
    c = { "<cmd>ObsidianNew<cr>", "create" },
    o = { "<cmd>ObsidianOpen<cr>", "open" },
    r = { "<cmd>ObsidianRename<cr>", "rename" },

    -- daily notes
    d = { "<cmd>ObsidianToday<cr>", "to[d]ay" },
    m = { "<cmd>ObsidianTomorrow<cr>", "to[m]orrow" },
    y = { "<cmd>ObsidianYesterday<cr>", "[y]esterday" },

    -- navigate notes
    s = { "<cmd>ObsidianSearch<cr>", "search" },
    f = { "<cmd>ObsidianFollowLink<cr>", "follow url" },
    p = { "<cmd>ObsidianQuickSwitch<cr>", "switch" },

    -- list note details
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
}

wk.register(normal_leader_keys, normal_leader_opts)
