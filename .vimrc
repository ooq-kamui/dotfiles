
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

autocmd QuickFixCmdPost vimgrep,grep tab cwindow
packadd Cfilter

autocmd ColorScheme * highlight LineNr ctermfg=141
autocmd ColorScheme * highlight Visual cterm=none ctermbg=magenta
autocmd ColorScheme * highlight Search cterm=bold ctermfg=Yellow ctermbg=Cyan

autocmd ColorScheme * highlight NonText    ctermbg=None ctermfg=59
autocmd ColorScheme * highlight SpecialKey ctermbg=None ctermfg=59

colorscheme koehler
"colorscheme evening

set hlsearch
"hi Search ctermbg=lightyellow
"hi MatchParen ctermfg=red ctermbg=6

set number
set list
set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
set cursorline

set autoindent
"set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore
set scrolloff=5

set wildmode=list:longest

set clipboard+=unnamed
syntax on

"
" mode command
"

" save
nnoremap <C-c> <C-c>:w<Cr>

" tag jump
"nnoremap t <C-w>gf
nnoremap t <C-w>gF

" insert
nnoremap a A
nnoremap o O<Esc>
nnoremap <Space> i<Space><Esc>l
"nnoremap <C-j> i<Cr><Esc>
"nnoremap <Cr> i<Cr><Esc>

" paste
nnoremap p P
"nnoremap P $p

" del
nnoremap s x
nnoremap <C-d> x
nnoremap <BS> x
nnoremap <C-h> hx
"nnoremap x "_x
nnoremap cc cc<Esc>
nnoremap <C-k> D

" char replace
nnoremap <C-r> r

" redo
nnoremap r <C-r>

" select
nnoremap vv V
nnoremap viw Viw
nnoremap <C-@> ggvG

" cursor mv line
"nnoremap <C-k> 10<C-y>
"nnoremap <C-k> 10k
"nnoremap <C-u> 10k
"nnoremap <C-j> 10k
nnoremap <C-p> 10k

"nnoremap <C-j> 10<C-e>
nnoremap <C-j> 10j
"nnoremap <C-n> 10j

"nnoremap <C-n> zt8<C-y>
"nnoremap <C-j> zt3<C-y>
nnoremap <C-u> zt3<C-y>

nnoremap <C-g> G

" cursor mv word
nnoremap <C-a> 0
"nnoremap -h> 0
nnoremap <C-e> $
"nnoremap <C-h> b
nnoremap <C-l> w
nnoremap <C-f> b
nnoremap f w
"nnoremap <C-e> %

" select word
nnoremap w Viw
"nnoremap <C-f> Viw
"nnoremap f wViw

" tab
nnoremap q gt
nnoremap <C-q> gT

" increment
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap :g :grep!  **.lua **.script<Home>


"
" mode visual
"
vnoremap i I
vnoremap a A

"vnoremap <C-k> <C-u>
"vnoremap <C-j> <C-d>

vnoremap <C-a> 0
vnoremap <C-e> $
vnoremap <C-h> b
vnoremap <C-l> e
vnoremap w <C-c>
vnoremap <C-f> <C-c>
vnoremap f e
vnoremap <C-g> G
vnoremap p "0p

" del
vnoremap s x

" yank copy
vnoremap <C-c> y
vnoremap w y

" 
" mode insert
" 
inoremap <C-c> <C-c>:w<Cr>l
inoremap <C-f> <C-c>:w<Cr>l
"inoremap <C-j> <C-c>:w<Cr>l
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" 
" mode ex  -  command line ?
" 
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-l> <S-Right>
"cnoremap <C-f> <Right>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>


augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


