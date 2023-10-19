return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
  config = function()
    local _, alpha = pcall(require, "alpha")

    local icons = {
      kind = require("jordan.icons").get("kind", true),
      misc = require("jordan.icons").get("misc", true),
      git = require("jordan.icons").get("git", true),
      docs = require("jordan.icons").get("documents", true),
    }

    local explorer = icons.docs.FileTree .. " Explorer"
    local file = icons.kind.File .. " Find file"
    local text = icons.kind.Text .. " grep"
    local recent = icons.misc.Watch .. " Recent files"
    local mason = icons.misc.Lego .. " Mason"
    local git = icons.git.Git .. " Changes"

    local findFiles = ":lua require('jordan.telescope-menus').getFindFiles()<CR>"
    local recentFiles = ":lua require('jordan.telescope-menus').getRecentFiles()<CR>"
    local liveGrep = ":lua require('jordan.telescope-menus').getLiveGrep()<CR>"
    local gitStatus = ":lua require('jordan.telescope-menus').getGitStatus()<CR>"
    -- local liveGrep =

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("e", explorer, "<Cmd>NvimTreeFocus<CR>>"),
      dashboard.button("f", file, findFiles),
      dashboard.button("r", recent, recentFiles),
      dashboard.button("g", text, liveGrep),
      dashboard.button("c", git, gitStatus),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("m", mason, ":Mason<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "AlphaHeader"
    -- dashboard.section.buttons.opts.hl = "AlphaButtons"
    -- dashboard.section.buttons.opts.hl_shortcut = "Boolean"
    -- dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8

    alpha.setup(dashboard.config)
  end,
}
