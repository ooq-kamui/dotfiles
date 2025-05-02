" 
" load re
" :source ~/init.vim     " alias :v

" 
" val
" 

let g:dotfiles_dir       = '~/wrk/prj-pri/dotfiles'
let g:init_vim_dir       = g:dotfiles_dir . '/nvim/scrpt'
let g:init_vim_file_path = g:init_vim_dir . '/dflt/init.vim'
let g:init_vim_mdl_dir   = g:init_vim_dir . '/dflt/init-vim-mdl'


" 
" set
" 

" set org

set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100 % vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup

" Don't write backup file if vim is being called by "chpass"
autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup

" set org end


filetype on

" syntax
autocmd BufNewFile,BufRead *.script     set filetype=lua
autocmd BufNewFile,BufRead *.gui_script set filetype=lua
autocmd BufNewFile,BufRead *.fish       set filetype=fish
syntax on

filetype indent on
" autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet " tab
autocmd FileType lua      setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType text     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType json     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType vim      setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType fish     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType sh       setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType markdown setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType python   setlocal sw=4 sts=4 ts=4   et " space

" comment auto off
autocmd FileType * set fo-=c fo-=r fo-=o


set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
set incsearch
set hlsearch
set ignorecase smartcase
set number
"set relativenumber
set list
set cursorline
set splitbelow
set switchbuf=usetab,newtab
set showcmd

set encoding=utf-8
set fileencodings=utf-8,sjis
" set termencoding=utf-8

"set mouse=n
"map <LeftMouse> <Nop>

set autoindent
set shiftwidth=2 " 4
set tabstop=2    " 4
set expandtab " tab > space


" file opn, cursor mv last
augroup vimrcEx
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" | endif
augroup END

autocmd BufWinEnter * normal! zz

set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " cursor mv cr
set virtualedit+=block  " box slct
"set virtualedit=all
set scrolloff=5
set sidescrolloff=4
set wildmode=list:longest
"set tabpagemax=30
set tabpagemax=50
set nf=""
set showtabline=2
set wildmenu " ?
"set showmatch
"set visualbell
"set ambiwidth=double " vim: double, nvim: single
set autoread

"set clipboard+=unnamedplus " ???

" status line

func! Status_line(file_encoding) abort

  set statusline=
  " set statusline+=%m\                " 変更あり表示
  set statusline+=%F                 " file name 表示
  set statusline+=%=                 " 以降を右寄せ

  if a:file_encoding
    set statusline+=%{&fileencoding}\  " file encoding
    if &bomb
      set statusline+=:bom             " bom
    endif
  endif

  set statusline+=%y\                " file type
  set statusline+=%c\                " column num
  set statusline+=%p%%\              " line num %
  set statusline+=%l/%L              " line num / line num all
endfunc
call Status_line(v:false)

set laststatus=2                   " 0:off  1:on when 2 win  2:on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I
"set nrformats+=unsigned " 2022-05-09

" splt
hi! link StatusLineNC Comment
hi! link VertSplit    Comment

set noswapfile

" undo
if has('persistent_undo')
  set undodir=~/.vim-undo
  set undofile                                                                                                                                   
endif

" term color
" set termguicolors


" leader
let mapleader = "\<esc>"

source `=g:init_vim_mdl_dir . '/init-hl.vim'`
" source `=g:init_vim_mdl_dir . '/init-key-map.vim'`


" 
" etc ( legacy ? )
" 

