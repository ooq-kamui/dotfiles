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

autocmd ColorScheme * hi LineNr       ctermfg=141                        cterm=none
autocmd ColorScheme * hi CursorLineNr ctermfg=121

autocmd ColorScheme * hi Visual                          ctermbg=magenta cterm=none
autocmd ColorScheme * hi VisualNOS                       ctermbg=magenta cterm=none
autocmd ColorScheme * hi Search       ctermfg=yellow     ctermbg=cyan    cterm=bold
autocmd ColorScheme * hi IncSearch    ctermfg=magenta    ctermbg=cyan    cterm=bold
autocmd ColorScheme * hi MatchParen   ctermfg=magenta    ctermbg=none

autocmd ColorScheme * hi TabLineFill                     ctermbg=27
autocmd ColorScheme * hi TabLine      ctermfg=lightblue  ctermbg=27
autocmd ColorScheme * hi TabLineSel   ctermfg=182        ctermbg=blue

autocmd ColorScheme * hi StatusLine   ctermfg=lightblue  ctermbg=33      cterm=none
autocmd ColorScheme * hi EndOfBuffer  ctermfg=cyan                       cterm=none

autocmd ColorScheme * hi Pmenu        ctermfg=lightgreen ctermbg=blue
autocmd ColorScheme * hi PmenuSel     ctermfg=cyan       ctermbg=magenta cterm=bold

autocmd ColorScheme * hi ErrorMsg     ctermfg=magenta    ctermbg=none    cterm=none
autocmd ColorScheme * hi WarningMsg   ctermfg=magenta    ctermbg=none    cterm=none

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
autocmd ColorScheme * hi NonText      ctermfg=25         ctermbg=none    cterm=none
autocmd ColorScheme * hi SpecialKey   ctermfg=25         ctermbg=none    cterm=none

autocmd ColorScheme * hi netrwDir      ctermfg=lightgreen
autocmd ColorScheme * hi netrwTreeBar  ctermfg=lightgreen
autocmd ColorScheme * hi netrwClassify ctermfg=lightgreen

autocmd BufNewFile,BufRead *.script     set filetype=lua
autocmd BufNewFile,BufRead *.gui_script set filetype=lua

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi LineNr ctermfg=lightgreen
  autocmd InsertLeave * hi LineNr ctermfg=141
augroup END 


set hlsearch
set number
set list
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
set showtabline=2

set clipboard+=unnamed
syntax on

set statusline=%F  " file name 表示
set statusline+=%m " 変更あり表示
set statusline+=%= " 以降を右寄せ
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L]            " 現在行数/全行数
"set statusline^=%{coc#status()}        " coc.vim
set laststatus=2   " 0: off  1: on 2 win  2: on

set completeopt=menuone,noinsert

" auto comment off
" set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o

" leader key
let mapleader = "\<Space>"

" ctags
filetype on
set tags=./.tags;

colorscheme koehler " evening


"
" mode normal
"

 " quit
nnoremap q  :q<Cr>
nnoremap w  :q<Cr>
nnoremap :q :q!

" save
nnoremap a  :w<Cr>
"nnoremap ww :w<Cr>
"nnoremap e :w<Cr>

"
" cursor mv
"
" cursor mv dir
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <c-k> 10k
nnoremap <c-j> 10j

" cursor mv line in
nnoremap <expr> ; col(".") == col("$") ? "0" : "$l"

" cursor mv char
nnoremap l     l
nnoremap <c-o> h

" cursor mv word
nnoremap f     w
nnoremap <c-l> el
nnoremap o     b

" cursor mv file
nnoremap gg    gg
nnoremap gn    G$l
"nnoremap <expr> gg line(".") == 1 ? "G$l" : "gg"
"nnoremap <c-g> G$l

" cursor mv brackets
nnoremap 0 %

" cursor mv jump list
nnoremap b     <c-o>
nnoremap <c-b> <c-i>

" scroll
nnoremap go    10<c-e>
nnoremap <c-e> 10<c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>
nnoremap K      10<c-y>
nnoremap J      10<c-e>

"
" edit
"

" ins
nnoremap e i
"nnoremap a i

" ins line
nnoremap u O<Esc>
"nnoremap <c-o> O<Esc>

" ins cr
nnoremap m i<cr><Esc>

" del char
nnoremap s    "ax
"nnoremap h    "ax
nnoremap x    x
nnoremap <BS> h"ax

" del line
nnoremap d  dd

" del line forward
nnoremap cc D

" del cr
nnoremap <c-m> J

" del word back
"nnoremap <c-w> hvbd

" del word forward
nnoremap <expr> <c-d> col(".") == col("$") ? "<esc>" : "dw"
nnoremap <expr> <c-s> col(".") == col("$") ? "<esc>" : "de"
"nnoremap <c-s> dw

