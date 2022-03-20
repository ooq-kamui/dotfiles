"
" Configuration file for vim
"
set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

filetype on

au ColorScheme * hi LineNr       ctermfg=141                        cterm=none
au ColorScheme * hi CursorLineNr ctermfg=magenta
augroup InsertHook
  autocmd!
  autocmd InsertLeave * hi LineNr ctermfg=141
  autocmd InsertEnter * hi LineNr ctermfg=lightgreen
augroup END 

au ColorScheme * hi Visual                           ctermbg=magenta cterm=none
au ColorScheme * hi VisualNOS                        ctermbg=magenta cterm=none
au ColorScheme * hi Search        ctermfg=yellow     ctermbg=cyan    cterm=none
au ColorScheme * hi IncSearch     ctermfg=yellow     ctermbg=cyan    cterm=none
au ColorScheme * hi MatchParen    ctermfg=magenta    ctermbg=none

au ColorScheme * hi TabLineSel    ctermfg=cyan       ctermbg=none    cterm=none
au ColorScheme * hi TabLine       ctermfg=lightblue  ctermbg=33      cterm=none
au ColorScheme * hi TabLineFill                      ctermbg=33      cterm=none

au ColorScheme * hi StatusLine    ctermfg=lightblue  ctermbg=33      cterm=none
au ColorScheme * hi EndOfBuffer   ctermfg=cyan                       cterm=none

au ColorScheme * hi Pmenu         ctermfg=lightgreen ctermbg=blue
au ColorScheme * hi PmenuSel      ctermfg=cyan       ctermbg=magenta cterm=bold

au ColorScheme * hi ErrorMsg      ctermfg=magenta    ctermbg=none    cterm=none
au ColorScheme * hi WarningMsg    ctermfg=magenta    ctermbg=none    cterm=none

au ColorScheme * hi NonText       ctermfg=25         ctermbg=none    cterm=none
au ColorScheme * hi SpecialKey    ctermfg=25         ctermbg=none    cterm=none

au ColorScheme * hi Comment       ctermfg=14         ctermbg=none    cterm=none

au ColorScheme * hi netrwDir      ctermfg=lightgreen
au ColorScheme * hi netrwTreeBar  ctermfg=lightgreen
au ColorScheme * hi netrwClassify ctermfg=lightgreen
au ColorScheme * hi netrwComment  ctermfg=14         ctermbg=none    cterm=none
au ColorScheme * hi netrwList     ctermfg=yellow     ctermbg=none    cterm=none
au ColorScheme * hi netrwVersion  ctermfg=130        ctermbg=none    cterm=none
au ColorScheme * hi netrwHelpCmd  ctermfg=130        ctermbg=none    cterm=none

au Colorscheme * hi FullWidthSpace ctermbg=white
au VimEnter * match FullWidthSpace /　/

au BufNewFile,BufRead *.script     set filetype=lua
au BufNewFile,BufRead *.gui_script set filetype=lua
au BufNewFile,BufRead *.fish       set filetype=fish

syntax on


colorscheme koehler

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%

set incsearch
set hlsearch
set ignorecase smartcase

set number
set list
set cursorline

set autoindent

""set expandtab " indent tab > space
"set tabstop=4    " 2
"set shiftwidth=4 " 2

set expandtab " indent tab > space
set tabstop=2
set shiftwidth=2

filetype indent on
autocmd FileType text setlocal sw=2 sts=2 ts=2 et
autocmd FileType json setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim  setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh   setlocal sw=2 sts=2 ts=2 et

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" | endif
augroup END

autocmd BufWinEnter * normal! zt
"autocmd BufWinEnter * normal! zz


set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " cursor, mv new line
set virtualedit+=block  " visual box, mv new line forward
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""
set showtabline=2
set wildmenu " ?
"set showmatch
"set visualbell

"set clipboard+=unnamedplus " ???

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
set statusline+=%{&fileencoding}\  " file encoding
set statusline+=%y\                " file type
set statusline+=%p%%\              " line num %
set statusline+=%l/%L              " line num / line num all
set laststatus=2                   " 0: off  1: on 2 win  2: on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I

packadd Cfilter


" leader
let mapleader = "\<esc>"

"
" mode normal
"

" quit buffer
nnoremap w :bd<cr>

" quit
nnoremap <c-w> :q<cr>

