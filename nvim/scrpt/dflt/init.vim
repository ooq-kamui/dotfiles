" 
" load re
" :source ~/init.vim     " alias :v

" val

let g:dotfiles_dir       = '~/wrk/prj-pri/dotfiles'
let g:init_vim_dir       = g:dotfiles_dir . '/nvim/scrpt'
let g:init_vim_mdl_dir   = g:init_vim_dir . '/dflt/init-vim-mdl'

" fnc
source `=g:init_vim_mdl_dir . '/init-fnc.vim'`
source `=g:init_vim_mdl_dir . '/init-fnc-tst.vim'`


" opt
source `=g:init_vim_mdl_dir . '/init-opt.vim'`

" hl
source `=g:init_vim_mdl_dir . '/init-hl.vim'`

" cmd ( usr )
source `=g:init_vim_mdl_dir . '/init-cmd.vim'`


" 
" init
" 

" plugin
source `=g:init_vim_mdl_dir . '/init-plugin.vim'`
source `=g:init_vim_mdl_dir . '/init-plugin-fzf.vim'`


" ynk init
call Ynk__clp()

" srch init
func! Srch_init() abort " use not

  let l:cmd = '/<cr>N'
  call Normal(l:cmd)
endfunc
"call Srch_init()

" init end


" 
" init.lua
" 
lua require('init')


