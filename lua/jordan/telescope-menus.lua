local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.icons").get("ui", true),
  git = require("jordan.icons").get("git", true),
}

local M = {}

function M.getFindFiles()
  require("telescope.builtin").find_files(themes.get_dropdown({
    previewer = false,
    prompt_title = "<< find files >>",
    prompt_prefix = " " .. icons.ui.EmptyFolderOpen .. " ",
    win_blend = 10,
    layout_config = {
      height = 30,
      width = 80,
    },
  }))
end

function M.getGitStatus()
  require("telescope.builtin").git_status(themes.get_dropdown({
    previewer = false,
    prompt_title = "<< git status >>",
    prompt_prefix = " " .. icons.git.Git .. " ",
    win_blend = 10,
    layout_config = {
      height = 30,
      width = 80,
    },
  }))
end

function M.getTreeSitter()
  require("telescope.builtin").treesitter(themes.get_dropdown({
    previewer = false,
    prompt_title = "<< document symbols >>",
    prompt_prefix = " " .. icons.git.Git .. " ",
    win_blend = 10,
    layout_config = {
      height = 0.6,
      width = 0.6,
    },
  }))
end

return M