" select all
nnoremap A ggVG

" select word
nnoremap i viw
"nnoremap i viwo

" select box
nnoremap v <c-v>

" yank
nnoremap c yy

" paste
nnoremap p P

" undo, redo
nnoremap h     u
nnoremap <c-h> <c-r>

" repeat
nnoremap . .

" inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap > >>
nnoremap < <<

"
" search
"
nnoremap n     n
nnoremap <c-n> N
nnoremap /     /
nnoremap r     *N
"nnoremap w     *N
"nnoremap <c-w> *N

" grep
"nnoremap :g :grep! "" **.lua **.script<Home><S-Right><Right><Right>

" open file session last
"nnoremap <c-p> `0

" tag jump
nnoremap t <c-w>gF

"
" tab
"
nnoremap <Tab>   gt
nnoremap <S-Tab> gT
nnoremap <S-Right> :tabm+1<Cr>
nnoremap <S-Left>  :tabm-1<Cr>

" ctags
nnoremap <c-]> g<c-]>
"nnoremap <c-]> <C-w>g<C-]><C-w>T
"nnoremap <c-]> <C-w><C-]><C-w>T

" buffers
nnoremap :b :buffers

"
" esc
"
nnoremap <space> <esc>
nnoremap <bs>    <esc>

nnoremap , <esc>
"nnoremap . <esc>
nnoremap * <esc>
nnoremap _ <esc>
nnoremap ~ <esc>
nnoremap @ <esc>
"nnoremap ; <esc>
nnoremap <c-@> <esc>
"nnoremap <c-:> <esc> " cannot set
"nnoremap <c-;> <esc> " cannot set
"nnoremap <c-,> <esc>
"nnoremap <c-[> <esc>
"nnoremap <c-]> <esc>

"nnoremap 0 <esc>
"nnoremap a <esc>
"nnoremap b <esc>
"nnoremap d <esc>
"nnoremap e <esc>
nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap q <esc>
"nnoremap r <esc>
"nnoremap s <esc>
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
"nnoremap x <esc>
nnoremap y <esc>
nnoremap z <esc>

nnoremap <c-a> <esc>
"nnoremap <c-b> <esc>
"nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
nnoremap <c-f> <esc>
"nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
nnoremap <c-p> <esc>
nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
"nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
nnoremap <c-w> <esc>
nnoremap <c-x> <esc>
nnoremap <c-y> <esc>
nnoremap <c-z> <esc>

"
" mode visual
"

" mode ch line , ins
vnoremap <expr> i mode() == "<c-v>" ? "I" : "V"
"vnoremap i V
"vnoremap w V

" mode ch box
vnoremap v <c-v>

" cursor mv
"vnoremap <expr> ; col(".") == col("$") ? "0" : "$"

" cursor mv char
vnoremap l l

" cursor mv word
vnoremap f e
vnoremap o b
vnoremap <c-l> el

" cursor mv in selected
vnoremap ; o
"vnoremap e o
"vnoremap <c-o> o

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv file
vnoremap gg gg
vnoremap gn G$l
"vnoremap <expr> gg    line(".") == 1 ? "G$l" : "gg"
"vnoremap <expr> <c-p> line(".") == 1 ? "G$l" : "gg"

" ins
"vnoremap a I
"vnoremap <expr> e mode() == "<c-v>" ? "c" : "l<c-c>i"
"vnoremap <expr> a mode() == "<c-v>" ? col(".") == col("$") ? "I" : "I" : "l<c-c>i"
"vnoremap <expr> a mode() == "<c-v>" ? col(".") == col("$") ? "A" : "I" : "<c-c>i"

" cut & ins
vnoremap e c
"vnoremap <expr> s mode() == "<c-v>" ? "c" : mode() == "V" ? "x" : "x"
"vnoremap <expr> h mode() == "<c-v>" ? "c" : "x"

" ins $
vnoremap <expr> $ mode() == "<c-v>" ? "$A" : "$"

" del
vnoremap s x
vnoremap x x
vnoremap d d

" yank
vnoremap c y

" paste
vnoremap p "adhp

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" indent
vnoremap > >gv
vnoremap < <gv
vnoremap :t :'<,'>!expand -2

" upper / lower
vnoremap u ~viwo

"
" search
"
vnoremap n "ay/<c-r>a<cr>
vnoremap / "ay/<c-r>a
vnoremap r "ay/<c-r>a<cr>N
"vnoremap w "ay/<c-r>a<cr>N
"vnoremap w *N<c-c>

