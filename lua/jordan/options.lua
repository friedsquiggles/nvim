local opt = vim.opt

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

-- cursor behavior
opt.wrap = false
opt.mouse = "a"
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
