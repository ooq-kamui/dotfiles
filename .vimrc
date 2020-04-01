
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
" mode command
"

" save
nnoremap <C-s> :w<Cr>

" tag jump
"nnoremap t <C-w>gf
nnoremap t <C-w>gF

" insert
"nnoremap k i
nnoremap a A
nnoremap o O<Esc>
nnoremap <Space> i<Space><Esc>l
"nnoremap <C-j> i<Cr><Esc>
"nnoremap <Cr> i<Cr><Esc>

" yank
"nnoremap yy "ayy

" paste
"nnoremap p "aP
nnoremap p P
"nnoremap P $p

" del
nnoremap s "ax
"nnoremap s x
nnoremap <C-d> x
nnoremap <BS> x
nnoremap <C-h> hx
nnoremap cc cc<Esc>
nnoremap <C-k> D
"nnoremap dd "add
"nnoremap dd dd

" char replace
nnoremap <C-r> r

" redo
nnoremap r <C-r>

" select
nnoremap vv V
nnoremap viw Viw
nnoremap <C-@> ggvG

" cursor mv line
nnoremap <C-p> 10k
"nnoremap <C-i> 10k
nnoremap <C-m> 10j
nnoremap <C-u> zt3<C-y>
nnoremap <C-g> G
"nnoremap i k

" cursor mv word
nnoremap <C-a> 0
"nnoremap -h> 0
nnoremap <C-e> $
"nnoremap <C-h> b
nnoremap <C-l> w
nnoremap f w
nnoremap <C-f> b
"nnoremap <C-e> %

" select word
nnoremap w Viw
"nnoremap <C-f> Viw
"nnoremap f wViw

" tab
"nnoremap q gt
"nnoremap <C-q> gT
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" increment
nnoremap + <C-a>
nnoremap - <C-x>

" grep
nnoremap :g :grep!  **.lua **.script<Home>


"
" mode insert
"
inoremap <C-f> <C-c>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$


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
vnoremap <C-f> <C-c>
vnoremap f e
vnoremap <C-g> G
"vnoremap p "ap
vnoremap p "adhp

" del
"vnoremap s "ax
vnoremap s x
"vnoremap x "ax
"vnoremap d "ad

" yank
"vnoremap w "ay
vnoremap w y
vnoremap <C-c> y

" increment
vnoremap + <C-a>


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


