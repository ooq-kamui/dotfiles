" 
" plg vim-plug
" 

" fnc

func! Vim_plg_path() abort

  return v:lua.v.Vim_plg_path()

  " let l:vim_plg_dir_dflt_nvim = $HOME . '/.local/share/nvim/site'
  " 
  " if     Is_env__('mac')
  " 
  "   let l:vim_plg_dir_mac_nvim = $HOME . '/.local/share/nvim/site'
  " 
  "   if     isdirectory(l:vim_plg_dir_dflt_nvim)
  "     let l:vim_plg_dir = l:vim_plg_dir_dflt_nvim
  " 
  "   elseif isdirectory(l:vim_plg_dir_mac_nvim)
  "     let l:vim_plg_dir = l:vim_plg_dir_mac_nvim
  "   else
  "     let l:vim_plg_dir = l:vim_plg_dir_mac_nvim
  "   endif
  " 
  " elseif Is_env__('linux')
  " 
  "   if     isdirectory(l:vim_plg_dir_dflt_nvim)
  "     let l:vim_plg_dir = l:vim_plg_dir_dflt_nvim
  "   else
  "     let l:vim_plg_dir = l:vim_plg_dir_dflt_nvim
  "   endif
  " 
  " elseif Is_env__('win64')
  " 
  "   let l:vim_plg_dir = '~/appdata/local/nvim-data/site'
  " 
  " elseif Is_env__('win32unix') " gitbash
  " 
  "   let l:vim_plg_dir = '~/appdata/local/nvim-data/site'
  " else
  "   let l:vim_plg_dir = '~/appdata/local/nvim-data/site'
  " endif
  " 
  " let l:vim_plg_path = l:vim_plg_dir . '/autoload/plug.vim'
  " return l:vim_plg_path
endfunc

func! Is_vim_plg__installed() abort

  return v:lua.v.Is_vim_plg__installed()

  " let l:vim_plg_path = Vim_plg_path()
  " " echo l:vim_plg_path
  " 
  " let l:ret = ! empty(glob(l:vim_plg_path))
  " " echo 'vim-plug installed : ' . l:ret
  " 
  " return l:ret
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


