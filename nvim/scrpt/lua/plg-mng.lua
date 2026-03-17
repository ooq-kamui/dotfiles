
-- vim-plug

v.Plg.mng.vim_plg.cmd = [[
  call plug#begin()

"    " fzf
"    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"    Plug 'junegunn/fzf.vim'
"    Plug 'ibhagwan/fzf-lua', { 'branch': 'main' }
"
"    " nvim
"    Plug 'ojroques/nvim-osc52'
"    Plug 'stevearc/oil.nvim'
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    Plug 'MunifTanjim/nui.nvim'
"
"    Plug 'nvim-lualine/lualine.nvim'
"    " If you want to have icons in your statusline choose one of these
"    " Plug 'nvim-tree/nvim-web-devicons'
"
"    " Plug 'shellRaining/hlchunk.nvim'
"    " Plug 'sphamba/smear-cursor.nvim'
"    " Plug 'folke/noice.nvim'
"    " Plug 'MunifTanjim/nui.nvim'
  call plug#end()
]]

if v.Plg.mng.vim_plg.is__installed() then

  v.Cmd.cmd(v.Plg.mng.vim_plg.cmd)
end
-- -- do :PlugInstall
-- -- or :PlugUpdate
-- -- or :PlugClean


-- 
-- lazy.nvim
-- 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- fzf
  { 'junegunn/fzf', build = "./install --all" },
  { 'junegunn/fzf.vim' },
  { 'ibhagwan/fzf-lua', branch = 'main' },

  -- nvim utilities
  { 'ojroques/nvim-osc52' },
  { 'stevearc/oil.nvim', opts = {
      keymaps = {
        ["<c-j>"] = { "actions.select", opts = { tab = bl.t } },
        -- ["<c-p>"] = bl.f,
      },
      -- view_options = {
      --   new_tab = bl.t,
      -- },
    }
  },
  { 
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.install").prefer_git = true
      require('nvim-treesitter.config').setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "javascript",
          "python",
          "powershell",
        },
        sync_install = false,
        highlight = { enable = true },
      })
    end
  },

  -- { 'MunifTanjim/nui.nvim' },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {}
  -- },
  -- { 'shellRaining/hlchunk.nvim', event = "BufRead" },
  -- { 'sphamba/smear-cursor.nvim', opts = {} },
  -- { 'folke/noice.nvim', dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
})