"
" esc
"
vnoremap <space> <nop>
vnoremap @ <c-c>
"vnoremap * <c-c>
"vnoremap a <c-c>
vnoremap b <c-c>
"vnoremap d <c-c>
"vnoremap e <c-c>
"vnoremap h <c-c>
"vnoremap i <c-c>
"vnoremap o <c-c>
vnoremap q <c-c>
"vnoremap r <c-c>
"vnoremap s <c-c>
"vnoremap u <c-c>
vnoremap w <c-c>
"vnoremap x <c-c>
vnoremap y <c-c>
vnoremap <c-a> <c-c>
vnoremap <c-f> <c-c>
"vnoremap <c-l> <c-c>
vnoremap <c-n> <c-c>
vnoremap <c-o> <c-c>
"vnoremap <c-p> <c-c>
vnoremap <c-q> <c-c>
vnoremap <c-w> <c-c>
vnoremap <c-x> <c-c>


"
" mode insert
"

" cursor mv line in
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <expr> <c-o> pumvisible() ? "<c-y>" : "<c-o>h"
"inoremap <c-o> <c-o>h

" cursor mv word
"inoremap <c-f> <c-o>w
"inoremap <c-q> <c-o>b

" del line
"inoremap <c-k> <c-o>D
"inoremap <c-c> <c-o>D

" del char forward
inoremap <c-d> <c-o>x
inoremap <c-s> <c-o>x
" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-o>dw"
"inoremap <expr> <c-k> pumvisible() ? "<up>"   : "<c-o>dw"

" line new
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<cr>"
"inoremap <expr> <c-j> pumvisible() ? "<down>" : "<cr>"

" tab
inoremap <tab> <c-v><Tab>

" input complete
inoremap <c-m> <c-n>
"inoremap <c-j> <c-n>
"inoremap <c-v> <c-n>
inoremap <expr> <c-n> pumvisible() ? "<down>" : "<c-o>j"
inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<c-o>k"

"inoremap ( ()<c-o>h
"inoremap < <><c-o>h
"inoremap [ []<c-o>h
inoremap { {}<c-o>h
inoremap <expr> " col(".") == 1 ? "\"" : "\"\"<c-o>h"
inoremap ' ''<c-o>h

" quit, esc
"inoremap <c-;> <esc>
inoremap <esc> <esc>
inoremap <c-c> <esc>
inoremap <c-f> <esc>
inoremap <c-q> <esc>


" 
" mode ex
" 
" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

" cursor mv char
cnoremap <c-b> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <S-Left>
cnoremap <c-f> <S-Right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word
cnoremap <c-k> <S-Right><c-w>

" del line in
cnoremap <c-c> <c-u>

"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>


augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end


"
" netrw
"

" launch
nnoremap :e        :Tex .<cr>
nnoremap <leader>f :Tex .<cr>
nnoremap <leader>l :Tex .<cr>

let g:netrw_liststyle    = 3 " view file tree
let g:netrw_browse_split = 3 " file open tab

func! NetrwKeyBind_opn (islocal) abort
  return "normal  \<cr>"
endfunc
func! NetrwKeyBind_mv_word_back (islocal) abort
  return "normal! b"
endfunc

let g:Netrw_UserMaps = [
\ ['<c-o>'    , 'NetrwKeyBind_opn'],
\ ['<leader>o', 'NetrwKeyBind_opn'],
\ ['<c-l>'    , 'NetrwKeyBind_opn'],
\ ['o'        , 'NetrwKeyBind_mv_word_back'],
\]
"\ ['o',         'NetrwMapping_cr'],

" 
" plugin
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = { 'ctrl-o': 'tab drop' }

"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" files
nnoremap <leader>r :Files <cr>
vnoremap <leader>r :Files <cr>
nnoremap <leader>u :Files <cr>
vnoremap <leader>u :Files <cr>
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" lines
nnoremap <leader>i :BLines<cr>
vnoremap <leader>i "ay:BLines <c-r>a<cr>
command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(<q-args>,{'options': ['--no-sort']}, <bang>1)

" rg
"
" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )
nnoremap <leader>o :Rg <cr>
vnoremap <leader>o "ay:Rg <c-r>a<cr>
"nnoremap <leader>p :Rg <c-r><c-w><cr>

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg 
\     --line-number --smart-case --no-multiline --no-heading --color=always 
\     -- '.shellescape(<q-args>),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

" ctags
nnoremap <leader>j :Tags <c-r><c-w><cr>
vnoremap <leader>j "ay:Tags <c-r>a<cr>
"nnoremap <leader>c :Tags<cr>
"vnoremap <leader>c "ay:Tags <c-r>a<cr>

command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)

let g:fzf_colors = {
\   'hl':      ['fg', 'Statement'],
\   'hl+':     ['fg', 'Statement'],
\ }
"\   'bg+':     ['bg', 'Normal'],


