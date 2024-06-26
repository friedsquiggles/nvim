local icons = {
  git = require("jordan.ui.icons").get("git", true),
}

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({

      sign_priority = 6,
      update_debounce = 400,

      signcolumn = true,
      linehl = true,
      numhl = false,
      word_diff = false,

      watch_gitdir = { interval = 1000, follow_files = true },
      debug_mode = false,

      current_line_blame = true,
      current_line_blame_opts = { delay = 1500, virt_text_pos = "right_align" },
      current_line_blame_formatter = " <author>, <committer_time:%y-%m-%d>",

      trouble = true,

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- move cursor to next change
        local nextHunk = function()
          if vim.wo.diff then
            return "]g"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end

        -- move cursor to previous change
        local prevHunk = function()
          if vim.wo.diff then
            return "[g"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end

        -- local diffThis = function()
        --   gs.diffthis("~")
        -- end

        -- Navigation
        map("n", "]g", nextHunk, { expr = true, desc = "git change next" })
        map("n", "[g", prevHunk, { expr = true, desc = "git change prev" })

        -- -- Staging
        -- map("n", "<leader>gh", gs.stage_hunk, { desc = "stage hunk" })
        -- map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "unstage hunk" })
        -- map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
        --
        -- -- Resetting
        -- map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
        -- map("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })

        -- Blame
        -- map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "blame" })

        -- -- Diff
        -- map("n", "<leader>gd", gs.diffthis, { desc = "git diff" })
        -- map("n", "<leader>gD", diffThis, { desc = "git diff" })
      end,
    })

    vim.api.nvim_set_hl(
      0,
      "GitSignsAddInline",
      { underdotted = false, default = true, sp = "green" }
    )

    -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_set_hl(
      0,
      "GitSignsDeleteInline",
      { strikethrough = false, default = true, sp = "yellow" }
    )

    -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_set_hl(
      0,
      "GitSignsChangeInline",
      { undercurl = false, default = true, sp = "cyan" }
    )

    -- diff mode: Deleted line |diff.txt|
    vim.api.nvim_create_user_command("Stage", "'<,'>Gitsigns stage_hunk", { range = true })
  end,
}
