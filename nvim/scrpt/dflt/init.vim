" 
" load re
" :source ~/.config/nvim/init.vim     " alias :v

" val

let g:dotfiles_dir       = '~/wrk/prj-pri/dotfiles'
let g:init_vim_dir       = g:dotfiles_dir . '/nvim/scrpt'
let g:init_vim_mdl_dir   = g:init_vim_dir . '/dflt/init-vim-mdl'

" fnc
source `=g:init_vim_mdl_dir . '/init-fnc.vim'`
source `=g:init_vim_mdl_dir . '/init-fnc-tst.vim'`

" hl
" source `=g:init_vim_mdl_dir . '/init-hl.vim'`

" cmd ( usr )
" source `=g:init_vim_mdl_dir . '/init-cmd-usr.vim'`

" plugin
source `=g:init_vim_mdl_dir . '/init-plg.vim'`
source `=g:init_vim_mdl_dir . '/init-plg-fzf.vim'`


" init.lua
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


