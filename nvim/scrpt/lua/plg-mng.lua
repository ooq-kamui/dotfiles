
-- plg

-- vim-plug

g.plg_mng_cmd = [[
  call plug#begin()

  " vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " nvim
  Plug 'ojroques/nvim-osc52'
  Plug 'stevearc/oil.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Plug 'shellRaining/hlchunk.nvim'
  " Plug 'sphamba/smear-cursor.nvim'
  " Plug 'folke/noice.nvim'
  " Plug 'MunifTanjim/nui.nvim'
  call plug#end()

  " lua require('smear_cursor').enabled = true
  " lua require("noice").setup()
]]

if v.Is_vim_plg__installed() then

  v.Cmd.cmd(g.plg_mng_cmd)
end
-- do :PlugInstall
-- or :PlugUpdate
-- or :PlugClean

osc52 = require('osc52')

require("oil").setup({
  keymaps = {
    ["<c-j>"] = { "actions.select", opts = { tab = bl.t } },
  },
  -- view_options = {
  --   new_tab = bl.t,
  -- },
})

-- lazy

-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
-- 
-- require("lazy").setup({
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--   },
-- })

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "markdown",
    "markdown_inline",
    -- "lua",
    -- "javascript"
  },
  sync_install = false,
  highlight = { enable = true },
  -- indent = { enable = true },
})
-- ex
-- :TSInstall lua


