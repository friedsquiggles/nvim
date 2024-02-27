return {
  "echasnovski/mini.indentscope",
  version = "*",
  config = function()
    require("mini.indentscope").setup({

      draw = {
        delay = 50,
        animation = require("mini.indentscope").gen_animation.none(),
      },

      mappings = {
        object_scope = "ii",
        object_scope_with_border = "ai",
        goto_top = "[i",
        goto_bottom = "]i",
      },

      options = {
        border = "both",
        indent_at_cursor = true,
        try_as_border = false,
      },

      symbol = "│",
    })
  end,
}
