local icons = {
  kind = require("jordan.icons").get("kind", true),
  misc = require("jordan.icons").get("misc", true)
}

local file = icons.kind.File
local text = icons.kind.Text
local recent = icons.misc.Watch
local mason = icons.misc.Lego

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", file .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", recent .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", text .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("m", mason .. " Mason", ":Mason<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.opts.layout[1].val = 6
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
  end,
}
