return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
  enabled = false,
  opts = function()
    local icons = {
      kind = require("jordan.icons").get("kind", true),
      misc = require("jordan.icons").get("misc", true),
    }

    local file = icons.kind.File
    local text = icons.kind.Text
    local recent = icons.misc.Watch
    local mason = icons.misc.Lego

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("e", file .. " Explorer", "<Cmd>NvimTreeFocus<CR>>"),
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
    local alpha_loaded, alpha = pcall(require, "alpha")

    if not alpha_loaded then
      print("alpha not loaded")
      return
    end

    local telescope_loaded, _ = pcall(require, "telescope")

    if not telescope_loaded then
      print("telescope not loaded")
      return
    end

    alpha.setup(dashboard.opts)
  end,
}
