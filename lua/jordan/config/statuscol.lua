return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      segments = {
        {
          sign = { name = { ".*" }, colwidth = 2, maxwidth = 1, auto = false },
          click = "v:lua#.ScSa",
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", colwidth = 3 },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          text = { " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          click = "v:lua.ScFa",
        },
        {
          sign = { name = { "GitSigns" }, maxwidth = 1, colwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        {
          text = { " " },
        },
      },
    })
  end,
}
