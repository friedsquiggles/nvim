vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- completion settings
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
