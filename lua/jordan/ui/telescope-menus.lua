local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
}

local M = {}

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

function M.text(glob)
  local icon = icons.kind.Text
  local title = "GREP"

  return function()
    require("telescope.builtin").live_grep(themes.get_dropdown({
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      glob_pattern = glob,
    }))
  end
end

function M.cursor(glob)
  local icon = icons.kind.Text
  local title = "CURSOR"
  return function()
    require("telescope.builtin").grep_string(themes.get_dropdown({
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      glob_pattern = glob,
    }))
  end
end

function M.files(hidden)
  local icon = icons.ui.EmptyFolderOpen
  local title = "FILES"

  return function()
    require("telescope.builtin").find_files(themes.get_dropdown({
      no_ignore = false,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      cwd = vim.fn.getcwd(),
      hidden = hidden,
    }))
  end
end

function M.recent(cwo)
  local icon = icons.ui.EmptyFolderOpen
  local title = "RECENT"

  return function()
    require("telescope.builtin").oldfiles(themes.get_dropdown({
      hidden = true,
      prompt_title = getTitle(icon, title),
      prompt_prefix = iconPrefix(icon),
      cwd = vim.fn.getcwd(),
      only_cwd = cwo,
    }))
  end
end

function M.status()
  local icon = icons.git.Git
  local title = "CHANGES"

  require("telescope.builtin").git_status(themes.get_dropdown({
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
  }))
end

function M.commits()
  local icon = icons.git.Git
  local title = "COMMITS"

  require("telescope.builtin").git_commits(themes.get_dropdown({
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
  }))
end

function M.branches()
  local icon = icons.git.Git
  local title = "BRANCHES"

  require("telescope.builtin").git_branches(themes.get_dropdown({
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
  }))
end

function M.treesitter()
  local icon = icons.cmp.treesitter
  local title = "SYMBOLS"

  require("telescope.builtin").treesitter(themes.get_dropdown({
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
  }))
end

function M.refs()
  local icon = icons.cmp.nvim_lsp
  local title = "REFERENCES"

  require("telescope.builtin").lsp_references(themes.get_dropdown({
    prompt_title = getTitle(icon, title),
    prompt_prefix = iconPrefix(icon),
  }))
end

return M
