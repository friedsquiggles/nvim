return {
  "mhartington/formatter.nvim",
  event = "LspAttach",
  cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },

  config = function()
    vim.g.autoformat = true

    local formatter = require("formatter")
    formatter.setup({
      filetype = {
        lua = { require("formatter.filetypes.lua").stylua },
        javascript = { require("formatter.filetypes.javascript").prettier },
        typescript = { require("formatter.filetypes.typescript").prettier },
        html = { require("formatter.filetypes.typescript").prettier },
        json = { require("formatter.filetypes.json").prettier },
        terraform = { require("formatter.filetypes.terraform").terraformfmt },
        yaml = { require("formatter.filetypes.yaml").prettier },
        markdown = { require("formatter.filetypes.markdown").prettier },
        sh = { require("formatter.filetypes.sh").shfmt },
        zsh = { require("formatter.filetypes.sh").shfmt },
        python = { require("formatter.filetypes.python").black },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },

      vim.keymap.set("n", "<Leader>f", ":Format<CR>", {silent = true})
    })

  end,
}
