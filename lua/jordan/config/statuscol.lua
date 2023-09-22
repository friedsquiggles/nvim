return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      segments = {
        {
          sign = { name = { ".*" }, maxwidth = 2, auto = true },
          click = "v:lua#.ScSa",
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          text = { " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          click = "v:lua.ScFa",
        },
        {
          sign = { name = { "GitSigns" }, maxwidth = 1, colwidth = 1, auto = true },
          click = "v:lua.ScSa",
        },
        {
          text = { " " },
        },
      },
    })
  end,
}
