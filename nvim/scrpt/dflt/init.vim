" 
" load re
" :source ~/init.vim     " alias :v

" 
" val
" 

let g:dotfiles_dir       = '~/wrk/prj-pri/dotfiles'
let g:init_vim_dir       = g:dotfiles_dir . '/nvim/scrpt'
let g:init_vim_mdl_dir   = g:init_vim_dir . '/dflt/init-vim-mdl'

" opt
source `=g:init_vim_mdl_dir . '/init-opt.vim'`


" leader
let mapleader = "\<esc>"

" hl
source `=g:init_vim_mdl_dir . '/init-hl.vim'`

" cmd
source `=g:init_vim_mdl_dir . '/init-cmd.vim'`

" fnc
source `=g:init_vim_mdl_dir . '/init-fnc.vim'`
source `=g:init_vim_mdl_dir . '/init-fnc-tst.vim'`


" 
" init
" 

" plugin

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


" ynk init
call Ynk__clp()

" shell & .vimrc_env
set shell=fish           " default

let g:env_dir = ''

if     Is_env__('mac')       " mac
  let g:env_dir = 'mac'

elseif Is_env__('linux')     " c9, s9
  let g:env_dir = 'c9'

elseif Is_env__('win64')     " pwsh
  let g:env_dir = 'pwsh'

elseif Is_env__('win32unix') " gitbash
  let g:env_dir = 'gitbash'
endif

if g:env_dir != ''
  source `=g:init_vim_dir . '/' . g:env_dir . '/init.vim'`
else
  echo "is env else"
endif

" fzf init

let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {
\  'ctrl-o': 'tab drop',
\ }

"\  'ctrl-o': 'enter',
"\  'ctrl-i': 'item slct mtl',
"\  'ctrl-s': 'backward-char',

let g:fzf_colors = {
\   'hl'     : ['fg', 'Statement'  ],
\   'hl+'    : ['fg', 'Statement'  ],
\ }

"\   'bg+'    : ['bg', 'CursorLine' ],
"\   'bg+'    : ['bg', 'Normal'     ],

"\   'info'   : ['fg', 'Comment'    ],
"\   'border' : ['fg', 'Ignore'     ],
"\   'prompt' : ['fg', 'Function'   ],
"\   'pointer': ['fg', 'Statement'  ],
"\   'marker' : ['fg', 'Conditional'],

"\   'info'   : ['Comment'],
"\   'border' : ['Comment'],
"\   'prompt' : ['Comment'],
"\   'pointer': ['Comment'],
"\   'marker' : ['Comment'],

" use ??
"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" fzf var def ( in plugin ) end

if Is_env__('mac') || Is_env__('linux') || Is_env__('win64')

  if Is_env__('win64')
    let g:fzf_rg_opt .= ' -g "!.git/"'
  else
    let g:fzf_rg_opt .= ' -g "!.git/"'
  endif
endif

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


" 
" ref
" 

" https://vim-jp.org/vimdoc-ja/vimindex.html

" ptn ( regex )
" 
" \n : 改行
" \t : tab
" 
" \s : space, tab
" 
" \w : [0-9A-Za-z_]  word
" \h : [A-Za-z_]     単語の先頭文字, \w から数字を除いたもの
" \a : [A-Za-z]      alph
" \l : [a-z]         小文字
" \u : [A-Z]         大文字
" 
" \d : [0-9]         10進数
" \x : [0-9A-Fa-f]   16進数
" \o : [0-7]          8進数
"
" \S : \s 以外
" \D : \d 以外
" \X : \x 以外
" \O : \o 以外
" \W : \w 以外
" \H : \h 以外
" \A : \a 以外
" \L : \l 以外
" \U : \u 以外
" 
" 上記のそれぞれ + 改行
" ex
"   \_s : 改行, space, tab のいずれか
" 
" [^\x01-\x7E] : 全角
" 
" ref: [url]

" when unknown server )
"   curl https://raw.githubusercontent.com/ooq-kamui/dotfiles/refs/heads/main/nvim/scrpt/dflt/init.vim > init.vim
"   vim -u init.vim


