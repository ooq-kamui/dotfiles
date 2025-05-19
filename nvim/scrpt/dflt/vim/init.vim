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
lua require('init-fnc-tst' )
source `=g:init_vim_etc_dir . '/init-fnc-tst.vim'`

" plg
lua require('init-plg-mng')
source `=g:init_vim_etc_dir . '/init-plg-mng.vim'`
source `=g:init_vim_etc_dir . '/init-plg-fzf.vim'`


" env dir

let g:env_dir = v:lua.v.Env_dir()

if g:env_dir != ''
  source `=g:init_vim_dir . '/' . g:env_dir . '/init.vim'`
else
  echo "is env else"
endif


" lua
lua require('init')


" 
" init
" 

" ynk
call Ynk__clp()

" srch
func! Srch_init() abort " use not

  let l:cmd = '\<cr>N'
  call Normal(l:cmd)
endfunc
"call Srch_init()


