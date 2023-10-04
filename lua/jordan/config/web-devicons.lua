return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = require("catppuccin.palettes").get_palette("macchiato")
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
