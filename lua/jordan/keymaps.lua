local wk = require("which-key")

local i = {
  ui = require("jordan.ui.icons").get("ui", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  documents = require("jordan.ui.icons").get("documents", true),
  misc = require("jordan.ui.icons").get("misc", true),
  type = require("jordan.ui.icons").get("type", true),
}

-- wezterm pane navigation
local util = require("jordan.util")
util.wezterm()

-- keymap options for normal mode, with leader
local normal_leader_opts = {
  mode = "n",
  -- prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps })
}

-- keymap options for normal mode, without leader
local normal_leaderless_opts = {
  mode = "n",
}

-- base keymaps
local base = {
  {
    "-",
    "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",
    desc = "view dir",
    icon = i.ui.FolderOpen,
  },

  { "<c-p>", "<cmd>Telescope git_files<cr>", icon =  i.ui.File, desc = "open file" },

  -- set prefix and immediate action names together here
    -- d = { name = icons.ui.Diagnostic .. " [d]iag" },
  { "<leader>g", icon = i.cmp.copilot_alt, name = "[g]it" },
  { "<leader>l", icon = i.misc.LspAvailable, name = "[l]sp" },
  { "<leader>s", icon = i.ui.Search, name = "[s]earch" },

    -- actions
  { "<leader>q", "<cmd>bd<cr>", icon = i.ui.Close_alt, desc = "close buffer" },
  { "<leader>w", "<cmd>wa<cr>", icon = i.ui.Pencil, desc = "[w]rite all" },
}

-- register base keymaps
wk.add(base, normal_leaderless_opts)

-- keymaps for normal mode, after pressing leader key
local normal_leader_keys = {

  -- windows
  { "<leader>\\", "<cmd>vnew<cr>", icon = i.cmp.tmux, desc = "right (new)" },
  { "<leader>|", "<cmd>vsplit<cr>", icon = i.cmp.tmux, desc = "right" },
  { "<leader>-", "<cmd>new<cr>", icon = i.cmp.tmux, desc = "below (new)" },
  {"<leader>_", "<cmd>split<cr>", icon = i.cmp.tmux, desc = "below" },

  -- git
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "[r]eset hunk" },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "[R]eset buffer" },
  { "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", desc = "[a]dd hunk" },
  {  "<leader>gA", "<cmd>Gitsigns stage_buffer<cr>", desc = "[A]dd buffer" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "[u]ndo stage hunk" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "[d]iff" },

  -- LSP
  { "<leader>lc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "[c]alls in" },
  { "<leader>lC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "[C]alls out" },
  { "<leader>le", "<cmd>Lspsaga rename<cr>", desc = "[e]dit" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "[i]nfo" },
  { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "[d]ef" },
  { "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "[h]over" },
  { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "[o]utline" },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "[r]efs" },
  { "<leader>lR", "<cmd>Lspsaga project_replace<cr>", desc = "[R]eplace" },
  { "<leader>lt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "[t]ype" },
}

wk.add(normal_leader_keys, normal_leader_opts)
