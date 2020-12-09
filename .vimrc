"
" Configuration file for vim
"
set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing
set incsearch

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

autocmd QuickFixCmdPost vimgrep,grep tab cwindow
packadd Cfilter

autocmd ColorScheme * hi LineNr      ctermfg=141
autocmd ColorScheme * hi Visual                         ctermbg=magenta cterm=none 
autocmd ColorScheme * hi Search      ctermfg=yellow     ctermbg=cyan    cterm=bold 
autocmd ColorScheme * hi IncSearch   ctermfg=magenta    ctermbg=cyan    cterm=bold 
autocmd ColorScheme * hi MatchParen  ctermfg=magenta    ctermbg=none

autocmd ColorScheme * hi NonText     ctermfg=25         ctermbg=None 
autocmd ColorScheme * hi SpecialKey  ctermfg=25         ctermbg=None 

autocmd ColorScheme * hi TabLineFill                    ctermbg=27
autocmd ColorScheme * hi TabLine     ctermfg=lightblue  ctermbg=27
autocmd ColorScheme * hi TabLineSel  ctermfg=182        ctermbg=blue

autocmd ColorScheme * hi StatusLine  ctermfg=lightblue  ctermbg=33

autocmd ColorScheme * hi Pmenu       ctermfg=lightgreen ctermbg=blue
autocmd ColorScheme * hi PmenuSel    ctermfg=cyan       ctermbg=magenta cterm=bold

colorscheme koehler " evening

set hlsearch
"hi search                 ctermbg=lightyellow
"hi matchparen ctermfg=red ctermbg=6

set number
set list
set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
"hi nontext    ctermbg=none ctermfg=59 guibg=none guifg=none
set cursorline

set autoindent
"set expandtab " indent tab を space にする
set tabstop=4    " 2
set shiftwidth=4 " 2
set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " 改行にカーソルをおける
set virtualedit+=block  " 矩形選択で行末以降にカーソル移動可
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""

set clipboard+=unnamed
syntax on

set statusline=%F  " file name 表示
set statusline+=%m " 変更あり表示
set statusline+=%= " 以降を右寄せ
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L]            " 現在行数/全行数
set laststatus=2   " 0: off  1: on 2 win  2: on

set completeopt=menuone,noinsert

" leader key
let mapleader = "\<Space>"

"
" mode normal ( command )
"

 " quit
nnoremap <C-q>     :q<Cr>
nnoremap <leader>q :q<Cr>
nnoremap <leader>: :q<Cr>
"nnoremap <C-v> :q<Cr>

" save
nnoremap ; :w<Cr>
nnoremap <leader><space> :w<Cr>

"
" cursor mv
"
" cursor mv dir
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <C-k> 10k
nnoremap <C-j> 10j

" cursor mv line in
"nnoremap ;     0
"nnoremap a     0
nnoremap <C-a> 0
nnoremap <leader>a 0
nnoremap e     $l
"nnoremap <C-e> $l

" cursor mv char
nnoremap <C-o> h
nnoremap h     h
"nnoremap o     h

" cursor mv word
nnoremap f       w
"nnoremap <space> w
"nnoremap <C-f> w
nnoremap o     b
"nnoremap <C-o> b

" cursor mv file
"nnoremap g     gg
nnoremap G     G$l
"nnoremap <C-g> G$

" cursor mv 
nnoremap <leader>k %

" scroll
nnoremap <C-e> 10<C-e>

"
" edit
"

" ins
"nnoremap <leader>a A
nnoremap a         A
"nnoremap ;         A
"nnoremap <leader>i A
"nnoremap <C-l> A
"nnoremap a A

" ins space
"nnoremap <space> i<Space><Esc>l

" ins cr
nnoremap <c-m>     i<cr><Esc>
nnoremap <leader>m i<cr><Esc>
nnoremap m i<cr><Esc>
"nnoremap ; i<cr><Esc>

" ins line
nnoremap <c-o>     O<Esc>
nnoremap <leader>o O<Esc>
nnoremap O         O<Esc>
"nnoremap m         O<Esc>
"nnoremap ;     O<Esc>
"nnoremap o         O<Esc>
"nnoremap h     O<Esc>
"nnoremap <C-o> O<Esc>

" del char
nnoremap s     "ax
nnoremap <C-d> x
nnoremap <C-h> hx
nnoremap <BS>  hx
"nnoremap <C-s> hx

" del line
nnoremap d dd
"nnoremap dd "add
nnoremap cc cc<Esc>
nnoremap <C-c> D

" del word back
nnoremap <C-w> hvbd

" del word forward
nnoremap <C-s> dw

" select all
nnoremap @ ggVG
"nnoremap <leader>a ggVG


" select word
nnoremap w viw
nnoremap W V

" select box
nnoremap v <C-v>

" yank
nnoremap c yy

" paste
nnoremap p P
"nnoremap v P

" undo redo
nnoremap u         u
nnoremap <c-u>     <C-r>
"nnoremap <leader>u <C-r>

" repeat
nnoremap r .

" inc , dec
nnoremap + <C-a>
nnoremap - <C-x>

" indent
nnoremap > >>
nnoremap < <<

"
" search
"
"nnoremap / /<C-r><C-w>
nnoremap <C-n> N
"nnoremap * Viw"by/<C-r>"

" grep
nnoremap :g :grep! "" **.lua **.script<Home><S-Right><Right><Right>

