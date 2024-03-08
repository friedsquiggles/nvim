-- localize vim options and functions
local opt = vim.opt
local g = vim.g
local map = vim.api.nvim_set_keymap

-- set leader keys and disallow remapping
g.mapleader = " "
g.maplocalleader = " "
map("n", " ", "", { noremap = true })
map("x", " ", "", { noremap = true })

-- completion settings
g.completion_confirm_key = ""
g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

-- Do not load tohtml.vim
g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
g.loaded_zipPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
g.loaded_matchit = 1
g.loaded_matchparen = 1

-- Disable sql omni completion, it is broken.
g.loaded_sql_completion = 1

g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
-- use system clipboard
opt.clipboard = "unnamedplus"

-- indentation
opt.expandtab = true
opt.tabstop = 2
opt.breakindent = true

-- line numbers
opt.number = true
opt.relativenumber = true

-- columns
opt.signcolumn = "yes:1"
opt.showmode = false
opt.colorcolumn = "100"

-- case sensitivity
opt.ignorecase = true
opt.smartcase = true
opt.spelllang = { "en" }

-- scroll behavior
opt.scrolloff = 20
opt.sidescrolloff = 8

-- undo
opt.undofile = true

-- colors
opt.termguicolors = true

-- cursor
opt.wrap = false
opt.cursorline = true
opt.backspace = "indent,eol,start"

-- timers
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- search
opt.hlsearch = false

-- split behavior
opt.splitbelow = true
opt.splitright = true

-- mouse
opt.mouse = "a"
opt.mousescroll = "ver:2,hor:6"
