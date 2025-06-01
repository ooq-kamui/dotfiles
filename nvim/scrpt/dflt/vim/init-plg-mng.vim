" 
" plg vim-plug
" 

" fnc

func! Vim_plg_path() abort

  return v:lua.v.Vim_plg_path()
endfunc

func! Is_vim_plg__installed() abort

  return v:lua.v.Is_vim_plg__installed()
endfunc


" init

if Is_vim_plg__installed()
  " echo 'plug#begin'

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/vim-molder'
  " Plug 'mattn/vim-molder-operations'
  " Plug 'jacquesbh/vim-showmarks'

  " nvim
  Plug 'ojroques/nvim-osc52'

  " Plug 'shellRaining/hlchunk.nvim'
  " Plug 'sphamba/smear-cursor.nvim'
  " Plug 'folke/noice.nvim'
  " Plug 'MunifTanjim/nui.nvim'
  call plug#end()

  " lua require('smear_cursor').enabled = true
  " lua require("noice").setup()
endif
" do :PlugInstall
" or :PlugUpdate
" or :PlugClean


