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
    desc = icons.ui.FolderOpen .. "view dir",
  },

  { "<c-p>", "<cmd>Telescope git_files<cr>",desc =  icons.ui.File .. " open file" },

  -- set prefix and immediate action names together here
    -- d = { name = icons.ui.Diagnostic .. " [d]iag" },
  { "<leader>g", name = icons.cmp.copilot_alt .. " [g]it" },
  { "<leader>l", name = icons.misc.LspAvailable .. " [l]sp" },
  { "<leader>s", name = icons.ui.Search .. " [s]earch" },

    -- actions
  { "<leader>q", "<cmd>bd<cr>", desc = icons.ui.Close_alt .. " close buffer" },
  { "<leader>w", "<cmd>wa<cr>", desc = icons.ui.Pencil .. " [w]rite all" },
}

-- register base keymaps
wk.add(base, normal_leaderless_opts)

-- keymaps for normal mode, after pressing leader key
local normal_leader_keys = {

  -- windows
  { "<leader>\\", "<cmd>vnew<cr>", desc = icons.cmp.tmux .. " right (new)" },
  { "<leader>|", "<cmd>vsplit<cr>", desc = icons.cmp.tmux .. " right" },
  { "<leader>-", "<cmd>new<cr>", desc = icons.cmp.tmux .. " below (new)" },
  {"<leader>_", "<cmd>split<cr>", desc = icons.cmp.tmux .. " below" },

  -- git
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = " [r]eset hunk" },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "[R]eset buffer" },
  { "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", desc = " [a]dd hunk" },
  {  "<leader>gA", "<cmd>Gitsigns stage_buffer<cr>", desc = " [A]dd buffer" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = " [u]ndo stage hunk" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = " [d]iff" },

  -- LSP
  { "<leader>lc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = " [c]alls in" },
  { "<leader>lC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = " [C]alls out" },
  { "<leader>le", "<cmd>Lspsaga rename<cr>", desc = "[e]dit" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "[i]nfo" },
  { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "[d]ef" },
  { "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "[h]over" },
  { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "[o]utline" },
  { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = " [r]efs" },
  { "<leader>lR", "<cmd>Lspsaga project_replace<cr>", desc = "[R]eplace" },
  { "<leader>lt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "[t]ype" },
}

wk.add(normal_leader_keys, normal_leader_opts)
