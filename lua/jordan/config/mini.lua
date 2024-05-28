return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.align").setup() -- align text
    require("mini.bracketed").setup() -- jump by types
    require("mini.cursorword").setup() -- highlight word under cursor
    require("mini.indentscope").setup() -- show current scope
    require("mini.surround").setup() -- surround text objects
    require("mini.trailspace").setup() -- highlight trailing spaces
    require("mini.move").setup() -- move lines and blocks
    require("mini.pairs").setup() -- auto pair characters
    -- require("mini.notify").setup({ lsp_progress = { enable = false } }) -- show notifications
    require("mini.files").setup() -- directory nav & ops

    -- vim.notify = require("mini.notify").make_notify()
  end,
}
