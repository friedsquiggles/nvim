return {
  "mfussenegger/nvim-lint",
  lazy = "true",
  event = { "BufReadPre", "BufNewFile" },
  config = function(plugin)
    local lint = require("lint")

    lint.linters_by_ft = {
      text = { "vale" },
      markdown = { "markdownlint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      json = { "eslint" },
      yaml = { "eslint" },
      toml = { "eslint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
