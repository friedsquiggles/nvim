local icons = {
  ui = require("jordan.icons").get("ui", true),
  git = require("jordan.icons").get("git", true),
  docs = require("jordan.icons").get("documents", true),
  diagnostics = require("jordan.icons").get("diagnostics", true),
}

local toggle = "<Cmd>NvimTreeToggle<CR>"
local focus = "<Cmd>NvimTreeFocus<CR>"
local refresh = "<Cmd>NvimTreeRefresh<CR>"
local opened = "<Cmd>NvimTreeFindFile<CR>"

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  keys = {
    { "<leader>tt", toggle, desc = "toggle tree explorer" },
    { "<leader>ef", focus, desc = "focus explorer" },
    { "<leader>er", refresh, desc = "refresh explorer" },
    { "<leader>eo", opened, desc = "opened file explorer" },
  },
  opts = {
    actions = {
      open_file = { quit_on_open = true },
    },
    git = { enable = true, ignore = false },
    modified = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Information,
        warning = icons.diagnostics.Warning,
        error = icons.diagnostics.Error,
      },
    },
    view = {
      width = 50,
      side = "right",
    },
    renderer = {
      highlight_opened_files = "name",
      highlight_modified = "icon",
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        diagnostics_placement = "signcolumn",
        git_placement = "before",
        modified_placement = "after",
        padding = " ",
        webdev_colors = true,
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
        glyphs = {
          default = icons.docs.Default,
          symlink = icons.docs.Symlink,
          folder = {
            default = icons.ui.Folder,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            open = icons.ui.FolderOpen,
            symlink = icons.ui.SymlinkFolder,
            symlink_open = icons.ui.SymlinkFolder,
            arrow_open = icons.ui.ArrowOpen,
            arrow_closed = icons.ui.ArrowClosed,
          },
          git = {
            unstaged = icons.git.Unstaged,
            staged = icons.git.Staged,
            unmerged = icons.git.Unmerged,
            renamed = icons.git.Rename,
            untracked = icons.git.Add,
            deleted = icons.git.Remove,
            ignored = icons.git.Ignore,
          },
        },
      },
    },
  },
  config = function(_, opts)
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local color_peach = require("jordan.colors").peach
    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=color_peach ]])

    -- configure nvim-tree
    nvimtree.setup(opts)
  end,
}