" if &term =~ '^screen'
"   " tmux will send xterm-style keys when its xterm-keys option is on
"   exe "set <xUp>=\e[1;*A"
"   exe "set <xDown>=\e[1;*B"
"   exe "set <xRight>=\e[1;*C"
"   exe "set <xLeft>=\e[1;*D"
" endif

" quickfix

"packadd Cfilter

" autocmd QuickFixCmdPost grep,vimgrep tab cw


" 
" cmd def
" 

command! -nargs=0 Pth call Pth()

command! -nargs=0 K     call Dir__parent(1)
command! -nargs=0 Kk    call Dir__parent(2)
command! -nargs=0 Kkk   call Dir__parent(3)

command! -nargs=0 Dpl call Buf_file__dpl()

command! -nargs=1 Mv call Buf_file__mv(<q-args>)

command! -nargs=* SrchOr call Srch_or(<f-args>)

command! -nargs=* InsSysCmd call Cursor__ins_sys_cmd(<q-args>)

command! -range=% -nargs=* Rpl <line1>,<line2>call Slctd_line__rpl(<f-args>)

command! -range=% -nargs=* VBoxRpl <line1>,<line2>call Slctd_box__rpl(<f-args>)

command! -nargs=* -complete=file Opn call Opn(<q-args>)

command! -nargs=* OpnMan call Opn_man(<q-args>)

"command! -nargs=* OpnApp call Opn_app(<f-args>)

" cmd def fzf

command! -bang -nargs=1 FzfRgExt call Fzf_rg_ext(<f-args>)

command! -nargs=? FzfRgWithRun call Fzf_rg_with_run(<f-args>)

command! -nargs=? FzfTagjmpByFile call Fzf_tag_jmp_by_file(<f-args>)

command! -bang -nargs=? FzfBufCrnt
\ call fzf#vim#buffer_lines(
\   <q-args>,
\   {'options': ['--no-sort', '--exact']},
\   <bang>1
\ )

" fzf file
command! -bang -nargs=? -complete=dir FzfFile call fzf#vim#files(<q-args>, <bang>1)

" fzf file history
command! -bang -nargs=* FzfFileHstry call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" fzf cmd history
command! -bang -nargs=* FzfCmdHstry call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" fzf srch history
command! -bang -nargs=* FzfSrchHstry call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" fzf rgstr
command! -bang -nargs=* FzfRgstr call Fzf_rgstr()

command! -bang -nargs=* FzfJmplst call Fzf_jmplst()

" fzf cmd def : mark
command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)

" term
command! -nargs=* Term split | wincmd j | resize 15 | term <args>
"autocmd TermOpen * startinsert


" fnc def
source `=g:init_vim_mdl_dir . '/init-fnc.vim'`


" 
" init
" 

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
" fnc repeat tmp
" 

func! Repeat_tmp() abort

  call Cursor__mv_srch('f')
  call Cursor__mv_d()
  call Cursor__ins_ynk()
endfunc

" 
" fnc tst
" 

" tst escape

"nnoremap T :call Tst_esacpe()<cr>

func! Tst_esacpe() abort

  let l:str = '().$a'
  echo l:str

  let l:str = escape(l:str, l:str)
  echo l:str
endfunc

" tst escape shell

"nnoremap T :call Tst_esacpe_shell() <cr>

func! Tst_esacpe_shell() abort

  let l:str = '().$a \ / | & b c '
  echo l:str

  let l:str = shellescape(l:str)
  echo l:str
endfunc

" tst arg f

"nnoremap T :TstArgF 
"nnoremap T :TstArgF aa().a \/|&bbb 'aa().a \/|&bbb'

command! -bang -nargs=* TstArgF call Tst_arg_f(<f-args>)

func! Tst_arg_f(arg01, arg02, arg03, arg04) range abort

  echo a:arg01
  echo a:arg02
  echo a:arg03
  echo a:arg04
endfunc

" tst arg q

"nnoremap T :TstArgQ aa "bbb ccc" '().\a bbb""' "().\a bbb''"

command! -bang -nargs=* TstArgQ call Tst_arg_q(<q-args>)

func! Tst_arg_q(arg01) range abort

  echo a:arg01
  " echo a:arg01 . 'end'
endfunc

" tst is_directory ~

"nnoremap T :call Tst_is_directory()<cr>

func! Tst_is_directory() range abort

  " let l:path = "~/wrk"        " ng
  let l:path = $HOME . "/wrk" " ok
  if isdirectory(l:path)
    echo "true"
  else
    echo "false"
  endif
endfunc

" tst slctd mode

func! Tst_slctd_mode() range abort

  let l:val = Is_slctd_mode__box()
  echo l:val
endfunc

" tst slctd __ rpl sys cmd mb

"vnoremap T :TstSlctdRplSysCmdMb <cr>

command! -range=% -nargs=* TstSlctdRplSysCmdMb <line1>,<line2>call Tst_slctd_rpl_sys_cmd_mb()

" dev ? anchor
func! Tst_slctd_rpl_sys_cmd_mb() range abort

  let l:pth = '~/wrk/prj-pri/dotfiles/doc/tst/tst-in.md'
  " let l:sys_cmd = 'cat ' . l:pth . ' | column -t | cat'
  let l:sys_cmd = 'cat ' . l:pth . ' | column -t'
  " let l:sys_cmd = 'cat ' . l:pth

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" tst fnc call fr lua

func! Tst_fnc_call_fr_lua() range abort

  echo 'abcde'
endfunc

" tst regex

func! Tst_regex() range abort

  let l:str = '[]'

  " if l:str =~ '\w'
  if match(l:str, '\w') != -1

    echo 'true'
  else
    echo 'false'
  endif
endfunc

" fnc tst end


" 
" init.lua
" 
if has('nvim')
  " echo 'nvim'
  lua require('init')
endif


" 
" ref normal
" 

" ref normal
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