" quit force
nnoremap :q :q!

" quit other
nnoremap W :tabo<cr>
"nnoremap <leader>w :tabo<cr>

" save
nnoremap a :w<cr>

" reload
nnoremap :e :e!

" open latest
"nnoremap xx `0

" open latest list
nnoremap <leader>y :Latest<cr>

command! -nargs=0 Latest
\ call setqflist([], ' ', {'lines' : v:oldfiles, 'efm' : '%f',
\                          'quickfixtextfunc' : 'QfOldFiles'}) | tab cw
func QfOldFiles(info)
  " info frm quickfix
  let items = getqflist({'id' : a:info.id, 'items' : 1}).items
  let l = []
  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    " mod file-name simple
    call add(l, fnamemodify(bufname(items[idx].bufnr), ':p:.'))
  endfor
  return l
endfunc

" opn tab new
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>N :tabnew<cr>:tabo<cr>

"
" cursor mv
"

" cursor mv dir
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <c-k> 10<c-y>
nnoremap <c-j> 10<c-e>

" cursor mv in line start | ins line
nnoremap <expr> y col(".") == 1 ? "O<esc>" : "0"
"nnoremap <expr> ; col(".") == 1 ? "O<esc>" : "0"

" cursor mv line in start
nnoremap <c-a> 0

" cursor mv in line end
nnoremap <expr> <c-e> col("$") == 1 ? "$" : "$l"
nnoremap <expr> <c-y> col("$") == 1 ? "$" : "$l"
"nnoremap <expr> <c-l> col("$") == 1 ? "$" : "$l"
"nnoremap <expr> <c-l> col("$") == 1 ? "$" : "$l"

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-o> h
nnoremap <c-s> h
"nnoremap O     h

" cursor mv word - forward
nnoremap f el
nnoremap <c-f> w
nnoremap F e
"nnoremap <c-f> e
"nnoremap F w

" cursor mv word - back
nnoremap o b

" cursor mv word split _
nnoremap _     f_l
nnoremap <c-_> hT_

" cursor mv file back    ( file begin )
nnoremap go gg0

" cursor mv file forward ( file end   )
nnoremap gl G$l

" cursor mv bracket pair
nnoremap <c-l> %
"nnoremap <c-y> %
"nnoremap <c-o> %

