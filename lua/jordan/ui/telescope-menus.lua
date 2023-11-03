local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
}

local M = {}

-- dimensions with preview
local heightWithPreview = 0.7
local widthWithPreview = 0.8

-- dimensions no preview
local heightWithoutPreview = 0.5
local widthWithoutPreview = 0.4

-- current buffer fuzzy find
local bufFzyHeight = 0.7
local bufFzyWidth = 0.6

-- transparency
local blend = 10

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

function M.getLiveGrep()
  local icon = icons.kind.Text
  local title = "GREP"

  require("telescope.builtin").live_grep(themes.get_dropdown({
    previewer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    path_display = function(_, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
    layout_config = {
      height = heightWithPreview,
      width = widthWithPreview,
      prompt_position = "top",
      preview_cutoff = 120,
    },
  }))
end

function M.getBufferFzy()
  local icon = icons.kind.Text
  local title = "HERE"

  require("telescope.builtin").current_buffer_fuzzy_find(themes.get_dropdown({
    previewer = false,
    show_line = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    path_display = "hidden",
    layout_config = {
      height = bufFzyHeight,
      width = bufFzyWidth,
    },
  }))
end

function M.getGrepCurrentWord()
  local icon = icons.kind.Text
  local title = "CURSOR"

  require("telescope.builtin").grep_string(themes.get_dropdown({
    previewer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    path_display = function(_, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
    layout_config = {
      height = heightWithPreview,
      width = widthWithPreview,
      prompt_position = "top",
      preview_cutoff = 120,
    },
  }))
end

function M.getFindFiles()
  local icon = icons.ui.EmptyFolderOpen
  local title = "FILES"

  require("telescope.builtin").find_files(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
    },
  }))
end

function M.getRecentFiles()
  local icon = icons.ui.EmptyFolderOpen
  local title = "RECENT"

  require("telescope.builtin").oldfiles(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    cwd_only = true,
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
    },
  }))
end

function M.getActiveBuffers()
  local icon = icons.ui.EmptyFolderOpen
  local title = "BUFFERS"

  require("telescope.builtin").buffers(themes.get_dropdown({
    previewer = false,
    ignore_current_buffer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    cwd_only = true,
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
    },
  }))
end

function M.getGitStatus()
  local icon = icons.git.Git
  local title = "CHANGES"

  require("telescope.builtin").git_status(themes.get_dropdown({
    previewer = false,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
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
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
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
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
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
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
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
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
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
    win_blend = blend,
    layout_config = {
      height = heightWithoutPreview,
      width = widthWithoutPreview,
    },
  }))
end

return M
