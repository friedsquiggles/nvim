return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local which_key = require("which-key")

    local icons = {
      ui = require("jordan.ui.icons").get("ui", true),
      cmp = require("jordan.ui.icons").get("cmp", true),
      documents = require("jordan.ui.icons").get("documents", true),
      misc = require("jordan.ui.icons").get("misc", true),
      type = require("jordan.ui.icons").get("type", true),
    }

    which_key.setup({
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
        margin = { 2, 0, 2, 0 },
        padding = { 2, 2, 2, 2 },
      },

      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 40 },
        spacing = 2,
        align = "center",
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
    })

    local groups = {
      mode = { "n" },

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

    which_key.register(groups)

    which_key.register({

      ["x"] = { "<cmd>x<cr>", icons.ui.Pencil .. " write & quit" },
      ["q"] = { "<cmd>bw<cr>", icons.ui.Close .. " close" },
      ["Q"] = { "<cmd>qa!<cr>", icons.ui.Power .. " quit!" },

      b = {
        name = icons.documents.Files .. " buffer",
      },

      c = {
        name = icons.ui.Gear .. " config",
      },

      -- git
      g = {
        name = icons.cmp.copilot_alt .. " git",
        -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
        j = {
          "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
          "next hunk",
        },
        k = {
          "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
          "prev hunk",
        },
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

      s = {
        name = icons.ui.Search .. " search",
        n = { "<cmd>lua require('telescope').extensions.notify.notify({})<cr>", "notify" },
      },
      -- <cmd>Telescope notify<cr>
      t = {
        name = icons.ui.Toggle .. " toggle",
      },
    }, {
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps })
    })
  end,
}
