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

-- base keymaps
local base = {
  ["-"] = {
    "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",
    icons.ui.FolderOpen .. "view dir",
  },

  ["<c-p>"] = { "<cmd>Telescope git_files<cr>", icons.ui.File .. " open file" },

  -- set prefix names together here
  ["<leader>"] = {
    a = { name = icons.ui.Wizard .. " [a]i" },
    d = { name = icons.ui.Diagnostic .. " [d]ebug" },
    g = { name = icons.cmp.copilot_alt .. " [g]it" },
    l = { name = icons.misc.LspAvailable .. " [l]sp" },
    n = { name = icons.ui.Comment .. " [n]otify" },
    s = { name = icons.ui.Search .. " [s]earch" },
    q = { "<cmd>bd<cr>", icons.ui.Close_alt .. " close buffer" },
    w = { "<cmd>wa<cr>", icons.ui.Pencil .. " [w]rite [a]ll" },
  },
}

-- register base keymaps
wk.register(base, normal_leaderless_opts)

-- keymaps for normal mode, after pressing leader key
local normal_leader_keys = {

  -- buffers
  ["."] = { "<cmd>bn<cr>", icons.ui.DoubleSeparatorRight .. " buffer" },
  [","] = { "<cmd>bp<cr>", icons.ui.DoubleSeparatorLeft .. " buffer" },

  -- windows
  ["\\"] = { "<cmd>vnew<cr>", icons.cmp.tmux .. " right (new)" },
  ["|"] = { "<cmd>vsplit<cr>", icons.cmp.tmux .. " right" },
  ["-"] = { "<cmd>new<cr>", icons.cmp.tmux .. " below (new)" },
  ["_"] = { "<cmd>split<cr>", icons.cmp.tmux .. " below" },

  -- ai
  a = {
    -- name = icons.ui.Wizard .. " ai",
    s = { "<cmd>Copilot status<cr>", " [s]tatus" },
    p = { "<cmd>Copilot panel<cr>", " [p]anel" },
    e = { "<cmd>Copilot enable<cr>", " [e]nable" },
    d = { "<cmd>Copilot disable<cr>", " [d]isable" },
  },

  -- git
  g = {
    -- name = icons.cmp.copilot_alt .. " git",
    l = { "<cmd>Gitsigns blame_line<cr>", " b[l]ame" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", " [p]review hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", " [r]eset hunk" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "[R]eset buffer" },
    a = { "<cmd>Gitsigns stage_hunk<cr>", " [a]dd hunk" },
    A = { "<cmd>Gitsigns stage_buffer<cr>", " [A]dd buffer" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", " [u]ndo stage hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", " [d]iff" },

    -- s = { "<cmd>Telescope git_status<cr>", " [s]tatus" },
    -- b = { "<cmd>Telescope git_branches<cr>", "[b]ranches" },
    -- c = { "<cmd>Telescope git_commits<cr>", " [c]ommits" },
    -- C = { "<cmd>Telescope git_bcommits<cr>", " [C]ommits (file)" },
  },

  -- LSP
  l = {
    -- name = icons.misc.LspAvailable .. " lsp",
    f = { "<cmd>Telescope lsp_references<cr>", " re[f]s" },
    i = { "<cmd>Telescope diagnostics<cr>", " d[i]ag" },
    I = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", " d[I]ag (ws)" },
    c = { "<cmd>Telescope lsp_incoming_calls<cr>", " [c]alls incoming" },
    C = { "<cmd>Telescope lsp_outgoing_calls<cr>", " [C]alls outgoing" },
    -- s = { "<cmd>Telescope lsp_document_symbols<cr>", " symbols (doc)" },
    -- S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", " symbols (ws)" },

    l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "toggle lsp [l]ines" },
    L = { "<cmd>LspInfo<cr>", "[L]sp info" },

    a = { "<cmd>Lspsaga code_action<cr>", " [a]ction" },
    D = { "<cmd>Lspsaga goto_definition<cr>", "[D]efinition" },
    -- g = { "<cmd>Lspsaga finder<cr>", "finder" },
    h = { "<cmd>Lspsaga hover_doc<cr>", "[h]over" },
    o = { "<cmd>Lspsaga outline<cr>", "[o]utline" },
    r = { "<cmd>Lspsaga rename<cr>", "[r]ename" },
    R = { "<cmd>Lspsaga project_replace<cr>", "[R]eplace" },
    T = { "<cmd>Lspsaga goto_type_definition<cr>", "[T]ype def" },
  },
}

wk.register(normal_leader_keys, normal_leader_opts)
