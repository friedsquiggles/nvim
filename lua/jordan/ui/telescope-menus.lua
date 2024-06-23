local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
}

local M = {}

-- dimensions with preview
local hwp = 0.85
local wwp = 0.85

-- dimensions no preview
local hnp = 0.8
local wnp = 0.8

local iconPrefix = function(icon)
  return " " .. icon .. " "
end

local getTitle = function(icon, title)
  local cl = icons.ui.ChevronLeft
  local cr = icons.ui.ChevronRight
  local left = " " .. cl .. cl .. cl .. " "
  local right = " " .. cr .. cr .. cr
  local header = icon .. " " .. title .. " " .. icon

  return left .. header .. right
end

function M.getText(glob)
  local icon = icons.kind.Text
  local title = "GREP"

  return function()
    require("telescope.builtin").live_grep(themes.get_dropdown({
      previewer = true,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        height = hwp,
        width = wwp,
        prompt_position = "top",
        preview_cutoff = 120,
      },
      glob_pattern = glob,
    }))
  end
end

function M.getCursor(glob)
  local icon = icons.kind.Text
  local title = "CURSOR"
  return function()
    require("telescope.builtin").grep_string(themes.get_dropdown({
      previewer = true,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        height = hwp,
        width = wwp,
        prompt_position = "top",
        preview_cutoff = 120,
      },
      glob_pattern = glob,
    }))
  end
end

function M.getFiles(hidden)
  local icon = icons.ui.EmptyFolderOpen
  local title = "FILES"

  return function()
    require("telescope.builtin").find_files(themes.get_dropdown({
      previewer = false,
      no_ignore = false,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      layout_config = {
        height = hnp,
        width = wnp,
      },
      cwd = vim.fn.getcwd(),
      hidden = hidden,
    }))
  end
end

function M.getRecent(cwo)
  local icon = icons.ui.EmptyFolderOpen
  local title = "RECENT"

  return function()
    require("telescope.builtin").oldfiles(themes.get_dropdown({
      previewer = true,
      hidden = true,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      layout_config = {
        height = hnp,
        width = wnp,
      },
      cwd = vim.fn.getcwd(),
      only_cwd = cwo,
    }))
  end
end

-- function M.getActiveBuffers()
--   local icon = icons.ui.EmptyFolderOpen
--   local title = "BUFFERS"
--
--   require("telescope.builtin").buffers(themes.get_dropdown({
--     previewer = false,
--     ignore_current_buffer = true,
--     prompt_title = getTitle(icon, title),
--     prompt_prefix = iconPrefix(icon),
--     sort_lastused = false,
--     sort_mru = true,
--     layout_config = {
--       height = hnp,
--       width = wnp,
--     },
--   }))
-- end

function M.getGitStatus()
  local icon = icons.git.Git
  local title = "CHANGES"

  require("telescope.builtin").git_status(themes.get_dropdown({
    previewer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_strategy = "vertical",
    layout_config = {
      height = hwp,
      width = wwp,
    },
    git_icons = {
      added = icons.git.Add,
      changed = icons.git.Mod,
      copied = ">",
      deleted = icons.git.Remove,
      renamed = icons.git.Rename,
      staged = icons.git.Staged,
      unstaged = icons.git.Unstaged,
      unmerged = icons.git.Unmerged,
      untracked = icons.git.Untracked,
    },
  }))
end

function M.getGitCommits()
  local icon = icons.git.Git
  local title = "COMMITS"

  require("telescope.builtin").git_commits(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_config = {
      height = hnp,
      width = wnp,
    },
  }))
end

function M.getGitBranches()
  local icon = icons.git.Git
  local title = "BRANCHES"

  require("telescope.builtin").git_branches(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_config = {
      height = hnp,
      width = wnp,
    },
  }))
end

function M.getQuickFix()
  local icon = icons.ui.CodeAction
  local title = "FIX"

  require("telescope.builtin").quickfix(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_config = {
      height = hnp,
      width = wnp,
    },
  }))
end

function M.getTreeSitter()
  local icon = icons.cmp.treesitter
  local title = "SYMBOLS"

  require("telescope.builtin").treesitter(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_config = {
      height = hnp,
      width = wnp,
    },
  }))
end

function M.getLspRefs()
  local icon = icons.cmp.nvim_lsp
  local title = "REFERENCES"

  require("telescope.builtin").lsp_references(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    layout_config = {
      height = hnp,
      width = wnp,
    },
  }))
end

return M
