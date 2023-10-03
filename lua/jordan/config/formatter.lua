return {
  -- "mhartington/formatter.nvim",
  -- event = "LspAttach",
  -- cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
  --
  -- config = function()
  --   vim.g.autoformat = true
  --
  --   local formatter = require("formatter")
  --   formatter.setup({
  --     filetype = {
  --       lua = { require("formatter.filetypes.lua").stylua },
  --       javascript = { require("formatter.filetypes.javascript").prettier },
  --       typescript = { require("formatter.filetypes.typescript").prettier },
  --       html = { require("formatter.filetypes.typescript").prettier },
  --       json = { require("formatter.filetypes.json").prettier },
  --       terraform = { require("formatter.filetypes.terraform").terraformfmt },
  --       yaml = { require("formatter.filetypes.yaml").prettier },
  --       markdown = { require("formatter.filetypes.markdown").prettier },
  --       sh = { require("formatter.filetypes.sh").shfmt },
  --       zsh = { require("formatter.filetypes.sh").shfmt },
  --       python = { require("formatter.filetypes.python").black },
  --       ["*"] = {
  --         require("formatter.filetypes.any").remove_trailing_whitespace,
  --       },
  --     },
  --
  --     vim.keymap.set("n", "<Leader>f", ":Format<CR>", {silent = true})
  --   })
  --
  -- end,

  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
