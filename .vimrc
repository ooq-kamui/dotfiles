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
autocmd ColorScheme * hi CursorLineNr ctermfg=green

autocmd ColorScheme * hi Visual                          ctermbg=magenta cterm=none
autocmd ColorScheme * hi Search       ctermfg=yellow     ctermbg=cyan    cterm=bold
autocmd ColorScheme * hi IncSearch    ctermfg=magenta    ctermbg=cyan    cterm=bold
autocmd ColorScheme * hi MatchParen   ctermfg=magenta    ctermbg=none

autocmd ColorScheme * hi TabLineFill                     ctermbg=27
autocmd ColorScheme * hi TabLine      ctermfg=lightblue  ctermbg=27
autocmd ColorScheme * hi TabLineSel   ctermfg=182        ctermbg=blue

autocmd ColorScheme * hi StatusLine   ctermfg=lightblue  ctermbg=33

autocmd ColorScheme * hi Pmenu        ctermfg=lightgreen ctermbg=blue
autocmd ColorScheme * hi PmenuSel     ctermfg=cyan       ctermbg=magenta cterm=bold

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
"hi nontext    ctermbg=none ctermfg=59 guibg=none guifg=none
autocmd ColorScheme * hi NonText      ctermfg=25         ctermbg=None
autocmd ColorScheme * hi SpecialKey   ctermfg=25         ctermbg=None

autocmd ColorScheme * hi WarningMsg   ctermfg=magenta    ctermbg=None
autocmd ColorScheme * hi ErrorMsg     ctermfg=magenta    ctermbg=None


set hlsearch
"hi search                 ctermbg=lightyellow
"hi matchparen ctermfg=red ctermbg=6

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
" mode normal ( command )
"

 " quit
nnoremap q     :q<Cr>
"nnoremap <c-q>     :q<Cr>
"nnoremap <leader>q :q<Cr>
"nnoremap <leader>: :q<Cr>
"nnoremap <c-v> :q<Cr>
nnoremap :q  :q!

" save
nnoremap ;     :w<Cr>
nnoremap <c-s> :w<Cr>
"nnoremap <leader><space> :w<Cr>

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
nnoremap <expr> a col(".") == col("$") ? "0" : "$l"
"nnoremap <expr> e col(".") == col("$") ? "0" : "$l"
"nnoremap e     $l

" cursor mv char
nnoremap l l
"nnoremap <c-o> h
"nnoremap h     h

" cursor mv word
nnoremap f     w
nnoremap <c-l> el
"nnoremap <c-f> el
nnoremap o     b
"nnoremap q b

" cursor mv file
nnoremap <expr> gg line(".") == 1 ? "G$l" : "gg"
"nnoremap g     gg
"nnoremap <c-g> G$l
"nnoremap G     G$l

" cursor mv brackets
nnoremap <c-c> %
"nnoremap <c-f> %
""nnoremap <leader>k %
"nnoremap [ [[

" cursor mv jump list
nnoremap r     <c-o>
nnoremap b     <c-i>
"nnoremap <c-b> <c-i>

" scroll
nnoremap e     10<c-e>
nnoremap <c-e> 10<c-e>

"
" edit
"

" ins
"nnoremap a A

" ins space
"nnoremap <space> i<Space><Esc>l

" ins cr
nnoremap m i<cr><Esc>
"nnoremap h i<cr><Esc>
"nnoremap <c-m>     i<cr><Esc>

" ins line
nnoremap <c-o>     O<Esc>
"nnoremap <leader>o O<Esc>

" del char
nnoremap s     "ax
nnoremap <BS>  hx
"nnoremap <c-h> hx
"nnoremap <c-d> x

" del line
nnoremap d dd
nnoremap cc D
"nnoremap <c-c> D

" del word back
"nnoremap <c-w> hvbd

" del word forward
nnoremap <expr> <c-d> col(".") == col("$") ? "<esc>" : "dw"
"nnoremap <expr> <c-q> col(".") == col("$") ? "<esc>" : "dw"
"nnoremap <expr> q col(".") == col("$") ? "<esc>" : "dw"
"nnoremap <expr> q col(".") == col("$") ? "<esc>" : "viwx"
"nnoremap <expr> q col(".") == col("$") ? "<esc>" : "vex"
"nnoremap q dw
"nnoremap q vex
"nnoremap q viwx

