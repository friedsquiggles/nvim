local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.icons").get("ui", true),
  git = require("jordan.icons").get("git", true),
  cmp = require("jordan.icons").get("cmp", true),
  kind = require("jordan.icons").get("kind", true),
}

local M = {}

-- dimensions
local heightWithPreview = 0.7
local widthWithPreview = 0.9
local heightWithoutPreview = 40
local widthWithoutPreview = 80

-- transparency
local blend = 10

local iconPrefix = function(icon)
  return " " .. icon .. " "
end

local getTitle = function(icon, title)
  local cl = icons.ui.ChevronLeft
  local cr = icons.ui.ChevronRight
  local left = cl .. cl .. cl .. " "
  local right = " " .. cr .. cr .. cr

  return left .. icon .. " " .. title .. " " .. icon .. right
end

function M.getLiveGrep()
  local icon = icons.kind.Text
  local title = "FIND TEXT (grep)"

  require("telescope.builtin").live_grep(themes.get_dropdown({
    previewer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_config = {
      height = heightWithPreview,
      width = widthWithPreview,
    },
  }))
end

function M.getGrepCurrentWord()
  local icon = icons.kind.Text
  local title = "FIND CURRENT WORD (grep)"

  require("telescope.builtin").grep_string(themes.get_dropdown({
    previewer = true,
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
    win_blend = blend,
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    path_display = function(opts, path)
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
  local title = "FIND FILES"

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
  local title = "RECENT FILES"

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

function M.getGitStatus()
  local icon = icons.git.Git
  local title = "GIT STATUS"

  require("telescope.builtin").git_status(themes.get_dropdown({
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

function M.getGitCommits()
  local icon = icons.git.Git
  local title = "GIT COMMITS"

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
  local title = "GIT BRANCHES"

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
  local title = "QUICK FIX"

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
  local title = "DOCUMENT SYMBOLS"

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
  local title = "LSP REFERENCES"

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

function M.getLspWorkspaceSymbols()
  local icon = icons.cmp.nvim_lsp
  local title = "LSP WORKSPACE SYMBOLS"

  require("telescope.builtin").lsp_workspace_symbols(themes.get_dropdown({
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
