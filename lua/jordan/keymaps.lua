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

local base = {
  ["-"] = { "<cmd>lua MiniFiles.open()<cr>", "view dir" },
}

wk.register(base, normal_leader_opts)

-- keymaps for normal mode, after pressing leader key
local normal_leader_keys = {

  -- buffers
  ["."] = { "<cmd>bn<cr>", icons.ui.Power .. " next buffer" },
  [","] = { "<cmd>bp<cr>", icons.ui.Power .. " prev buffer" },

  -- windows
  ["\\"] = { "<cmd>vpnew<cr>", "split vertical (new)" },
  ["|"] = { "<cmd>vplit<cr>", "split vertical" },
  ["-"] = { "<cmd>new<cr>", "split horizontal (new)" },
  ["_"] = { "<cmd>split<cr>", "split horizontal" },

  -- ai
  a = {
    name = icons.ui.Wizard .. " ai",
    s = { "<cmd>Copilot status<cr>", "status" },
    p = { "<cmd>Copilot panel<cr>", "panel" },
    e = { "<cmd>Copilot enable<cr>", "enable" },
    x = { "<cmd>Copilot disable<cr>", "disable" },
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
    D = { "<cmd>Lspsaga goto_definition<cr>", "goto def" },
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
    T = { "<cmd>Lspsaga goto_type_definition<cr>", "goto type def" },
  },

  n = {
    name = " notifications",
    n = { "<cmd>lua MiniNotify.show_history()<cr>", "history" },
    a = { "<cmd>lua MiniNotify.get_all()<cr>", "history" },
  },

  -- search
  s = {
    name = icons.ui.Search .. " search",
    -- n = { "<cmd>lua require('telescope').extensions.notify.notify({})<cr>", "notify" },
  },

  x = { "<cmd>bd<cr>", "close buffer" },
}

wk.register(normal_leader_keys, normal_leader_opts)
