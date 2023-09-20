
return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = require("jordan.colors")
    require("nvim-web-devicons").setup({
      default = true,
      override_by_filename = {
        [".prettierrc"] = {
          icon = "󰫽",
          color = colors.rosewater,
          name = "PrettierRC",
        },
      },
    })
  end,
}