"
" tab
"
" tag jump
"nnoremap t <C-w>gF
"nnoremap <C-q> <C-w>gF
"nnoremap <C-e> <C-w>gF

" tab
nnoremap <Tab>   gt
nnoremap <S-Tab> gT
nnoremap <S-Right> :tabm+1<Cr>
nnoremap <S-Left>  :tabm-1<Cr>

"
" plugin
"

" fzf
nnoremap :f        :Files
nnoremap <leader>f :Files<cr>
nnoremap :r        :Rg
nnoremap <leader>r :Rg<cr>
nnoremap :l        :Lines
nnoremap <leader>l :Lines<cr>

"
" esc
"
nnoremap <space> <Esc>
"nnoremap @ <Esc>
"nnoremap ; <Esc>
"nnoremap a <Esc>
nnoremap b <Esc>
"nnoremap h <Esc>
"nnoremap m <Esc>
nnoremap q <Esc>
nnoremap t <Esc>
nnoremap z <Esc>
"nnoremap <c-a> <Esc>
nnoremap <c-b> <Esc>
"nnoremap <c-c> <Esc>
"nnoremap <c-e> <Esc>
nnoremap <c-f> <Esc>
nnoremap <c-g> <Esc>
"nnoremap <c-h> <Esc>
"nnoremap <c-l> <Esc>
"nnoremap <c-m> <Esc>
"nnoremap <c-n> <Esc>
nnoremap <C-p> <Esc>
"nnoremap <C-q> <Esc>
nnoremap <c-r> <Esc>
nnoremap <c-t> <Esc>
nnoremap <c-v> <Esc>
nnoremap <c-x> <Esc>
nnoremap <c-y> <Esc>
nnoremap <c-z> <Esc>
nnoremap <c-@> <Esc>
"nnoremap <C-[> <Esc>
nnoremap <C-]> <Esc>


"
" mode insert
"

" quit  
inoremap <C-f> <Esc>
"inoremap <C-v> <Esc>
"inoremap <C-s> <Esc>

" cursor mv line in
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" cursor mv char
inoremap <C-l> <C-o>l
inoremap <C-o> <C-o>h

" cursor mv word
"inoremap <C-f> <C-o>w
inoremap <C-q> <C-o>b

" cursor mv line > input complete
"inoremap <C-p> <C-o>k
"inoremap <C-n> <C-o>j

" del line
inoremap <C-k> <C-o>D
inoremap <C-c> <C-o>D

" del char forward
inoremap <C-d> <C-o>x
" del char back
inoremap <C-h> <C-h>

" del word forword
inoremap <C-s> <C-o>dw

" line new
inoremap <C-j> <Cr>

" tab
inoremap <Tab> <C-v><Tab>

" input complete
inoremap <C-m> <C-n>
inoremap <C-v> <C-n>
inoremap <expr> <C-n> pumvisible() ? "<Down>" : "<C-o>j"
inoremap <expr> <C-p> pumvisible() ? "<Up>"   : "<C-o>k"


"
" mode visual
"

" mode ch line
vnoremap w V

" mode ch box
vnoremap v     <C-v>
"vnoremap <C-w> <C-v>

" ins
"vnoremap i I
vnoremap <expr> i mode() == "<C-v>" ? "I" : "c"
vnoremap a A

" cursor mv
vnoremap a     0
"vnoremap <C-a> 0
vnoremap e     $h
"vnoremap <C-e> $h

" cursor mv char
vnoremap h h
vnoremap l l
"vnoremap <C-l> l

" cursor mv word
vnoremap f     E
"vnoremap <C-f> E
vnoremap o     b
"vnoremap <c-o> b
"vnoremap q     b
"vnoremap <C-q> b
"vnoremap <C-q> gE

" cursor mv line
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap G G$
"vnoremap <C-g> G$

" del
"vnoremap s "ax
vnoremap s x
vnoremap x "ax

" yank
vnoremap c y

" paste
vnoremap p "adhp
"vnoremap v "adhp

" increment
"vnoremap + <C-a>
vnoremap + g<C-a>

" indent
vnoremap > >gv
vnoremap < <gv
vnoremap :t :'<,'>!expand -2

"
" esc
"
vnoremap <C-c> <C-c>
vnoremap <C-f> <C-c>
vnoremap <C-o> <C-c>
vnoremap <C-q> <C-c>
vnoremap <C-v> <C-c>
vnoremap @ <C-c><C-o><C-o>




" add
" vnoremap i" di""<C-c>hp
" vnoremap i' di''<C-c>hp
" vnoremap i( di()<C-c>hp
" vnoremap i{ di{}<C-c>hp
" vnoremap i< di<><C-c>hp


" 
" mode ex
" 
" quit
cnoremap <C-q> <C-c>
"cnoremap <C-v> <C-c>

" cursor mv line in
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" cursor mv char
"cnoremap <C-o> <Left>
cnoremap <C-b> <Left>
cnoremap <C-l> <Right>

" cursor mv word
cnoremap <C-o> <S-Left>
cnoremap <C-f> <S-Right>

" del char
cnoremap <C-h> <bs>
cnoremap <C-d> <del>

" del word
cnoremap <C-s> <S-Right><C-w>

" del line in
cnoremap <C-c> <C-u>

"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>

" ab t tabnew

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi LineNr ctermfg=green
  autocmd InsertLeave * hi LineNr ctermfg=141
augroup END 


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end


"
" plugin
"
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

