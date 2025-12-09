
-- vim-plug

v.Plg.mng_vim_plg_cmd = [[
  call plug#begin()
    " vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " nvim
    Plug 'ojroques/nvim-osc52'
    Plug 'stevearc/oil.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'MunifTanjim/nui.nvim'

    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    " Plug 'nvim-tree/nvim-web-devicons'

    " Plug 'shellRaining/hlchunk.nvim'
    " Plug 'sphamba/smear-cursor.nvim'
    " Plug 'folke/noice.nvim'
    " Plug 'MunifTanjim/nui.nvim'
  call plug#end()
]]

if v.Plg.is_vim_plg__installed() then

  v.Cmd.cmd(v.Plg.mng_vim_plg_cmd)
end
-- do :PlugInstall
-- or :PlugUpdate
-- or :PlugClean


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


osc52 = require('osc52')

require("oil").setup({
  keymaps = {
    ["<c-j>"] = { "actions.select", opts = { tab = bl.t } },
    -- ["<c-p>"] = bl.f,
  },
  -- view_options = {
  --   new_tab = bl.t,
  -- },
})

-- tree-sitter
-- require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "lua",
    "javascript",
    "python",
    "powershell",
  },
  sync_install = false,
  highlight = { enable = true },
  -- indent = { enable = true },
})
-- ex
-- :TSInstall lua

-- lualine
-- require('lualine').setup()

-- etc
-- " lua require('smear_cursor').enabled = true
-- " lua require("noice").setup()


