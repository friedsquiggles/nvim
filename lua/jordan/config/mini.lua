return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.align").setup() -- align text
    require("mini.ai").setup() -- text objects
    require("mini.bracketed").setup() -- jump by types
    require("mini.cursorword").setup() -- highlight word under cursor
    require("mini.indentscope").setup() -- show current scope
    require("mini.surround").setup() -- surround text objects
    require("mini.trailspace").setup() -- highlight trailing spaces
    require("mini.move").setup() -- move lines and blocks
    require("mini.pairs").setup() -- auto pair characters
    -- require("mini.notify").setup({ lsp_progress = { enable = false } }) -- show notifications
    require("mini.files").setup({
      mappings = {
        close = "q",
        go_in = "<Space>",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "<BS>",
        reset = "r",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
    }) -- directory nav & ops

    local starter = require("mini.starter")
    local pad = string.rep(" ", 2)
    starter.setup({
      evaluate_single = true,
      items = {
        { name = "Explorer", action = "lua MiniFiles.open()", section = "Files" },
        {
          name = "Directory",
          action = "lua require('jordan.ui.telescope-menus').getFiles(true)()",
          section = "Files",
        },
        {
          name = "Git Files",
          action = "Telescope git_files",
          section = "Files",
        },
        {
          name = "Git Status",
          action = "lua require('jordan.ui.telescope-menus').getGitStatus()",
          section = "Files",
        },

        { name = "Lazy", action = "Lazy", section = "Packages" },
        { name = "Mason", action = "Mason", section = "Packages" },
        starter.sections.recent_files(5, true, false),
        starter.sections.recent_files(5, false, true),
        starter.sections.builtin_actions(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.indexing("all", { "Builtin actions" }),
        -- starter.gen_hook.padding(3, 2),
        starter.gen_hook.aligning("center", "center"),
      },
    })

    -- vim.notify = require("mini.notify").make_notify()
  end,
}
