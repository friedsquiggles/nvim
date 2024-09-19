local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local icons = {
  ui = require("jordan.ui.icons").get("ui", true),
  git = require("jordan.ui.icons").get("git", true),
  cmp = require("jordan.ui.icons").get("cmp", true),
  kind = require("jordan.ui.icons").get("kind", true),
}

local M = {}

local prefix = function(icon)
  return " " .. icon .. " "
end

local header = function(icon, title)
  local cl = icons.ui.ChevronLeft
  local cr = icons.ui.ChevronRight
  local left = " " .. cl .. cl .. cl .. " "
  local right = " " .. cr .. cr .. cr
  local header = icon .. " " .. title .. " " .. icon

  return left .. header .. right
end

function M.text(glob)
  local i = icons.kind.Text
  return function()
    builtin.live_grep(themes.get_dropdown({
      prompt_title = header(i, "TEXT"),
      prompt_prefix = prefix(i),
      glob_pattern = glob,
    }))
  end
end

function M.cursor(glob)
  local i = icons.kind.Text
  return function()
    builtin.grep_string(themes.get_dropdown({
      prompt_title = header(i, "CURSOR"),
      prompt_prefix = prefix(i),
      glob_pattern = glob,
    }))
  end
end

function M.files(hidden)
  local i = icons.ui.EmptyFolderOpen
  return function()
    builtin.find_files(themes.get_dropdown({
      no_ignore = false,
      prompt_title = header(i, "FILES"),
      prompt_prefix = prefix(i),
      cwd = vim.fn.getcwd(),
      hidden = hidden,
    }))
  end
end

function M.recent(cwo)
  local i = icons.ui.EmptyFolderOpen
  return function()
    builtin.oldfiles(themes.get_dropdown({
      hidden = true,
      prompt_title = header(i, "RECENT"),
      prompt_prefix = prefix(i),
      cwd = vim.fn.getcwd(),
      only_cwd = cwo,
    }))
  end
end

function M.status()
  local i = icons.git.Git
  builtin.git_status(themes.get_dropdown({
    prompt_title = header(i, "CHANGES"),
    prompt_prefix = prefix(i),
  }))
end

function M.commits()
  local i = icons.git.Git
  builtin.git_commits(themes.get_dropdown({
    prompt_title = header(i, "COMMITS"),
    prompt_prefix = prefix(i),
  }))
end

function M.branches()
  local i = icons.git.Git
  builtin.git_branches(themes.get_dropdown({
    prompt_title = header(i, "BRANCHES"),
    prompt_prefix = prefix(i),
  }))
end

function M.treesitter()
  local i = icons.cmp.treesitter
  builtin.treesitter(themes.get_dropdown({
    prompt_title = header(i, "SYMBOLS"),
    prompt_prefix = prefix(i),
  }))
end

function M.refs()
  local i = icons.cmp.nvim_lsp
  builtin.lsp_references(themes.get_dropdown({
    prompt_title = header(i, "REFERENCES"),
    prompt_prefix = prefix(i),
  }))
end

return M
