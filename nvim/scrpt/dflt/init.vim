" 
" load re
" :source ~/.config/nvim/init.vim     " alias :v

" val

let g:dotfiles_dir       = '~/wrk/prj-pri/dotfiles'
let g:init_vim_dir       = g:dotfiles_dir . '/nvim/scrpt'
let g:init_vim_etc_dir   = g:init_vim_dir . '/dflt/vim'

" fnc
lua require('init-fnc')
source `=g:init_vim_etc_dir . '/init-fnc.vim'`

" fnc tst
source `=g:init_vim_etc_dir . '/init-fnc-tst.vim'`

" plg
source `=g:init_vim_etc_dir . '/init-plg.vim'`

" plg fnc
source `=g:init_vim_etc_dir . '/init-plg-fzf.vim'`


" lua
lua require('init')


" 
" init
" 

" ynk
call Ynk__clp()

" srch
func! Srch_init() abort " use not

  let l:cmd = '/<cr>N'
  call Normal(l:cmd)
endfunc
"call Srch_init()


