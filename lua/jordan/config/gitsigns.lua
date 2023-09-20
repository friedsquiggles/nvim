local icons = {
  git = require("jordan.icons").get("git", true),
}

-- return {
--   -- Adds git related signs to the gutter, as well as utilities for managing changes
--   "lewis6991/gitsigns.nvim",
--   event = "BufEnter",
--   opts = {
--     signcolumn = true,
--     linehl = true,
--     current_line_blame = true,
--     current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
--
--     signs = {
--       add = { text = icons.git.Add },
--       change = { text = icons.git.Mod },
--       delete = { text = icons.git.Remove },
--       topdelete = { text = "" },
--       changedelete = { text = "󰐼" },
--     },
--     on_attach = function(bufnr)
--       local gs = package.loaded.gitsigns
--
--       local function map(mode, l, r, opts)
--         opts = opts or {}
--         opts.buffer = bufnr
--         vim.keymap.set(mode, l, r, opts)
--       end
--
--       -- Navigation
--       map("n", "]c", function()
--         if vim.wo.diff then
--           return "]c"
--         end
--         vim.schedule(function()
--           gs.next_hunk()
--         end)
--         return "<Ignore>"
--       end, { expr = true })
--       map("n", "[c", function()
--         if vim.wo.diff then
--           return "[c"
--         end
--         vim.schedule(function()
--           gs.prev_hunk()
--         end)
--         return "<Ignore>"
--       end, { expr = true })
--       map("n", "<leader>hs", gs.stage_hunk)
--       map("n", "<leader>hr", gs.reset_hunk)
--       map("v", "<leader>hs", function()
--         gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
--       end)
--       map("v", "<leader>hr", function()
--         gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
--       end)
--       map("n", "<leader>hS", gs.stage_buffer)
--       map("n", "<leader>hu", gs.undo_stage_hunk)
--       map("n", "<leader>hR", gs.reset_buffer)
--       map("n", "<leader>hp", gs.preview_hunk)
--       map("n", "<leader>hb", function()
--         gs.blame_line({ full = true })
--       end)
--       map("n", "<leader>tb", gs.toggle_current_line_blame)
--       map("n", "<leader>hd", gs.diffthis)
--       map("n", "<leader>hD", function()
--         gs.diffthis("~")
--       end)
--       map("n", "<leader>td", gs.toggle_deleted)
--
--       -- navigation
--       vim.keymap.set(
--         "n",
--         "<leader>gp",
--         require("gitsigns").prev_hunk,
--         { buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
--       )
--       vim.keymap.set(
--         "n",
--         "<leader>gn",
--         require("gitsigns").next_hunk,
--         { buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
--       )
--       vim.keymap.set(
--         "n",
--         "<leader>ph",
--         require("gitsigns").preview_hunk,
--         { buffer = bufnr, desc = "[P]review [H]unk" }
--       )
--     end,
--   },
--   config = function (_, opts)
--     require("gitsigns").setup(opts)
--   end
-- }

return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = {
          hl = "GitGutterAdd",
          text = icons.git.Add,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitGutterChange",
          text = icons.git.Mod,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitGutterDelete",
          text = icons.git.Remove,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitGutterDelete",
          text = icons.git.Remove,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitGutterChangeDelete",
          text = icons.git.Remove,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        untracked = {
          hl = "GitGutterUntracked",
          text = icons.git.Untracked,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      -- sign_priority = 6,
      update_debounce = 400,
      numhl = false,
      word_diff = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })
        map("n", "<leader>gs", gs.stage_hunk)
        map("n", "<leader>gr", gs.reset_hunk)
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<leader>gS", gs.stage_buffer)
        map("n", "<leader>gu", gs.undo_stage_hunk)
        map("n", "<leader>gR", gs.reset_buffer)
        map("n", "<leader>gp", gs.preview_hunk)
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end)
        map("n", "<leader>td", gs.toggle_deleted)
      end,

      watch_gitdir = { interval = 1000, follow_files = true },
      status_formatter = nil, -- Use default
      debug_mode = false,
      current_line_blame = true,
      current_line_blame_opts = { delay = 1500 },
      diff_opts = { internal = true },
      signcolumn = true,
      linehl = true,
    })

    local gs = package.loaded.gitsigns
    vim.api.nvim_set_hl(
      0,
      "GitSignsAddInline",
      { underdotted = true, default = true, sp = "green" }
    ) -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_set_hl(
      0,
      "GitSignsDeleteInline",
      { strikethrough = true, default = true, sp = "yellow" }
    ) -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_set_hl(
      0,
      "GitSignsChangeInline",
      { undercurl = true, default = true, sp = "cyan" }
    ) -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_create_user_command("Stage", "'<,'>Gitsigns stage_hunk", { range = true })

    -- map("n", "<leader>hs", gs.stage_hunk)
    -- map("n", "<leader>hr", gs.reset_hunk)
    -- map("v", "<leader>hs", function()
    --   gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    -- end)
    -- map("v", "<leader>hr", function()
    --   gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    -- end)
    -- map("n", "<leader>hS", gs.stage_buffer)
    -- map("n", "<leader>hu", gs.undo_stage_hunk)
    -- map("n", "<leader>hR", gs.reset_buffer)
    -- map("n", "<leader>hp", gs.preview_hunk)
    -- map("n", "<leader>hb", function()
    --   gs.blame_line({ full = true })
    -- end)
    -- map("n", "<leader>tb", gs.toggle_current_line_blame)
    -- map("n", "<leader>hd", gs.diffthis)
    -- map("n", "<leader>hD", function()
    --   gs.diffthis("~")
    -- end)
    -- map("n", "<leader>td", gs.toggle_deleted)
  end,
}
