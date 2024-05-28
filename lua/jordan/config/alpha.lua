return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
  config = function()
    local _, alpha = pcall(require, "alpha")

    local icons = {
      kind = require("jordan.ui.icons").get("kind", true),
      ui = require("jordan.ui.icons").get("ui", true),
      misc = require("jordan.ui.icons").get("misc", true),
      git = require("jordan.ui.icons").get("git", true),
      docs = require("jordan.ui.icons").get("documents", true),
    }

    -- button names
    local exp = icons.ui.Search .. " explorer"
    local file = icons.kind.File .. " file"
    local text = icons.kind.Text .. " text"
    local recent = icons.misc.Watch .. " recent"
    local mason = icons.misc.Lego .. " mason"
    local git = icons.git.Git .. " git"

    -- button commands
    local explorer = ":lua MiniFiles.open()<CR>"
    local findFiles = ":lua require('jordan.ui.telescope-menus').getFindFiles()<CR>"
    local recentFiles = ":lua require('jordan.ui.telescope-menus').getRecentFiles()<CR>"
    local liveGrep = ":lua require('jordan.ui.telescope-menus').getLiveGrep()<CR>"
    local gitStatus = ":lua require('jordan.ui.telescope-menus').getGitStatus()<CR>"

    local startify = require("alpha.themes.startify")
    local section = startify.section

    section.header.opts.hl = "AlphaHeader"

    section.top_buttons = {
      type = "group",
      val = {
        startify.button("e", exp, explorer),
        startify.button("f", file, findFiles),
        startify.button("r", recent, recentFiles),
        startify.button("t", text, liveGrep),
        startify.button("g", git, gitStatus),
        startify.button("l", "󰒲 " .. " lazy", ":Lazy<CR>"),
        startify.button("m", mason, ":Mason<CR>"),
      },
    }

    section.bottom_buttons.val = {
      startify.button("q", " " .. " quit", ":qa<CR>"),
    }

    -- MRU
    section.mru = {
      type = "group",
      val = {
        { type = "padding", val = 1 },
        {
          type = "text",
          val = " Recent Files",
          opts = { hl = "SpecialComment" },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { startify.mru(1, false, 3) }
          end,
          -- opts = { shrink_margin = false },
        },
      },
    }

    -- cwd title
    local function mru_title()
      return "MRU " .. vim.fn.getcwd()
    end

    -- MRU cwd
    section.mru_cwd = {
      type = "group",
      val = {
        { type = "padding", val = 1 },
        {
          type = "text",
          val = " " .. mru_title(),
          opts = { hl = "SpecialComment" },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { startify.mru(4, vim.fn.getcwd()) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    -- disable nvim_web_devicons
    startify.nvim_web_devicons.enabled = true
    startify.nvim_web_devicons.highlight = true
    startify.nvim_web_devicons.highlight = "Keyword"

    -- startify.section.footer.val = {
    --   { type = "text", val = "footer" },
    -- }

    local default_mru_ignore = { "gitcommit" }

    -- ignore filetypes in MRU
    startify.mru_opts.ignore = function(path, ext)
      return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
    end

    startify.config.layout = {
      { type = "padding", val = 1 },
      section.header,
      { type = "padding", val = 3 },
      section.top_buttons,
      { type = "padding", val = 1 },
      section.mru,
      { type = "padding", val = 1 },
      section.mru_cwd,
      { type = "padding", val = 1 },
      section.bottom_buttons,
      -- section.footer,
    }

    alpha.setup(startify.config)
  end,
}