" select all
nnoremap @ ggVG
"nnoremap <leader>a ggVG

" select word
nnoremap w viw
"nnoremap W V

" select box
nnoremap v <c-v>

" yank
nnoremap c yy

" paste
nnoremap p P
"nnoremap v P

" undo
nnoremap u         u
" redo
nnoremap <c-u>     <c-r>
"nnoremap <leader>u <c-r>

" repeat
nnoremap 0 .
"nnoremap r .

" inc , dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap > >>
nnoremap < <<

"
" search
"
"nnoremap / /<c-r><c-w>
nnoremap <c-n> N
nnoremap h *
"nnoremap m *
"nnoremap <c-l> *
"nnoremap <c-m> *

" grep
nnoremap :g :grep! "" **.lua **.script<Home><S-Right><Right><Right>

" open file session last
nnoremap <c-p> `0

" tag jump
"nnoremap <c-f> <c-w>gF
"nnoremap t <c-w>gF

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
nnoremap <space> <Esc>
nnoremap <bs>    <Esc>

nnoremap * <Esc>
nnoremap , <Esc>
"nnoremap . <Esc>
nnoremap _ <Esc>
"nnoremap @ <Esc>
"nnoremap ; <Esc>
nnoremap <c-@> <Esc>
"nnoremap <c-[> <Esc>
"nnoremap <c-]> <Esc>

"nnoremap 0 <Esc>
"nnoremap a <Esc>
"nnoremap b <Esc>
"nnoremap d <Esc>
"nnoremap e <Esc>
"nnoremap g <Esc>
"nnoremap h <Esc>
"nnoremap l <Esc>
"nnoremap m <Esc>
"nnoremap q <Esc>
"nnoremap r <Esc>
"nnoremap t <Esc>
"nnoremap u <Esc>
nnoremap y <Esc>
nnoremap z <Esc>

nnoremap <c-a> <Esc>
nnoremap <c-b> <Esc>
"nnoremap <c-c> <Esc>
"nnoremap <c-e> <Esc>
"nnoremap <c-f> <Esc>
"nnoremap <c-g> <Esc>
nnoremap <c-h> <Esc>
"nnoremap <c-l> <Esc>
nnoremap <c-m> <Esc>
"nnoremap <c-n> <Esc>
"nnoremap <c-p> <Esc>
nnoremap <c-q> <Esc>
nnoremap <c-r> <Esc>
"nnoremap <c-s> <Esc>
nnoremap <c-t> <Esc>
nnoremap <c-v> <Esc>
nnoremap <c-w> <Esc>
nnoremap <c-x> <Esc>
nnoremap <c-y> <Esc>
nnoremap <c-z> <Esc>

"
" mode insert
"

" quit
inoremap <c-f> <Esc>
inoremap <c-q> <Esc>
inoremap <c-c> <Esc>
"inoremap <c-v> <Esc>

" cursor mv line in
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <c-o> <c-o>h

" cursor mv word
"inoremap <c-f> <c-o>w
"inoremap <c-q> <c-o>b
"inoremap <expr> <c-q> pumvisible() ? "<esc>i" : "<c-o>b"

inoremap ( ()<c-o>h
inoremap < <><c-o>h
inoremap " ""<c-o>h
inoremap ' ''<c-o>h

" del line
"inoremap <c-k> <c-o>D
"inoremap <c-c> <c-o>D

" del char forward
inoremap <c-d> <c-o>x
" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <c-k> <c-o>dw
"inoremap <c-s> <c-o>dw

" line new
inoremap <c-j> <cr>

" tab
inoremap <tab> <c-v><Tab>

" input complete
inoremap <c-m> <c-n>
inoremap <c-v> <c-n>
inoremap <expr> <c-n> pumvisible() ? "<down>" : "<c-o>j"
inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<c-o>k"


"
" mode visual
"

"
" esc
"
vnoremap q     <c-c>
vnoremap <c-f> <c-c>
vnoremap <c-q> <c-c>
vnoremap @ <c-c><c-o><c-o>

" mode ch line
vnoremap w V

" mode ch box
vnoremap v     <c-v>
"vnoremap <c-w> <c-v>

" cursor mv
vnoremap a     $h
"vnoremap e     $h
"vnoremap <c-e> $h
"vnoremap a     0
"vnoremap <c-a> 0

" cursor mv char
vnoremap <c-o> h
"vnoremap h     h
vnoremap l l

" cursor mv word
vnoremap f     e
"vnoremap <c-f> E
vnoremap o     b

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv file
vnoremap <expr> gg line(".") == 1 ? "G$l" : "gg"
"vnoremap G G$
"vnoremap <c-g> G$

" ins
"vnoremap i I
vnoremap <expr> i mode() == "<c-v>" ? "I" : "c"
vnoremap a A

" del
"vnoremap s "ax
vnoremap s x
"vnoremap q x
vnoremap x "ax

" yank
vnoremap c y

" paste
vnoremap p "adhp
"vnoremap v "adhp

"
" search
"
vnoremap h y/<c-r>0<cr>
vnoremap / y/<c-r>0

" increment
"vnoremap + <c-a>
vnoremap + g<c-a>

" indent
vnoremap > >gv
vnoremap < <gv
vnoremap :t :'<,'>!expand -2

" add
" vnoremap i" di""<c-c>hp
" vnoremap i' di''<c-c>hp
" vnoremap i( di()<c-c>hp
" vnoremap i{ di{}<c-c>hp
" vnoremap i< di<><c-c>hp


" 
" mode ex
" 
" quit
cnoremap <c-q> <c-c>
"cnoremap <c-v> <c-c>

" cursor mv line in
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

" cursor mv char
cnoremap <c-b> <Left>
cnoremap <c-l> <Right>
"cnoremap <c-o> <Left>

" cursor mv word
cnoremap <c-o> <S-Left>
cnoremap <c-f> <S-Right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word
cnoremap <c-k> <S-Right><c-w>
"cnoremap <c-s> <S-Right><c-w>
"cnoremap <c-w> <c-w>

" del line in
cnoremap <c-c> <c-u>

"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = { 'ctrl-o': 'tab split' }
"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])


" files
nnoremap <leader>o :Files<cr>
nnoremap <leader>p :Files<cr>
vnoremap <leader>o y:Files<cr>
vnoremap <leader>p y:Files<cr>
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" lines
nnoremap <leader>l :Lines<cr>
vnoremap <leader>l y:Lines <c-r>0<cr>
command! -bang -nargs=? Lines
\ call fzf#vim#lines(<q-args>,{'options': ['--no-sort']}, <bang>1)
"\ call fzf#vim#lines(<q-args>, <bang>1)

" rg
"
" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )
nnoremap <leader>f :Rg<cr>
vnoremap <leader>f y:Rg <c-r>0<cr>
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --line-number --smart-case --no-multiline --no-heading --color=always
\       -g "*.lua" -g "*.script" -g "*.gui_script" '
\       .shellescape(<q-args>),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )

" ctags
"nnoremap <leader>c :Tags function<cr>
"vnoremap <leader>c y:Tags function <c-r>0
nnoremap <leader>c :Tags<cr>
vnoremap <leader>c y:Tags <c-r>0<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)
"\ call fzf#vim#tags(expand('<cword>'), <bang>1)

let g:fzf_colors = {
\   'hl':      ['fg', 'Statement'],
\   'hl+':     ['fg', 'Statement'],
\ }
"\   'bg+':     ['bg', 'Normal'],

"let g:fzf_colors = {
"\   'fg':      ['fg', 'Normal'],
"\   'bg':      ['bg', 'Normal'],
"\   'hl':      ['fg', 'Comment'],
"\   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"\   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"\   'hl+':     ['fg', 'Statement'],
"\   'info':    ['fg', 'PreProc'],
"\   'border':  ['fg', 'Ignore'],
"\   'prompt':  ['fg', 'Conditional'],
"\   'pointer': ['fg', 'Exception'],
"\   'marker':  ['fg', 'Keyword'],
"\   'spinner': ['fg', 'Label'],
"\   'header':  ['fg', 'Comment'],
"\ }


" coc.nvim
"
"nnoremap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction



