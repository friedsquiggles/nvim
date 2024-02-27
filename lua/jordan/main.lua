local leader_map = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local load_package_manager = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(require("jordan.plugins"))
end

local load = function()
  leader_map()
  require("jordan.globals")
  require("jordan.autocmds")
  require("jordan.options")
  load_package_manager()
end

load()
