" 
" plugin
" 

" fnc

func! Vim_plug_path() abort

  if Is_nvim()

    let l:vim_plug_dir_dflt_nvim = $HOME . '/.local/share/nvim/site'
    " let l:vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"

    if     Is_env__('mac')

      " let l:vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      let l:vim_plug_dir_mac_nvim  = $HOME . '/.local/share/nvim/site'

      if     isdirectory(l:vim_plug_dir_dflt_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_dflt_nvim

      elseif isdirectory(l:vim_plug_dir_mac_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_mac_nvim
      else
        let l:vim_plug_dir = l:vim_plug_dir_mac_nvim
      endif

    elseif Is_env__('linux')

      " dev anchor
      " let l:vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      " let l:vim_plug_dir_ec2_nvim  = "/home/ec2-user/.local/share/nvim/site"
      " let l:vim_plug_dir_c9_nvim   = "/home/ec2-user/.local/share/nvim/site"
      " let l:vim_plug_dir_s9_nvim   = "/home/centos/.local/share/nvim/site"

      if     isdirectory(l:vim_plug_dir_dflt_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_dflt_nvim

      elseif isdirectory(l:vim_plug_dir_ec2_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_ec2_nvim

      elseif isdirectory(l:vim_plug_dir_c9_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_c9_nvim

      elseif isdirectory(l:vim_plug_dir_s9_nvim)
        let l:vim_plug_dir = l:vim_plug_dir_s9_nvim

      else
        let l:vim_plug_dir = l:vim_plug_dir_ec2_nvim
      endif

    elseif Is_env__('win64')

      let l:vim_plug_dir = '~/appdata/local/nvim-data/site'

    elseif Is_env__('win32unix') " gitbash

      let l:vim_plug_dir = '~/appdata/local/nvim-data/site'
    else
      let l:vim_plug_dir = '~/appdata/local/nvim-data/site'
    endif
  endif

  let l:vim_plug_path = l:vim_plug_dir . '/autoload/plug.vim'
  return l:vim_plug_path
endfunc

func! Is_vim_plug__installed() abort

  let l:vim_plug_path = Vim_plug_path()
  " echo l:vim_plug_path

  let l:ret = ! empty(glob(l:vim_plug_path))
  " echo 'vim_plug installed : ' . l:ret

  return l:ret
endfunc


" init

if Is_vim_plug__installed()
  "echo 'plug#begin'

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


