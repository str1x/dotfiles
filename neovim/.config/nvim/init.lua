vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require "options"
local plugins = require "plugins"
require("lazy").setup(plugins, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.diagnostic.config({
  update_in_insert = true
})
-- change to info or debug if needed
vim.lsp.set_log_level("off")
