return {
  "luukvbaal/statuscol.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = false,
      segments = {

        -- diagnostic symbols
        {
          sign = { name = { ".*" }, text = { ".*" }, },
          click = "v:lua.ScSa",
        },

        -- folding symbols
        { text = { builtin.foldfunc }, click = "v:lua.ScFa", colwidth = 2 },

        -- empty space
        {
          text = { " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
        },

        -- line numbers
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", colwidth = 4 },

        -- empty space
        {
          text = { " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
        },
      },
    })
  end,
}
