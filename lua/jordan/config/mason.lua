local icons = {
  misc = require("jordan.ui.icons").get("misc", true),
  ui = require("jordan.ui.icons").get("ui", true),
}

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "typescript-language-server",
      "prettier",
      "eslint_d",
      "eslint-lsp",
      "lua-language-server",
      "luacheck",
      "terraform-ls",
      "tfsec",
      "tflint",
      "yaml-language-server",
      "yamlfix",
      "yamllint",
      "json-lsp",
      "jsonlint",
      "fixjson",
      "bash-language-server",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "html-lsp",
      "vim-language-server",
      "marksman",
      "markdownlint",
      "mdformat",
      "ansible-language-server",
      "ansible-lint",
      "codespell",
      "doctoc",
      "sql-formatter",
      "sqlls",
      "stylua",
      "gh",
      "shellcheck",
      "vale",
    },
    ui = {
      package_installed = icons.ui.Accepted,
      package_pending = icons.ui.CloudDownload,
      package_uninstalled = icons.misc.Ghost,
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup(opts)
    local mr = require("mason-registry")

    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end

    if mr.refresh then
      mr.refresh(ensure_installed)
    end
  end,
}
