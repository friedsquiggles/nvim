return {
  "mfussenegger/nvim-lint",
  lazy = "true",
  event = { "BufReadPre", "BufNewFile" },
  config = function(_)
    local lint = require("lint")

    -- Declare MD linting config location
    local markdownlint = lint.linters.markdownlint
    markdownlint.args = {
      "--config",
      "~/.config/markdownlint/markdownlint.yaml",
      "--stdin",
    }

    local luacheck = lint.linters.luacheck
    luacheck.args = {
      "--config",
      "~/.config/luacheck/luacheckrc",
      "--formatter",
      "plain",
      "--codes",
      "--ranges",
      "-",
    }

    -- Map linters to filetypes
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
      lua = { "luacheck" },
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