" cursor mv bracket back
nnoremap L [m

" cursor mv function back
nnoremap O [{
"nnoremap P [{
"nnoremap P ?function<cr>f(b

" cursor mv edited ( jump list )
nnoremap b     <c-o>
nnoremap <c-b> <c-i>

" cursor mv window split
"nnoremap <c-w> <c-w>w

" scroll
nnoremap <up>   <c-y>
nnoremap <down> <c-e>
nnoremap K <c-y>
nnoremap J <c-e>

" scroll cursor line read easily
"nnoremap xx zt

"
" edit
"

" ins mode
nnoremap <space> i

" ins line
" ref ;

" ins cr
nnoremap m i<cr><esc>

" ins space
"nnoremap * i <esc>l

" ins comma
nnoremap , i, <esc>l
nnoremap < A,<esc>j

" ins comment 1
autocmd FileType lua  nnoremap ! ^i-- <esc>0
autocmd FileType vim  nnoremap ! ^i"<esc>0
autocmd FileType text nnoremap ! ^i# <esc>0
autocmd FileType sh   nnoremap ! ^i# <esc>0
autocmd FileType css  nnoremap ! ^i/* <esc>$li */<esc>0
autocmd FileType javascript nnoremap ! ^i// <esc>0

" ins comment mlt lua
autocmd FileType lua  nnoremap $ O--[[<cr>--]]<esc>
autocmd FileType css  nnoremap $ O/*<cr> */<esc>
autocmd FileType html nnoremap $ O<!--<cr>--><esc>
autocmd FileType javascript nnoremap $ O/*<cr> */<esc>

" ins sys cmd ( read )
nnoremap :r :read ! 

" del char
nnoremap s "ax
nnoremap x x
"nnoremap <bs> h"ax

" del line
nnoremap d "0dd

" del in line forward
nnoremap <c-d> D
"nnoremap <c-y> D

" del word back
"nnoremap <c-w> hvbd

" del word forward
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"adw'
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"ade'

" del cr ( line join )
nnoremap <c-m> J

" select all
"nnoremap A ggVG

" select word
nnoremap i viw

" select char current - word end
"nnoremap xx ve

" select box
nnoremap v <c-v>

" select
nnoremap I v

" yank line
nnoremap c "0yy

" pc clipboard line
nnoremap <c-c> "+yy

" yank char
"nnoremap xx "0yl

" paste
nnoremap p "0P

" paste pc clipboard
"nnoremap xx "+P

" mv line up
"nnoremap xx "0ddk"0P

" dpl line
"nnoremap <c-d> "0yy"0P

" undo, redo
nnoremap h     u
nnoremap <c-h> <c-r>

" repeat
"nnoremap . .

" repeat memory
nnoremap <c-^> qy
nnoremap ^     @y

" inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap " <<
nnoremap # >>

" char toggle ( upper / lower )
nnoremap u :call Char_tgl1()<cr>
nnoremap U :call Char_tgl2()<cr>

" upper / lower
"nnoremap xx v~

" 
" search
" 

" search char
"nnoremap use not

" search char repeat
"nnoremap use not

" search
nnoremap n     :call N_srch("f")<cr>
nnoremap <c-n> :call N_srch("b")<cr>

" search word set
nnoremap e :call N_srch_str__(v:false)<cr>

" search word set ( word 1 )
nnoremap E :call N_srch_str__(v:true)<cr>

" search cmd
nnoremap <leader>k /

" search word set prv ( tgl )
nnoremap N /<c-p><c-p><cr>

" search init ( hl )
nnoremap S /<cr>
"nnoremap N /<cr>

" search replace all > yank ( file )
nnoremap :s :%s//<c-r>0/gc<cr>
"nnoremap :w :%s//<c-r>0/g <cr>

" search replace one > yank next ( only search )
nnoremap <c-p> gn

" tag jump tab new
nnoremap r <c-w>gFgTj

" tag jump tab crnt
"nnoremap R gf

" mark
"nnoremap xx m

" wrap
nnoremap :w :set wrap!


"
" tab
"
" tab mv
nnoremap <tab>   gt
nnoremap <s-tab> gT

" tab order
nnoremap <s-left>  :tabm-1<cr>
nnoremap <s-right> :tabm+1<cr>
"nnoremap < :tabm-1<cr>
"nnoremap > :tabm+1<cr>

" buffer list
"nnoremap :b :buffers

" inf char
nnoremap ga ga


" numpad shift
nnoremap <kInsert>   0
nnoremap <kEnd>      1
nnoremap <kDown>     2
nnoremap <kPageDown> 3
nnoremap <kLeft>     4
nnoremap <kOrigin>   5
nnoremap <kRight>    6
nnoremap <kHome>     7
nnoremap <kUp>       8
nnoremap <kPageUp>   9

"
" esc
"
nnoremap <esc>   <esc>
"nnoremap <cr>    <esc> " eq <c-m>
"nnoremap <space> <esc>
nnoremap <bs>    <esc>

nnoremap = <esc>
nnoremap @ <esc>
nnoremap ; <esc>
"nnoremap , <esc>
nnoremap . <esc>
nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>
"nnoremap ^ <esc>
nnoremap / <esc>
nnoremap ? <esc>

"nnoremap ! <esc>
"nnoremap " <esc>
"nnoremap # <esc>
"nnoremap $ <esc>
nnoremap ( <esc>
"nnoremap < <esc>
nnoremap > <esc>

nnoremap <c-space> <esc>
nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non ?
"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-/> <esc> " non ?
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

nnoremap 0 <esc>
"nnoremap a <esc>
"nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
"nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap o <esc>
nnoremap q <esc>
"nnoremap r <esc>
"nnoremap s <esc>
nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
"nnoremap x <esc>
"nnoremap y <esc>
nnoremap z <esc>

nnoremap A <esc>
nnoremap C <esc>
nnoremap D <esc>
"nnoremap E <esc>
"nnoremap F <esc>
nnoremap G <esc>
nnoremap H <esc>
"nnoremap I <esc>
"nnoremap J  <esc>
"nnoremap K  <esc>
"nnoremap L <esc>
"nnoremap M <esc>
"nnoremap N <esc>
"nnoremap O <esc>
nnoremap Q <esc>
"nnoremap P <esc>
"nnoremap R <esc>
"nnoremap S <esc>
nnoremap T <esc>
"nnoremap U <esc>
"nnoremap W <esc>
nnoremap V <esc>
nnoremap Y <esc>

"nnoremap <c-a> <esc>
"nnoremap <c-b> <esc>
"nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
"nnoremap <c-f> <esc>
nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
"nnoremap <c-p> <esc>
nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
"nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"nnoremap <c-w> <esc>
nnoremap <c-x> <esc>
"nnoremap <c-y> <esc>
nnoremap <c-z> <esc>


"
" mode visual
"

" mode ch line
vnoremap i V

" mode ch box
vnoremap v <c-v>

"
" cursor mv
"

" cursor mv char
vnoremap l l
vnoremap <c-o> h
vnoremap <c-s> h

" cursor mv word - forward
vnoremap f e

" cursor mv word - back
"vnoremap o b

" cursor mv word split _
vnoremap _     lt_
vnoremap <c-_> F_h

" cursor mv space - forward ( word pre )
vnoremap I wh
vnoremap F wh

" cursor mv in selected
vnoremap y o
"vnoremap ; o

" cursor mv in line
"vnoremap $ $

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv file back    ( file begin )
vnoremap go gg0

" cursor mv file forward ( file end   )
vnoremap gl G$l

" cursor mv bracket pair
vnoremap <c-l> %

" ins | cut & ins
vnoremap <expr> <space> mode() == "<c-v>" ? "I" : "c"
vnoremap <leader><space> "ac

" ins $
vnoremap <expr> <c-y> mode() == "<c-v>" ? "$A" : "g_"

" del str > yank
vnoremap d "0d

" del str > yank non
vnoremap s "ax
vnoremap x "ax

" del cr
vnoremap <c-m> J

" mv str back
vnoremap <c-w> :call V_mv_str("h")<cr>

" mv str forward
vnoremap <c-e> :call V_mv_str("l")<cr>

" mv line
vnoremap J :call V_mv_line("j")<cr>
vnoremap K :call V_mv_line("k")<cr>

" select all
vnoremap a <esc>ggVG

" yank selected
vnoremap o "0y
vnoremap c "0y

" pc clipboard selected
vnoremap <c-c> "+y

" paste
vnoremap p "ad"0P

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" num seq
vnoremap A g<c-a>

" indent
vnoremap " <gv
vnoremap # >gv

" indent tab > space
vnoremap :t :!expand -t 4

" upper / lower
vnoremap u     ~viw
vnoremap <c-u> uviw

"
" search
"

" search forward
vnoremap n     :call V_srch_str__slctd_str(v:false)<cr>

" search back
vnoremap <c-n> :call V_srch_str__slctd_str(v:false)<cr>

" search word set
vnoremap e :call V_srch_str__slctd_str(v:false)<cr>

" search word set ( word 1 )
vnoremap E :call V_srch_str__slctd_str(v:true)<cr>

" search cmd
vnoremap <leader>k "ay/<c-r>a
"vnoremap / "ay/<c-r>a

" search replace all > yank ( selected )
vnoremap :s :s//<c-r>0/gc<cr>

" search replace one > yank, next
vnoremap <c-p> "ad"0Plgn

" tag jump
vnoremap r :<line1>,<line2>call s:Tag_jmp()
"vnoremap r :TagJmp<cr>
"vnoremap r :FileJmp<cr>

"
" nop
"
"vnoremap <space> <nop>

"
" esc
"
vnoremap @ <c-c>
vnoremap * <c-c>
vnoremap / <c-c>
"vnoremap ! <c-c>
"vnoremap " <c-c>
"vnoremap # <c-c>
vnoremap $ <c-c>
"vnoremap _ <c-c>
vnoremap ? <c-c>
vnoremap ( <c-c>
vnoremap ; <c-c>
vnoremap < <c-c>
vnoremap > <c-c>
vnoremap = <c-c>
vnoremap , <c-c>
vnoremap . <c-c>

"vnoremap a <c-c>
vnoremap b <c-c>
"vnoremap c <c-c>
"vnoremap d <c-c>
"vnoremap e <c-c>
"vnoremap f <c-c>
vnoremap h <c-c>
"vnoremap i <c-c>
vnoremap m <c-c>
"vnoremap n <c-c>
"vnoremap o <c-c>
vnoremap q <c-c>
"vnoremap r <c-c>
"vnoremap s <c-c>
vnoremap t <c-c>
"vnoremap u <c-c>
"vnoremap v <c-c>
vnoremap w <c-c>
"vnoremap x <c-c>
"vnoremap y <c-c>

"vnoremap A <c-c>
vnoremap C <c-c>
"vnoremap F <c-c>
vnoremap H <c-c>
"vnoremap I <c-c>
"vnoremap J <c-c>
"vnoremap K <c-c>
"vnoremap L <c-c>
vnoremap M <c-c>
vnoremap N <c-c>
vnoremap O <c-c>
vnoremap P <c-c>
vnoremap V <c-c>
vnoremap Y <c-c>

vnoremap <c-a> <c-c>
"vnoremap <c-c> <c-c>
vnoremap <c-d> <c-c>
"vnoremap <c-e> <c-c>
vnoremap <c-f> <c-c>
vnoremap <c-i> <c-c>
"vnoremap <c-l> <c-c>
"vnoremap <c-m> <c-c>
"vnoremap <c-n> <c-c>
"vnoremap <c-o> <c-c>
"vnoremap <c-p> <c-c>
vnoremap <c-q> <c-c>
vnoremap <c-r> <c-c>
"vnoremap <c-s> <c-c>
"vnoremap <c-u> <c-c>
vnoremap <c-v> <c-c>
"vnoremap <c-w> <c-c>
vnoremap <c-x> <c-c>
"vnoremap <c-y> <c-c>


"
" mode insert
"

" quit, esc
inoremap <expr> <esc>
\ pumvisible()  ? "<c-e>" :
\ col(".") == 1 ? "<esc>" :
\                 "<esc>l"

" cursor mv line in
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$
"inoremap <c-a> <c-o>^

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <c-f> <c-o>l
inoremap <expr> <c-o> pumvisible() ? "<c-y>" : "<c-o>h"
inoremap <c-s> <c-o>h

" cursor mv word forward
"inoremap <c-f> <c-o>e<c-o>l

" cursor mv word back
"inoremap <c-q> <c-o>b

" cursor mv d
inoremap <c-n> <down>
"inoremap <expr> <c-n> pumvisible() ? "<down>" : "<down>"

" cursor mv u
inoremap <c-p> <up>
"inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<up>"

" del line
" non

" del char forward
inoremap <c-d> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <expr> <c-k>
\ pumvisible()         ? "<c-p>"   :
\ col(".") != col("$") ? "<c-o>dw" :
\                        ""

" del word back
inoremap <c-w> <c-w>

" ins cr
inoremap <c-m> <cr>

" ins tab
inoremap <tab> <c-v><Tab>

" paste
"inoremap <c-v> <c-r>0

" paste pc clipboard
inoremap <c-v> <c-r>+

" input complete
inoremap <c-y> <c-n>
"   clear
"inoremap <expr> <esc> pumvisible() ? "<c-e>"  : ""
"inoremap <expr> <c-w> pumvisible() ? "<c-e>"  : "<c-w>"

" ins bracket
inoremap ( ()<c-o>h
inoremap < <><c-o>h
inoremap { {}<c-o>h
inoremap [ []<c-o>h
inoremap " ""<c-o>h
inoremap ' ''<c-o>h

" numpad shift
inoremap <kInsert>   0
inoremap <kEnd>      1
inoremap <kDown>     2
inoremap <kPageDown> 3
inoremap <kLeft>     4
inoremap <kOrigin>   5
inoremap <kRight>    6
inoremap <kHome>     7
inoremap <kUp>       8
inoremap <kPageUp>   9

" ins symbol
func! Inssymbol() abort

  let l:lst = ['%', '&', '@']
  "let l:lst = ['!', '#', '$', '%', '&', '^', '~', '|', '?']

  call complete(col('.'), l:lst)
  return ''
endfunc
inoremap <c-_> <c-r>=Inssymbol()<cr>

" ins bracket
func! Ins_bracket() abort
  call complete(col('.'), ['()', '{}', '[]', '<>', '""', "''", '``'])
  return ''
endfunc
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-r>=Ins_bracket()<cr>"

" ins num
func! Insnum() abort
  call complete(col('.'), ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
  return ''
endfunc
"inoremap <c-n> <c-r>=Insnum()<cr>

" ins register
func! Insreg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc
inoremap <c-r> <c-r>=Insreg()<cr>

" ins lua reserved word
func! Ins_lua_reserved() abort
  call complete(col('.'), [
  \   'end',
  \   'local',
  \   'return',
  \   'if elseif else end',
  \   'for key, val in pairs() do end',
  \   'function'
  \ ])
  return ''
endfunc
"inoremap <c-r> <c-r>=Ins_lua_reserved()<cr>

" ins ooq ( lua )
func! Ins_usual() abort
  call complete(col('.'), [
  \   '_s:',
  \   '_s._',
  \   'log._("", )',
  \   'log.pp("", )',
  \   'function',
  \   'local',
  \   'return',
  \   'if _.t then return end',
  \   'if  then',
  \   'elseif  then',
  \   'else',
  \   'then',
  \   'then return end',
  \   'for key, val in pairs() do end',
  \   'not',
  \   'or',
  \   'and',
  \   'end',
  \   'nil',
  \   'alias',
  \   '-- dbg',
  \   '--',
  \   '_.f',
  \   '_.t',
  \   '()'
  \ ])
  return ''
endfunc
"inoremap <c-u> <c-r>=Ins_usual()<cr>

"
" nop
"
inoremap <c-b> <nop>
"inoremap <c-p> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>


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

" del word forward
cnoremap <c-k> <S-Right><c-w>

" del in line back
cnoremap <c-c> <c-u>

" paste
cnoremap <c-v> <c-r>0

" history
"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

" numpad shift
cnoremap <kInsert>   0
cnoremap <kEnd>      1
cnoremap <kDown>     2
cnoremap <kPageDown> 3
cnoremap <kLeft>     4
cnoremap <kOrigin>   5
cnoremap <kRight>    6
cnoremap <kHome>     7
cnoremap <kUp>       8
cnoremap <kPageUp>   9


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end


" 
" ripgrep ( cmd )
" 
if executable('rg')
  let &grepprg = 'rg --vimgrep -s -g "*.lua" -g "*.script" -g "*.gui_script"'
  set grepformat=%f:%l:%c:%m
endif
"nnoremap :g :grep! "<c-r>/"

func! Grep() abort
  
  "let l:str = @/
  let l:str = substitute(@/, "(", '\\(', "")

  execute "grep! ".'"'.l:str.'"'

endfunc
nnoremap :g :call Grep()<cr>


" 
" vimgrep
" 
command! -nargs=1 V  vimgrep   /<args>/j **/*.lua **/*.script **/*.gui_script
nnoremap :v :V <c-r>/

command! -nargs=1 VC vimgrep /\C<args>/j **/*.lua **/*.script **/*.gui_script
nnoremap :V :VC <c-r>/


"
" quickfix
"
autocmd QuickFixCmdPost vimgrep,grep tab cw


"
" netrw
"

" netrw launch
"nnoremap <leader>j :Tex .<cr>

let g:netrw_liststyle    = 3 " view file tree
let g:netrw_browse_split = 3 " file open tab
let g:Netrw_UserMaps = [
\ ['<c-o>', 'NetrwKeyBind_opn'],
\ ['<c-l>', 'NetrwKeyBind_opn'],
\ ['o'    , 'NetrwKeyBind_mv_word_back'],
\ ['e'    , 'NetrwKeyBind__top'],
\ ['p'    , 'NetrwKeyBind__parent'],
\ ['<c-q>', 'NetrwKeyBind_clz'],
\ ['<esc>', 'NetrwKeyBind_clz'],
\ ['m'    , 'NetrwKeyBind_mark'],
\]
"\ ['r'    , 'NetrwKeyBind_tagjump'],

func! NetrwKeyBind_opn (islocal) abort
  return "normal  \<cr>"
endfunc
func! NetrwKeyBind_clz (islocal) abort
  return "normal  :q\<cr>"
endfunc
func! NetrwKeyBind_mv_word_back (islocal) abort
  return "normal! b"
endfunc
func! NetrwKeyBind__top (islocal) abort
  return "Ntree"
endfunc
func! NetrwKeyBind__parent (islocal) abort
  return "normal  -"
endfunc

func! NetrwKeyBind_mark (islocal) abort
  return "normal  mf"
endfunc
"func! NetrwKeyBind_tagjump (islocal) abort
"  return "normal  <c-w>gFgTj"
"endfunc


" 
" plugin  #bgn#
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'mattn/vim-molder'
Plug 'mattn/vim-molder-operations'
"Plug 'qpkorr/vim-renamer'
"Plug 'ryym/vim-viler'
"Plug 'cocopon/vaffle.vim'
"Plug 'justinmk/vim-dirvish'
call plug#end()

"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {'ctrl-o': 'tab drop'}

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

"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" lines
nnoremap <leader>u :BLines<cr>
vnoremap <leader>u "ay:BLines <c-r>a<cr>
nnoremap <leader>l :BLines<cr>
vnoremap <leader>l "ay:BLines <c-r>a<cr>
command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(<q-args>,{'options': ['--no-sort']}, <bang>1)

" files
nnoremap <leader>i :Files <cr>
vnoremap <leader>i :Files <cr>
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" rg ( fzf )
"
" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )
nnoremap <leader>o :Rg <cr>
vnoremap <leader>o "ay:Rg <c-r>a<cr>
vnoremap <leader>d "ay:Rg <c-r>a<cr>func
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   "rg --color=always --line-number --smart-case --no-multiline --no-heading "
\     ."-- ".shellescape(escape(<q-args>, '(')),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

"
" ctags ( fzf )
"
set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap xx :!sh sh/ctags.sh

"nnoremap <leader>xx :Tags <c-r><c-w><cr>
"vnoremap <leader>xx "ay:Tags <c-r>a<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)


"
" vim-bookmarks
"
"highlight BookmarkSign           ctermbg=magenta ctermfg=magenta
"highlight BookmarkLine           ctermbg=magenta ctermfg=magenta
"highlight BookmarkAnnotationSign ctermbg=magenta ctermfg=magenta
"highlight BookmarkAnnotationLine ctermbg=magenta ctermfg=magenta

" mark
nmap M <Plug>BookmarkToggle

" annotate
"nmap Mi <Plug>BookmarkAnnotate

" list
nmap <leader>m <Plug>BookmarkShowAll

" prv, nxt
nmap Mp <Plug>BookmarkPrev
nmap Mn <Plug>BookmarkNext

" del in buffer
nmap :mc :BookmarkClear

let g:bookmark_no_default_key_mappings = 1

"nmap <c-j>     <Plug>BookmarkMoveToLine
"nmap <Leader>x <Plug>BookmarkClearAll


"
" renamer
"

" file lst
"nnoremap <leader>r :tabnew<cr>:Renamer<cr>
" save
"nnoremap R :Ren


"
" molder
"

" launch
nnoremap <leader>f :tabnew<cr>:e .<cr>
"autocmd FileType molder nnoremap u -
"autocmd FileType molder nnoremap <c-o> <c-m>

" plugin  #end#


"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o


"
" vim script
"

func! s:Tag_jmp() range abort
"func! s:FileJmp() range abort

  let l:files = []

  for line_idx in range(a:firstline, a:lastline)

    let l:line = getline(line_idx)
    let l:idx1 = stridx(l:line, " ")
    if l:idx1 > 0
      let l:file_num  = strpart(l:line, 0, l:idx1)
    else
      let l:file_num  = l:line
    endif

    call add(l:files, l:file_num)
  endfor

  "call uniq(sort(l:files))

  for file_num in l:files

    let l:idx1 = stridx(l:file_num, "|")

    if l:idx1 > 0
      let l:file = strpart(l:file_num,          0, l:idx1)
      let l:num  = strpart(l:file_num, l:idx1 + 1)
    else
      let l:file = l:file_num
      let l:num  = "1"
    endif

    execute "tab drop " . l:file
    execute "normal! " . l:num . "G"
  endfor
endfunc
"command! -range=% -nargs=0 TagJmp :<line1>,<line2>call s:Tag_jmp()
"command! -range=% -nargs=0 FileJmp :<line1>,<line2>call s:FileJmp()

func! Char_tgl1() abort
  
  let l:c = getline('.')[col('.')-1]
  "echo l:c

  if     l:c == "<"
    let l:rpl = ">"
  elseif l:c == ">"
    let l:rpl = "<"

  elseif l:c == "{"
    let l:rpl = "}"
  elseif l:c == "}"
    let l:rpl = "{"

  elseif l:c == "["
    let l:rpl = "]"
  elseif l:c == "]"
    let l:rpl = "["

  elseif l:c == "("
    let l:rpl = ")"
  elseif l:c == ")"
    let l:rpl = "("

  elseif l:c == "/"
    let l:rpl = "\\"
  elseif l:c == "\\"
    let l:rpl = "/"

  elseif l:c == "\""
    let l:rpl = "'"
  elseif l:c == "'"
    let l:rpl = "\""

  elseif l:c == "-"
    let l:rpl = "+"
  elseif l:c == "+"
    let l:rpl = "-"

  elseif l:c == ","
    let l:rpl = "."
  elseif l:c == "."
    let l:rpl = ","

  elseif l:c == ";"
    let l:rpl = ":"
  elseif l:c == ":"
    let l:rpl = ";"

  "elseif l:c ==# "T"
  "  let l:rpl = "f"
  "elseif l:c ==# "F"
  "  let l:rpl = "t"

  "elseif l:c ==# "L"
  "  let l:rpl = "r"
  "elseif l:c ==# "R"
  "  let l:rpl = "l"

  "elseif l:c ==# "X"
  "  let l:rpl = "y"
  "elseif l:c ==# "Y"
  "  let l:rpl = "x"

  "elseif l:c ==# "I"
  "  let l:rpl = "o"
  "elseif l:c ==# "O"
  "  let l:rpl = "i"

  else
    normal! v~
    return
  endif

  execute "normal! x"
  execute "normal! i".l:rpl

endfunc

func! Char_tgl2() abort
  
  let l:c = getline('.')[col('.')-1]

  if     l:c == "("
    let l:rpl = "["
  elseif l:c == "["
    let l:rpl = "{"
  elseif l:c == "{"
    let l:rpl = "<"
  elseif l:c == "<"
    let l:rpl = "("

  elseif l:c == ")"
    let l:rpl = "]"
  elseif l:c == "]"
    let l:rpl = "}"
  elseif l:c == "}"
    let l:rpl = ">"
  elseif l:c == ">"
    let l:rpl = ")"
  else
    "normal! v~
    return
  endif

  execute "normal! x"
  execute "normal! i".l:rpl

endfunc

func! Tab_new_exe() abort " use not
  
  execute "tabnew"
  execute "read ! ll"
  execute "normal! o"
  execute "1delete"
endfunc

func! Cursor_word() abort

  let l:word = expand("<cword>>")
  return l:word
endfunc

" 
" fr normal
" 

func! N_srch(dir) abort

  if     a:dir == "f"
    normal! n

  elseif a:dir == "b"
    normal! N
  endif
endfunc

func! N_srch_slct(dir) abort " use not

  if     a:dir == "f"
    normal! gn

  elseif a:dir == "b"
    normal! gN
  endif
endfunc

func! N_srch_str__(word1) abort

  let @/ = Cursor_word()

  if a:word1
    let @/ = '\<' . @/ . '\>'
  endif
endfunc

" 
" fr visual
" 

func! V_mv_str(lr) abort

  execute 'normal! gv"ax' . a:lr . '"aP'
  let l:mvlen = strchars(@a) - 1
  execute "normal! v" . l:mvlen . "h"
endfunc

func! V_mv_line(ud) range abort

  let l:line_num = a:lastline - a:firstline + 1

  execute 'normal! ' . a:firstline . 'G'
  execute 'normal! ' . l:line_num . '"add'
  execute 'normal! ' . a:ud
  execute 'normal! "aP'
  execute 'normal! V'

  let l:mv_num = l:line_num - 1
  if l:mv_num >= 1
    execute 'normal! ' . l:mv_num . 'j'
  endif
endfunc

func! V_slctd_str() abort

  execute 'normal! gv"ay'
  return @a
endfunc

func! V_srch_str__slctd_str(word1) abort

  let @/ = V_slctd_str()

  if a:word1
    let @/ = '\<' . @/ . '\>'
  endif
endfunc

func! V_is_slctd_eq_srch_str() abort

  if V_slctd_str() == @/
    return v:true
  else
    return v:false
  endif
endfunc

func! V_srch(dir) abort " use not

  if !V_is_slctd_eq_srch_str()
    call V_srch_str__slctd_str(v:false)
  endif
endfunc

func! V_srch_slct(dir) abort " use not

  if     a:dir == "f"
    execute 'normal! `>lgn'

  elseif a:dir == "b"
    execute 'normal! `<hgN'
  endif
endfunc

