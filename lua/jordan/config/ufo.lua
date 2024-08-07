local ufo

local get_fold_summary = function(lnum, end_lnum, ctx)
  local filetype = vim.bo.filetype
  local bufnr = vim.api.nvim_get_current_buf()

  if filetype == "bib" then
    for l = lnum, end_lnum do
      local line_string = vim.api.nvim_buf_get_lines(bufnr, l - 1, l, false)[1]
      local m = line_string:gmatch("title%s*=%s*{(.*)}")()
      if m then
        return m
      end
    end
  end

  return ""
end

local attach_ufo_if_necessary = function()
  local bufnr = vim.api.nvim_get_current_buf()
  if not ufo.hasAttached(bufnr) then
    ufo.attach()
    return true
  end
  return false
end

local enable_ufo_fold = function()
  attach_ufo_if_necessary()
  ufo.enableFold()
end

local open_all_folds = function()
  enable_ufo_fold()
  ufo.openAllFolds()
end

local close_all_folds = function()
  enable_ufo_fold()
  ufo.closeAllFolds()
end

local reduce_folding = function()
  enable_ufo_fold()
  ufo.openFoldsExceptKinds()
end

local more_folding = function()
  enable_ufo_fold()
  ufo.closeFoldsWith()
end

local peek_folded_lines = function()
  local enter = false
  local include_next_line = false
  ufo.peekFoldedLinesUnderCursor(enter, include_next_line)
end

local setup_folding_keymaps = function()
  vim.keymap.set("n", "zR", open_all_folds, { desc = "Open all folds" })
  vim.keymap.set("n", "zM", close_all_folds, { desc = "Close all folds" })
  vim.keymap.set("n", "zr", reduce_folding, { desc = "Reduce fold" })
  vim.keymap.set("n", "zm", more_folding, { desc = "Fold more" })
  vim.keymap.set("n", "zp", peek_folded_lines, { desc = "Peek and preview folded lines" })
end

local virtual_text_handler = function(virt_text, lnum, end_lnum, width, truncate, ctx)
  local counts = (" 󰁂 %d "):format(end_lnum - lnum + 1)
  local ellipsis = "⋯"
  local padding = ""

  local bufnr = vim.api.nvim_get_current_buf()
  local end_text = vim.api.nvim_buf_get_lines(bufnr, end_lnum - 1, end_lnum, false)[1]
  local end_virt_text = ctx.get_fold_virt_text(end_lnum)

  local folding_summary = get_fold_summary(lnum, end_lnum, ctx)
  if folding_summary and #folding_summary > 0 then
    table.insert(virt_text, { "  " .. folding_summary, "MoreMsg" })
  end

  if #end_virt_text >= 1 and vim.trim(end_virt_text[1][1]) == "" then
    table.remove(end_virt_text, 1) -- e.g., {"   ", ")"} -> {")"}
  end

  if #end_virt_text == 1 and #vim.split(vim.trim(end_text), " ") == 1 then
    end_virt_text[1][1] = vim.trim(end_virt_text[1][1]) -- trim the first token, e.g., "   }" -> "}"
    end_virt_text = { end_virt_text[1] } -- show only the first token
  else
    end_virt_text = {}
  end

  local sufWidth = (2 * vim.fn.strdisplaywidth(ellipsis)) + vim.fn.strdisplaywidth(counts)
  for _, v in ipairs(end_virt_text) do
    sufWidth = sufWidth + vim.fn.strdisplaywidth(v[1])
  end

  local target_width = width - sufWidth
  local cur_width = 0

  local result = {} -- virtual text tokens to display.

  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)

    if target_width > cur_width + chunk_width then
      table.insert(result, chunk)
    else
      chunk_text = truncate(chunk_text, target_width - cur_width)
      local hl_group = chunk[2]
      table.insert(result, { chunk_text, hl_group })
      chunk_width = vim.fn.strdisplaywidth(chunk_text)

      if cur_width + chunk_width < target_width then
        padding = padding .. (" "):rep(target_width - cur_width - chunk_width)
      end
      break
    end
    cur_width = cur_width + chunk_width
  end

  table.insert(result, { "  " .. ellipsis .. "  ", "UfoFoldedEllipsis" })

  for _, v in ipairs(end_virt_text) do
    table.insert(result, v)
  end

  table.insert(result, { counts, "MoreMsg" })
  table.insert(result, { padding, "" })

  return result
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
  event = "BufReadPost",
  opts = {},
  config = function()
    ufo = require("ufo")

    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.g.has_folding_ufo = 1
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    ufo.setup({
      open_fold_hl_timeout = 150,
      provider_selector = function(_, _)
        return { "treesitter", "indent" }
      end,
      close_fold_kinds_for_ft = {
        default = {
          "imports",
          "comment",
        },
        -- json = {
        --     "array",
        -- },
        c = {
          "comment",
          "region",
        },
      },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
          close = "<Esc>",
        },
      },
      enable_get_fold_virt_text = true,
      fold_virt_text_handler = virtual_text_handler,
    })

    setup_folding_keymaps()
  end,
}
