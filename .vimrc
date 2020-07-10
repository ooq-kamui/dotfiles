
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set incsearch

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
"autocmd ColorScheme * highlight NonText    ctermbg=None ctermfg=99
"autocmd ColorScheme * highlight SpecialKey ctermbg=None ctermfg=99
autocmd ColorScheme * highlight NonText    ctermbg=None ctermfg=25
autocmd ColorScheme * highlight SpecialKey ctermbg=None ctermfg=25

colorscheme koehler
"colorscheme evening

set hlsearch
"hi Search ctermbg=lightyellow
"hi MatchParen ctermfg=red ctermbg=6

set number
set list
set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
"hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None
set cursorline

set autoindent
"set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore "改行にカーソルをおける
set virtualedit+=block  "矩形選択で行末以降にカーソル移動可
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30

set clipboard+=unnamed
syntax on

set statusline=%F  " file name 表示
set statusline+=%m " 変更あり表示
set statusline+=%= " 以降を右寄せ
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L]            " 現在行数/全行数
set laststatus=2   " 0: off  1: on 2 win  2: on


"
" mode normal ( command )
"

" quit
nnoremap <C-q> :q<Cr>

" save
nnoremap <C-w> :w<Cr>

" tag jump
"nnoremap t <C-w>gf
nnoremap t <C-w>gF

" insert
"nnoremap k i
nnoremap e i
nnoremap a A
nnoremap o O<Esc>
nnoremap <Space> i<Space><Esc>l
"nnoremap <C-j> i<Cr><Esc>
"nnoremap <Cr> i<Cr><Esc>

" yank
nnoremap c yy

" paste
nnoremap p P
nnoremap m P
nnoremap v P
"nnoremap p "aP
"nnoremap P $p

" del
nnoremap s "ax
nnoremap <C-d> x
nnoremap <BS> x
nnoremap <C-h> hx
nnoremap d dd
nnoremap cc cc<Esc>
"nnoremap <C-k> D
"nnoremap dd "add

" char replace
nnoremap <C-r> r

" redo
nnoremap r <C-r>

" select ( visual )
nnoremap <C-@> ggvG

" select word
nnoremap w Viw
"nnoremap <C-w> v
nnoremap W V


" cursor mv
"nnoremap i k

" cursor mv line
nnoremap <C-k> 10k
"nnoremap <C-i> 10k
nnoremap <C-j> 10j
"nnoremap <C-u> zt3<C-y>
nnoremap <C-l> zt3<C-y>
"nnoremap <C-g> G

" cursor mv word
nnoremap <C-a> 0
nnoremap <C-e> $l
"nnoremap <C-l> w
nnoremap <C-f> l
"nnoremap <C-b> h
nnoremap <C-o> h
"nnoremap <C-f> b
"nnoremap <C-e> %


" search
"nnoremap <C-n> N
"nnoremap * Viw"by/<C-r>"

" tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" increment
nnoremap + <C-a>
nnoremap - <C-x>

" grep
nnoremap :g :grep! "" **.lua **.script<Home><S-Right><Right><Right>
"nnoremap f :grep! "" **.lua **.script<Home><S-Right><Right><Right>


"
" mode insert
"
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-k> <C-o>D
inoremap <C-d> <C-o>x
inoremap <C-f> <C-o>l
"inoremap <C-b> <C-o>h
inoremap <C-o> <C-o>h
inoremap <C-l> <C-o>w

inoremap <C-p> <C-o>k
inoremap <C-n> <C-o>j

"inoremap <C-s> <C-o>:w<Cr>

inoremap <C-i> <C-n>
inoremap <C-b> <C-p>
inoremap <C-v> <C-v><Tab>

inoremap <C-q> <Esc>
inoremap <C-c> <Esc>


"
" mode visual
"
vnoremap <C-q> <C-c>

vnoremap i I
vnoremap a A

vnoremap <C-a> 0
vnoremap <C-e> $
vnoremap <C-h> b
vnoremap <C-l> e
"vnoremap f e
"vnoremap <C-g> G
"vnoremap p "ap
vnoremap p "adhp

vnoremap <C-j> 10j
vnoremap <C-k> 10k

"vnoremap v V
vnoremap w V
vnoremap <C-w> <C-v>

" del
"vnoremap s "ax
vnoremap s x
"vnoremap x "ax
"vnoremap d "ad

" yank
"vnoremap w "ay
vnoremap c y

" increment
"vnoremap + <C-a>
vnoremap + g<C-a>

"vnoremap q <C-c>
"vnoremap <C-q> <C-c>


" 
" mode ex  -  command line ?
" 
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"cnoremap <C-b> <Left>
cnoremap <C-o> <Left>
cnoremap <C-f> <Right>
cnoremap <C-l> <S-Right>
cnoremap <C-d> <Del>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
cnoremap <C-q> <C-c>


augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi LineNr ctermfg=green
  autocmd InsertLeave * hi LineNr ctermfg=141
augroup END 








