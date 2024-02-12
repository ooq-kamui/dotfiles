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

hi LineNr      ctermfg=141                         cterm=none
augroup InsertHook
  au!
  au InsertLeave * hi LineNr ctermfg=141
  au InsertEnter * hi LineNr ctermfg=lightgreen
augroup END

hi CursorLineNr ctermfg=magenta

hi Visual                         ctermbg=magenta  cterm=none
hi VisualNOS                      ctermbg=magenta  cterm=none
hi Search      ctermfg=yellow     ctermbg=cyan     cterm=none
hi IncSearch   ctermfg=yellow     ctermbg=cyan     cterm=none
hi MatchParen  ctermfg=magenta    ctermbg=none

hi TabLineSel                     ctermbg=magenta  cterm=none
hi TabLine     ctermfg=lightblue  ctermbg=33       cterm=none
hi TabLineFill                    ctermbg=33       cterm=none

hi StatusLine  ctermfg=lightblue  ctermbg=33       cterm=none
hi EndOfBuffer ctermfg=cyan                        cterm=none

hi Pmenu       ctermfg=lightgreen ctermbg=blue
hi PmenuSel    ctermfg=cyan       ctermbg=magenta  cterm=bold

hi ErrorMsg    ctermfg=magenta    ctermbg=none     cterm=none
hi WarningMsg  ctermfg=magenta    ctermbg=none     cterm=none

hi NonText     ctermfg=25         ctermbg=none     cterm=none
hi SpecialKey  ctermfg=25         ctermbg=none     cterm=none

hi Comment     ctermfg=14         ctermbg=none     cterm=none

hi FullWidthSpace ctermbg=white
match FullWidthSpace /　/

au BufNewFile,BufRead *.script     set filetype=lua
au BufNewFile,BufRead *.gui_script set filetype=lua
au BufNewFile,BufRead *.fish       set filetype=fish

syntax on

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
set incsearch
set hlsearch
set ignorecase smartcase
set number
set list
set cursorline
set splitbelow
set switchbuf=usetab,newtab

set autoindent
set shiftwidth=2 " 4
set tabstop=2    " 4
set expandtab " tab > space

filetype indent on
autocmd FileType lua  setlocal sw=2 sts=2 ts=2 noet " tab
autocmd FileType text setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType json setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType vim  setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType fish setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType sh   setlocal sw=2 sts=2 ts=2   et " space

" file opn, cursor mv last
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
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

"set clipboard+=unnamedplus " ???

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
"set statusline+=%{&fileencoding}\  " file encoding
"set statusline+=%c\                " column num
set statusline+=%y\                " file type
set statusline+=%p%%\              " line num %
set statusline+=%l/%L              " line num / line num all
set laststatus=2                   " 0:off  1:on when 2 win  2:on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I
"set nrformats+=unsigned " 2022-05-09

set noswapfile

" term

set shell=fish
command! -nargs=* Term split | wincmd j | resize 15 | term <args>
"autocmd TermOpen * startinsert

" 
" leader
" 
let mapleader = "\<esc>"


" 
" mode normal
" 

" quit buffer
nnoremap w :bd<cr>

" quit buffer force
nnoremap :q :q!

" quit vim
nnoremap W     :q<cr>

" quit tab other
"nnoremap xx :tabo<cr>

" background job
nnoremap <c-z> <c-z>

" save
"nnoremap a :w<cr>
nnoremap a :call Save()<cr>

" load re slf
nnoremap :e :call Load_re()
"nnoremap xx :e!

" load re vimrc
nnoremap :v :source ~/.vimrc

" 
" opn
" 

" opn tab file
nnoremap :o :Opn 

" opn latest
"nnoremap xx `0

" opn file srch  ( fzf )
nnoremap <leader>l :Files <cr>

" opn file hstry ( fzf )
nnoremap <leader>u :FileHstry<cr>

" 
" opn etc
" 

" opn fish cnf
nnoremap gf :call Opn_fish_cnf()<cr>

" opn .vimrc
nnoremap gh :call Opn_vimrc()<cr>

" opn .vimrc_win
"nnoremap xx :call Opn_vimrc_win()<cr>

" opn tmp
nnoremap gt :call Opn_tmp()<cr>

" opn grep work
"nnoremap xx :call Opn_grep_work()<cr>

" opn vim key note
"nnoremap gv :call Opn_vim_key()<cr>

" opn memo
nnoremap gm :call Opn_memo()<cr>

" opn man
nnoremap :m :OpnMan 

" opn app
nnoremap go :call Opn_app_by_cursor_path()<cr>

" opn app slf
nnoremap gs :call Opn_app_slf()<cr>

" opn brwsr
"nnoremap xx :call Opn_brwsr()<cr>

" opn ggl srch
nnoremap ggl :call Opn_ggl_srch('')<cr>

" opn markdown preview
"nnoremap gx :call Markdown_2_html()<cr>

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

" cursor mv line start | ins line
nnoremap y :call Cursor__mv_line_top_or_new_line()<cr>

" cursor mv line start
nnoremap <c-a> 0

" cursor mv line end
"nnoremap <c-y> xx
nnoremap <expr> <c-y>
\ Is_cursor_line_end() ? ':call Ins_markdown_cr()<cr>'     :
\                        ':call Cursor__mv_line_end()<cr>'

nnoremap <c-e> :call Cursor__mv_line_end()<cr>

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-o> h
nnoremap <c-s> h

" cursor mv word - forward
nnoremap f :call Cursor__mv_word_f()<cr>

" cursor mv word - back
nnoremap o :call Cursor__mv_word_b()<cr>

" cursor mv word - back pre
"nnoremap xx :call Cursor__mv_word_b_pre()<cr>

" cursor mv word dlm _ forward
nnoremap _ f_l
"nnoremap <c-_> f_l

" cursor mv word dlm _ back
nnoremap <c-_> hT_
"nnoremap _ hT_

" cursor mv bracket pair
nnoremap <c-l> %

" cursor mv bracket out back
nnoremap <c-w> [{
nnoremap U     [{
nnoremap R     [{

" cursor mv bracket fnc back
"nnoremap xx [m

" cursor mv edited ( jmp list )
"nnoremap q     <c-o>
"nnoremap <c-q> <c-i>

" cursor mv file back    ( file begin )
nnoremap gk gg0

" cursor mv file forward ( file end   )
nnoremap gj G$l

" cursor mv edit latest
"nnoremap xx `.

" scroll
nnoremap K      <c-y>
nnoremap J      <c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" scroll cursor line upper
"nnoremap xx zt

" scroll cursor line middle
"nnoremap xx zz

" cursor mv window nxt
"nnoremap xx <c-w>w

" 
" slct / ynk / paste
" 

" slct
nnoremap I v

" slct word
nnoremap i :call Slct_word()<cr>

" slct char current - word end
"nnoremap xx ve

" slct visual box
nnoremap v <c-v>

" slct all
nnoremap A :call Ynk__line_all()<cr>


" slct re in line 1
"nnoremap xx :call Slct_re_in_line_1()<cr>

" ynk clr
nnoremap <c-c> :call Ynk__clr()<cr>

" ynk line
nnoremap c :call Ynk__line()<cr>

" ynk char
"nnoremap xx "ayl
"nnoremap xx "0yl

" ynk slf path
nnoremap gp :call Ynk__slf_path()<cr>

" ynk clipboard
"nnoremap xx :call Ynk__clipboard()<cr>

" clipboard line
"nnoremap xx "+yy

" paste
nnoremap p :call Paste()<cr>

" paste clipboard
nnoremap P :call Paste__clipboard()<cr>

" paste rgstr history ( fzf )
nnoremap <leader>p :RgstrHstry<cr>
nnoremap <leader>c :RgstrHstry<cr>

" 
" undo, redo
" 
nnoremap h     u
nnoremap <c-h> <c-r>

" undo clr
"nnoremap xx :call Undo_clr()<cr>

" repeat
"nnoremap xx .

" 
" edit
" 

" mode ins
nnoremap <space> i

" ins line
" ref nnoremap y

" ins cr
nnoremap m :call Ins_cr()<cr>

" ins comment 1
"nnoremap ! xx
nnoremap <expr> !
\ Is_file_type('markdown') ? ':call Ins_markdown_h()<cr>' :
\                            ':call Ins_cmnt_1("^")<cr>'

" ins comment mlt
nnoremap $ :call Ins_cmnt_mlt()<cr>

" ins comma
nnoremap , i, <esc>l

" ins comma $, nxt line
nnoremap < A,<esc>j

" ins period
nnoremap . i.<esc>

" ins hyphen
nnoremap = :call Ins_hyphen()<esc>
nnoremap 0 :call Ins_hyphen()<esc>

" ins space
nnoremap L :call Ins_space()<cr>

" ins date
nnoremap * :call Ins_da()<cr>

" ins date time
nnoremap \ :call Ins_dt()<cr>

" ins day of week
"nnoremap xx :call Ins_week()<cr>

" ins time
"nnoremap xx i<c-r>=strftime("%H:%M")<cr><esc>

" ins slf path
"nnoremap xx :call Ins_line_slf_path()<cr>

" ins markdown code
nnoremap <c-u> :call Ins_markdown_code()<cr>
nnoremap `     :call Ins_markdown_code()<cr>

" ins markdown itm
"nnoremap O xx
nnoremap <expr> O
\ Is_file_type('markdown') ? ':call Ins_markdown_itm()<cr>' :
\                            ':call Indnt__shft_r()<cr>'

" ins dots ( or crnt )
nnoremap > :call Ins_dots()<cr>
"nnoremap > :call Dots__()<cr> " dev doing

" tgl markdown chk
"nnoremap xx :call Char__tgl_markdown_chk()<cr>

" del char
nnoremap s "zx

" line del
nnoremap d :call Line__del()<cr>

" line forward del
nnoremap <c-d> D

" word back    del
"nnoremap xx hvbd

" word forward del
"nnoremap <expr> xx Is_cursor_line_end() ? '<esc>' : '"zdw'
"nnoremap <expr> xx Is_cursor_line_end() ? '<esc>' : '"zde'

" del cr ( line join )
nnoremap <c-m> J

" line mv up
"nnoremap xx "addk"aP
"nnoremap xx "0ddk"0P

" line dpl
"nnoremap xx "zyy"zP

" repeat memory
"nnoremap xx qy
"nnoremap xx @y

" num inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" char toggle ( upper / lower )
nnoremap u :call N_char__tgl()<cr>

" char toggle ( turn ) " use not
"nnoremap xx :call N_char__tgl2()<cr>

" upper / lower
"nnoremap xx v~

" indnt shift
nnoremap " :call Indnt__shft_l()<cr>
nnoremap # :call Indnt__shft_r()<cr>

" indnt add
"nnoremap xx :call Indnt__add(2)<cr>

" indnt crct
nnoremap ; :call Indnt__crct()<cr>

" cursor f space __ crct
nnoremap H :call Cursor_f_space__crct()<cr>

" 
" srch
" 

" srch hl init
nnoremap Y /<cr>N
"nnoremap Y :call Srch_init()<cr>

" srch char in line - forward
"nnoremap xx f

" srch char in line repeat
"nnoremap xx ;

" srch cmd
nnoremap <leader>i /

" srch forward
nnoremap n     :call Srch('f')<cr>

" srch back
nnoremap <c-n> :call Srch('b')<cr>

" srch, cursor mv nxt char
nnoremap @ :call Srch_7_cursor__mv_nxt('f')<cr>

" srch str set
nnoremap e :call N_srch_str__(v:false)<cr>

" srch str set ( word 1 )
nnoremap E :call N_srch_str__(v:true)<cr>

" srch char bracket forward
nnoremap <c-f> :call Srch_char_bracket('f')<cr>

" srch str history ( fzf )
nnoremap <leader>n :SrchHstry<cr>
nnoremap <leader>f :SrchHstry<cr>

" srch str set prv ( tgl )
nnoremap N :call N_srch_str__prv()<cr>
"nnoremap N /<c-p><c-p><cr>

" srch rpl one > ynk nxt ( only srch )
nnoremap <c-p> :call Srch_slct('f')<cr>

" srch rpl all > ynk ( file )
"nnoremap :xx :%s//<c-r>0/gc

" srch ?=ts
"nnoremap xx /?ts=<cr>

" rpl ( cmd )
nnoremap :s :Rpl 

" 
" grep
" 

" grep ( fzf )
nnoremap <leader>o :Rg <cr>

" grep ( fzf )  -  ( win )
" try
"nnoremap <leader>o :GitbashFzfRg <c-r>/

" grep buf ( fzf )
nnoremap <leader>k :call N_grep_buf()<cr>
"nnoremap <leader>k :BLines<cr>

" grep [rg]   ( read )
nnoremap :g :GrepStr <c-r>/
nnoremap :G :GrepWrd <c-r>/

" tag jmp tab new
nnoremap t :call N_tag_jmp()<cr>

" tag jmp tab new  -  alias
nnoremap r :call N_tag_jmp()<cr>

" 
" jmplst ( fzf )
" 

nnoremap <leader>j :JmplstFzf<cr>

" 
" cmd
" 

" cmd history ( fzf )
nnoremap <leader>: :CmdHstry<cr>

" sys cmd
nnoremap :! :! 

" ins sys cmd ( read )
nnoremap :r :InsSysCmd 

" ins sys ls  ( read )
"nnoremap xx :Lf 

" 
" tab
" 

" tab mv
nnoremap <tab>   gt
nnoremap <s-tab> gT

" tab order
nnoremap <s-left>  :tabm-1<cr>
nnoremap <s-right> :tabm+1<cr>

" 
" term
" 

nnoremap :t :Term 

" 
" mark
" 

" mark lst ( fzf )
nnoremap <leader>rl :Mark<cr>

" mark show tgl
nnoremap <leader>rf :call Mark_show_tgl()<cr>

" mark add / del tgl
nnoremap <leader>ro :call Mark_tgl()<cr>

" mark del all
nnoremap <leader>rd :call Mark_del_all()<cr>

" mark, cursor mv mark forward
nnoremap <leader>rj ]`

" mark, cursor mv mark back
nnoremap <leader>rk [`

" 
" etc
" 

" buffer list
"nnoremap :xx :buffers

" inf char
"nnoremap xx ga

" wrap tgl
nnoremap :w :set wrap!

" tst
"nnoremap T :call Tst()<cr>

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
"nnoremap <space> <esc>
nnoremap <s-space> <esc>
"nnoremap <cr>    <esc>
nnoremap <bs>    <esc>

"nnoremap = <esc>
"nnoremap @ <esc>
"nnoremap ; <esc>
"nnoremap , <esc>
"nnoremap . <esc>
"nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>
nnoremap ^ <esc>
nnoremap / <esc>
"nnoremap \ <esc>
nnoremap ? <esc>

"nnoremap ! <esc>
"nnoremap " <esc>
"nnoremap ` <esc>
"nnoremap # <esc>
"nnoremap $ <esc>
"nnoremap % <esc> " ?
nnoremap & <esc>
nnoremap ( <esc>
"nnoremap < <esc>
"nnoremap > <esc>

nnoremap <c-tab> <nop>
nnoremap <c-space> <esc>
nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non ?
"nnoremap <c-*> <esc> " non ?
"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-/> <esc> " non ?
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

"nnoremap 0 <esc>
"nnoremap a <esc>
nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
"nnoremap f <esc>
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
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
nnoremap x <esc>
"nnoremap y <esc>
nnoremap z <esc>

"nnoremap A <esc>
nnoremap B <esc>
nnoremap C <esc>
nnoremap D <esc>
"nnoremap E <esc>
nnoremap F <esc>
nnoremap G <esc>
"nnoremap H <esc>
"nnoremap I <esc>
"nnoremap J  <esc>
"nnoremap K  <esc>
"nnoremap L <esc>
nnoremap M <esc>
"nnoremap N <esc>
"nnoremap O <esc>
nnoremap Q <esc>
"nnoremap P <esc>
"nnoremap R <esc>
nnoremap S <esc>
nnoremap T <esc>
"nnoremap U <esc>
"nnoremap W <esc>
nnoremap V <esc>
nnoremap X <esc>
"nnoremap Y <esc>

"nnoremap <c-a> <esc>
nnoremap <c-b> <esc>
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
"nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"nnoremap <c-w> <esc>
nnoremap <c-x> <esc>
"nnoremap <c-y> <esc>
nnoremap <c-z> <esc>

"nnoremap ga <esc>
nnoremap gb <esc>
"nnoremap ge <esc>
"nnoremap gf <esc>
nnoremap gg <esc>
"nnoremap gh <esc>
nnoremap gi <esc>
"nnoremap gj <esc>
"nnoremap gk <esc>
nnoremap gl <esc>
"nnoremap gm <esc>
nnoremap gn <esc>
"nnoremap go <esc>
"nnoremap gp <esc>
"nnoremap gs <esc>
"nnoremap gt <esc>
"nnoremap gu <esc>
nnoremap gv <esc>
nnoremap gw <esc>
nnoremap gy <esc>

" mode normal end

" 
" mode visual
" 

" mode ch line
vnoremap i V

" mode ch visual box
vnoremap v <c-v>

" file srch ( fzf )
"vnoremap xx :Files <cr> " non

" 
" cursor mv
" 

" cursor mv slctd edge tgl
vnoremap y o

" cursor mv char forward
vnoremap l l

" cursor mv char back
vnoremap <c-o> h

" cursor mv word - forward
vnoremap f :call Slctd__expnd_word_f()<cr>

" cursor mv word - back
"vnoremap xx b
"vnoremap xx bh
"vnoremap xx Bh

" cursor mv line end
vnoremap <c-y> :call V_cursor__mv_line_end()<cr>

" cursor mv slctd reduce dlm _ l
vnoremap _     of_lo

" cursor mv slctd reduce dlm _ r
vnoremap <c-_> F_h

" cursor mv space - forward ( word pre )
"vnoremap xx wh

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv bracket pair
vnoremap <c-l> %

" cursor mv bracket out back
"vnoremap xx [{

" cursor mv bracket fnc back
"vnoremap xx [m

" cursor mv file edge back    ( file begin )
vnoremap gk gg0

" cursor mv file edge forward ( file end   )
vnoremap gj G$l

" 
" slct / ynk / paste
" 

" slctd expnd
vnoremap <c-i> :call Slctd__expnd()<cr>

" slctd expnd bracket forward
vnoremap I     :call Slctd__expnd_bracket_f()<cr>

" slct all
vnoremap a :call Slct_all()<cr>

" slct re " tst
"vnoremap xx :call V_slctd_re()<cr>

" ynk slctd
vnoremap o :call V_ynk()<cr>
vnoremap c :call V_ynk()<cr>

" ynk slctd add
vnoremap O :call V_ynk__add_slctd()<cr>

" clipboard slctd
"vnoremap xx "+y

" paste
"vnoremap p xx
vnoremap <expr> p
\ mode() == '<c-v>' ? '"zd"aP'              :
\ mode() == 'v'     ? '"zd"aP'              :
\                     ':call V_paste()<cr>'

" paste clipboard
vnoremap P :call V_paste__clipboard()<cr>

" paste visual box
"vnoremap xx I<c-r>0<esc>

" 
" undo
" 
vnoremap h <esc>u

" 
" edit
" 

" ins | cut & ins
"vnoremap <space> xx
vnoremap <expr> <space>
\ mode() == '<c-v>' ? 'I' :
\                     'c'

" cut & ins
"vnoremap <leader><space> "zc

" ins $
"vnoremap Y xx
vnoremap <expr> Y
\ mode() == '<c-v>' ? '$A'      :
\                     '<c-v>$A'

" ins space
"vnoremap L xx
vnoremap <expr> L
\ mode() == '<c-v>' ? 'I <esc>gv' :
\ mode() == 'v'     ? '>gv'       :
\                     ''

" ins comment 1
vnoremap ! :call V_ins_cmnt_1()<cr>

" ins comment mlt
vnoremap & :call V_ins_cmnt_mlt()<cr>
"vnoremap $ :call V_ins_cmnt_mlt()<cr>

" ins date time
vnoremap * x:call Ins_da()<cr>

" ins day of week
"vnoremap xx x:call Ins_week()<cr>

" ins time
"vnoremap xx c<c-r>=strftime("%H:%M")<cr><esc>
"vnoremap xx c<c-r>=strftime('%H:%M')<cr><esc>

" ins at selected edge
vnoremap :r :<c-u>SlctdEdgeIns 
vnoremap :b :<c-u>SlctdEdgeIns 

" del str > ynk
"vnoremap d xx
vnoremap <expr> d
\ mode() == '<c-v>' ? '"ad:let @+ = @a<cr>gv' :
\                     '"ad:let @+ = @a<cr>'
"\ mode() == '<c-v>' ? '"0d:let @+ = @0<cr>gv' :
"\                     '"0d:let @+ = @0<cr>'
"vnoremap xx :call V_slctd__del()<cr> " dev tst

" del str > ynk not
"vnoremap s xx
vnoremap <expr> s
\ mode() == '<c-v>' ? '"zdgv' :
\                     '"zx'
"vnoremap s "zx

" del str pad space
vnoremap S "aygvr gv
"vnoremap S :call V_slctd__space()<cr> " fnc dev doing

" del cr
"vnoremap xx J

" del line top space
vnoremap M :call V_line_top_space__del()<cr>

" del line end space
vnoremap m :call V_line_end_space__del()<cr>

" del cursor f space
vnoremap K :call V_cursor_f_space__del()<cr>

" mv str back
vnoremap <c-w> :call Slctd_str__mv('h')<cr>

" mv str forward
vnoremap <c-e> :call Slctd_str__mv('l')<cr>

" mv str line top
"vnoremap xx :call Slctd_str__mv_line_top()<cr>

" mv str line end
"vnoremap xx :call Slctd_str__mv_line_end()<cr>

" mv line
"vnoremap xx :call V_mv_line('j')<cr>
"vnoremap xx :call V_mv_line('k')<cr>

" inc, dec
vnoremap = <c-a>gv
vnoremap - <c-x>gv

" num seq
vnoremap + g<c-a>

" indnt shift
vnoremap # >gv
vnoremap " <gv

" indnt crct
vnoremap ; =gv

" indnt tab   > space
vnoremap :e :call V_indnt_2_space()
"vnoremap :e :call V_indnt_2_space()<cr>

" indnt space > tab
vnoremap :E :call V_indnt_2_tab()<cr>

" upper / lower tgl
vnoremap u ~gv

" upper all
vnoremap U Ugv

" lower all
vnoremap <c-u> ugv

" 
" srch
" 

" srch cmd
vnoremap <leader>i "zy/<c-r>z

" srch forward ( srch rpl skip )
vnoremap <c-n> :call V_srch_slct('f')<cr>

" srch back
"vnoremap xx    :call V_srch_slct('b')<cr>

" srch str set
vnoremap n :call V_srch_str__slctd_str(v:false)<cr>
vnoremap e :call V_srch_str__slctd_str(v:false)<cr>

" srch str set ( word 1 )
vnoremap N :call V_srch_str__slctd_str(v:true)<cr>
vnoremap E :call V_srch_str__slctd_str(v:true)<cr>

" srch rpl one > ynk, nxt
vnoremap <c-p> :call Slctd_rpl_srch_nxt()<cr>

" srch rpl all > ynk
"vnoremap :xx :s//<c-r>0/gc

" rpl ( cmd )
vnoremap :s :Rpl 

" rpl ( cmd )
vnoremap <c-m> :call V_srch_str__cr()<cr>

" 
" grep
" 

" grep buf ( fzf )
vnoremap <leader>k :call V_grep_buf()<cr>

" grep ( fzf )
vnoremap <leader>o "zy:Rg <c-r>z<cr>

" grep ( fzf )  -  ( win )
" try
"vnoremap <leader>o "zy:GitbashFzfRg <c-r>z

" grep func def ( fzf )
"vnoremap <leader>xx "zy:Rg <c-r>z<cr>func

" grep [rg]   ( read )
vnoremap :g "zy:GrepStr <c-r>z
vnoremap :G "zy:GrepWrd <c-r>z

" tag jmp
vnoremap t :call V_tag_jmp()<cr>

" opn .vimrc
"vnoremap gh <esc>:call Opn_vimrc()<cr>

" opn app
vnoremap go :call V_opn_app()<cr>

" opn brwsr
"vnoremap gx <plug>(openbrowser-smart-search)

" opn ggl srch
vnoremap ggl :call V_opn_ggl_srch()<cr>

" opn youtube video_id
"vnoremap gy :call V_opn_yt()<cr>

" trns
vnoremap r  :call V_trns()<cr>

" tst
vnoremap T :call Tst()<cr>

" 
" nop
" 
"vnoremap <space> <nop>

" 
" esc
" 
vnoremap @ <esc>
"vnoremap * <esc>
vnoremap / <esc>
"vnoremap \ <esc>
"vnoremap ! <esc>
"vnoremap " <esc>
"vnoremap # <esc>
vnoremap $ <esc>
"vnoremap % <esc> " ?
"vnoremap & <esc>
"vnoremap _ <esc>
vnoremap ? <esc>
vnoremap ( <esc>
"vnoremap ; <esc>
vnoremap < <esc>
vnoremap > <esc>
"vnoremap = <esc>
"vnoremap + <esc>
vnoremap , <esc>
vnoremap . <esc>

"vnoremap a <esc>
vnoremap b <esc>
"vnoremap c <esc>
"vnoremap d <esc>
"vnoremap e <esc>
"vnoremap f <esc>
vnoremap g <esc>
"vnoremap h <esc>
"vnoremap i <esc>
"vnoremap l <esc>
"vnoremap m <esc>
"vnoremap n <esc>
"vnoremap o <esc>
"vnoremap p <esc>
vnoremap q <esc>
"vnoremap r <esc>
"vnoremap s <esc>
"vnoremap t <esc>
"vnoremap u <esc>
"vnoremap v <esc>
vnoremap w <esc>
vnoremap x <esc>
"vnoremap y <esc>

vnoremap A <esc>
vnoremap B <esc>
vnoremap C <esc>
vnoremap D <esc>
"vnoremap E <esc>
vnoremap F <esc>
vnoremap H <esc>
"vnoremap I <esc>
vnoremap J <esc>
"vnoremap K <esc>
"vnoremap L <esc>
"vnoremap M <esc>
"vnoremap N <esc>
"vnoremap O <esc>
"vnoremap P <esc>
vnoremap Q <esc>
vnoremap R <esc>
"vnoremap S <esc>
"vnoremap T <esc>
"vnoremap U <esc>
vnoremap V <esc>
vnoremap W <esc>
vnoremap X <esc>
"vnoremap Y <esc>

"vnoremap <c-_> <esc>

vnoremap <c-a> <esc>
"vnoremap <c-b> <esc>
"vnoremap <c-c> <esc>
vnoremap <c-d> <esc>
"vnoremap <c-e> <esc>
vnoremap <c-f> <esc>
vnoremap <c-h> <esc>
"vnoremap <c-i> <esc>
"vnoremap <c-l> <esc>
"vnoremap <c-m> <esc>
"vnoremap <c-n> <esc>
"vnoremap <c-o> <esc>
"vnoremap <c-p> <esc>
vnoremap <c-q> <esc>
vnoremap <c-r> <esc>
vnoremap <c-s> <esc>
"vnoremap <c-u> <esc>
vnoremap <c-v> <esc>
"vnoremap <c-w> <esc>
vnoremap <c-x> <esc>
"vnoremap <c-y> <esc>

vnoremap gb <esc>
vnoremap gg <esc>
vnoremap gh <esc>
vnoremap gi <esc>
"vnoremap gj <esc>
"vnoremap gk <esc>
"vnoremap go <esc>
vnoremap gp <esc>
vnoremap gs <esc>
vnoremap gt <esc>
vnoremap gy <esc>

" 
" mode insert
" 

" quit, esc
"inoremap <esc> xx
inoremap <expr> <esc>
\ pumvisible()          ? '<c-e>'  :
\ Is_cursor_line_top0() ? '<esc>'  :
\                         '<esc>l'
inoremap <c-c> <esc>

" cursor mv line in
inoremap <c-a> <c-o>0
"inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$

" cursor mv char forward
inoremap <c-l> <c-o>l
inoremap <c-f> <c-o>l

" cursor mv char back
"inoremap <c-o> xx
inoremap <expr> <c-o>
\ pumvisible() ? '<c-y>'  :
\                '<c-o>h'
inoremap <c-s> <c-o>h

" cursor mv word forward
"inoremap xx <c-o>e<c-o>l

" cursor mv word back
"inoremap xx <c-o>b

" cursor mv d
inoremap <c-n> <c-o>j

" cursor mv u
inoremap <c-p> <c-o>k

" ins cr
inoremap <c-m> <cr>

" ins tab
inoremap <tab> <c-v><tab>

" ins markdown cr
"inoremap xx <space><space>

" ins complete
"inoremap <c-y> xx
inoremap <expr> <c-y>
\ pumvisible() ? '<c-e>' :
\                '<c-n>'

" ins bracket
"inoremap <c-j> xx
inoremap <expr> <c-j>
\ pumvisible() ? '<c-n>'                 :
\                '<c-r>=I_bracket()<cr>'

" ins symbol
inoremap <c-q> <c-r>=I_symbol()<cr>
inoremap <c-_> <c-r>=I_symbol()<cr>
inoremap <c-^> <c-r>=I_symbol()<cr>
inoremap <c--> <c-r>=I_symbol()<cr>
inoremap <c-\> <c-r>=I_symbol()<cr>

" ins markdown
inoremap <c-u> <c-r>=I_markdown()<cr>

" ins num
"inoremap xx <c-r>=I_week()<cr>

" ins num
"inoremap xx <c-r>=I_num()<cr>

" ins register
"inoremap xx <c-r>=I_reg()<cr>

" ins lua reserved word
"inoremap xx <c-r>=I_lua_reserved()<cr>

" ins ooq ( lua )
"inoremap xx <c-r>=I_ooq()<cr>

" ins bracket
"inoremap < <><c-o>h
"inoremap ( ()<c-o>h
"inoremap { {}<c-o>h
"inoremap [ []<c-o>h
"inoremap " ""<c-o>h
"inoremap ' ''<c-o>h

" del char forward
inoremap <c-d> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word back
inoremap <c-w> <c-w>

" del word forword
"inoremap <c-k> xx
inoremap <expr> <c-k>
\ pumvisible()           ? '<c-p>'   :
\ ! Is_cursor_line_end() ? '<c-o>dw' :
\                          ''

" del line
" non

" paste
"inoremap xx <c-r>0

" paste clipboard
inoremap <c-v> <c-r><c-o>+

" clr
"inoremap <expr> <esc> pumvisible() ? '<c-e>'  : ''
"inoremap <expr> <c-w> pumvisible() ? '<c-e>'  : '<c-w>'

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

" 
" nop
" 

"inoremap <tab> <nop>
inoremap <s-tab> <nop>

"inoremap <c-_> <nop>
"inoremap <c-^> <nop>
"inoremap <c-\> <nop>
"inoremap <c--> <nop>
"inoremap <c-@> <nop> " non
"inoremap <c-,> <nop> " non
"inoremap <c-.> <nop> " non
"inoremap <c-:> <nop> " non
"inoremap <c-;> <nop> " non

inoremap <c-b> <nop>
"inoremap <c-g> <nop>
"inoremap <c-k> <nop>
"inoremap <c-n> <nop>
"inoremap <c-p> <nop>
"inoremap <c-q> <nop>
inoremap <c-r> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>

" 
" mode cmd
" 

" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>
"cnoremap <c-a> <home>
"cnoremap <c-e> <end>

" cursor mv char
cnoremap <c-s> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <s-left>
cnoremap <c-f> <s-right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word forward
"cnoremap ?? non ? idea <s-right><c-w>
cnoremap <c-k> <del>

" del word back
cnoremap <c-w> <c-w>

" del in line back
cnoremap <c-u> <c-u>

" paste
cnoremap <c-v> <c-r>0

" history
"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

" cmdline win
cnoremap <c-_> <c-f>

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

" 
" mode term
" 

" term > normal
tnoremap <c-_> <c-\><c-n>

" 
" leader esc
" 

"nnoremap <leader>c <esc>
"nnoremap <leader>f <esc>
nnoremap <leader>h <esc>
"nnoremap <leader>j <esc>
"nnoremap <leader>l <esc>
nnoremap <leader>m <esc>
"nnoremap <leader>n <esc>
"nnoremap <leader>p <esc>
nnoremap <leader>r <esc>
"nnoremap <leader>u <esc>
nnoremap <leader>y <esc>

vnoremap <leader>u <esc>
vnoremap <leader>y <esc>


" 
" etc
" 

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  exe "set <xUp>=\e[1;*A"
  exe "set <xDown>=\e[1;*B"
  exe "set <xRight>=\e[1;*C"
  exe "set <xLeft>=\e[1;*D"
end

" 
" quickfix
" 

"packadd Cfilter

autocmd QuickFixCmdPost grep,vimgrep tab cw


" 
" plugin  #bgn#
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jacquesbh/vim-showmarks'
Plug 'mattn/vim-molder'
"Plug 'mattn/vim-molder-operations'
"Plug 'tyru/open-browser.vim'
"Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" do
" :PlugInstall
" or
" :PlugClean

" 
" fzf
" 

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {
\  'ctrl-o': 'tab drop',
\  'ctrl-s': 'backward-char',
\ }
"\  'ctrl-o': 'enter',

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

" grep ( rg )

" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   "rg "
\   . " --color=always "
\   . " --line-number "
\   . " --smart-case "
\   . " --no-multiline "
\   . " --no-heading "
\   . " --hidden "
\   . " --no-ignore "
\   . " -g '!.git' "
\   . " -- ".shellescape(escape(<q-args>, '().$')),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )

"\   . " -g '*.txt' "
"\   . " -g '*.md' "
"\   . " -g '*.lua' "
"\   . " -g '*.html' "
"\   . " -g '*.js' "
"\   . " -g '*.json' "
"\   . " -g '*.css' "
"\   . " -g '*.sh' "
"\   . " -g '*.fish' "
"\   . " -g '*.tpl' "
"\   . " -g '*.toml' "
"\   . " -g '*.swp' "
"\   . " -g '*.font' "
"\   . " -g '*.script' "
"\   . " -g '*.gui_script' "
"\   . " -g '*.tilemap' "
"\   . " -g '*.tilesource' "
"\   . " -g '*.atlas' "
"\   . " -g '*.sprite' "
"\   . " -g '*.collectionfactory' "
"\   . " -g '*.collection' "
"\   . " -g '*.factory' "
"\   . " -g '*.collisionobject' "
"\   . " -g '*.go' "
"\   . " -g '*.gui' "
"\   . " -g '*.label' "
"\   . " -g '*.sound' "
"\   . " -g '*.camera' "

" grep buf
func! N_grep_buf() abort
  
  exe 'BLines '
endfunc

func! V_grep_buf() abort

  call V_srch_str__slctd_str(v:false)
  exe 'BLines ' . escape(@z, '.*~')
endfunc

command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(
\   <q-args>,
\   {'options': ['--no-sort', '--exact']},
\   <bang>1
\ )

" files
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" file history
command! -bang -nargs=* FileHstry
\ call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" cmd history
command! -bang -nargs=* CmdHstry
\ call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" srch history
command! -bang -nargs=* SrchHstry
\ call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" rgstr history
command! -bang -nargs=* RgstrHstry
\ call Rgstr_fzf()

func! Rgstr_fzf() abort
  
  let l:rgstr_info = execute(':reg')->split("\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
  \   {
  \     'source': l:rgstr_info,
  \     'sink'  : funcref('Ins_rgstr_by_rgstr_info'),
  \     'window': '-tabnew'
  \   }
  \ )
endfunc

func! Ins_rgstr_by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = strcharpart(a:rgstr_info, 5, 2) " todo refactoring
  call Normal(l:rgstr . 'P')
endfunc

" jmp lst

command! -bang -nargs=* JmplstFzf
\ call Jmplst_fzf()

func! Jmplst_fzf() abort
  
  call fzf#run(
  \   {
  \     'source' : Jmplst_line_info(),
  \     'sink'   : funcref('Cursor__mv_by_line_info'),
  \     'window' : '-tabnew',
  \     'options': ['--reverse'],
  \   }
  \ )
  "\     'options': ['--no-sort'],
endfunc

func! Jmplst() abort

  let l:jmplst_tmp = getjumplist()[0]
  "echo l:jmplst_tmp

  let l:buf_num_key_prefix = 'key_'
  let l:jmplst = {}
  for _jmplst_tmp in l:jmplst_tmp

    let l:_buf_num_key = l:buf_num_key_prefix . l:_jmplst_tmp['bufnr']

    if ! has_key(l:jmplst, l:_buf_num_key)
      let l:jmplst[l:_buf_num_key] = []
    endif

    call add(l:jmplst[l:_buf_num_key], l:_jmplst_tmp)
  endfor

  for _buf_num_key in keys(l:jmplst)

    call sort(l:jmplst[l:_buf_num_key], 'Jmplst_cmp')
  endfor

  let l:buf_num_key = l:buf_num_key_prefix . Buf_num()
  let l:r_jmplst    = get(l:jmplst, buf_num_key, [])
  "echo l:r_jmplst

  return l:r_jmplst
endfunc

func! Jmplst_line_info() abort

  let l:jmplst = Jmplst()

  let l:jmplst_line_info = []
  for _jmplst in l:jmplst

    let l:line_num  = l:_jmplst['lnum']
    let l:line_info = l:line_num . ' ' . getline(l:line_num)
    call add(l:jmplst_line_info, l:line_info)
  endfor
  "echo l:jmplst_line_info

  return l:jmplst_line_info
endfunc

func! Jmplst_cmp(jmplst1, jmplst2) abort

  if     a:jmplst1['lnum'] >  a:jmplst2['lnum']
    let l:ret =  1
  elseif a:jmplst1['lnum'] == a:jmplst2['lnum']
    let l:ret =  0
  else
    let l:ret = -1
  endif

  return l:ret
endfunc

" mark
command! -bang -nargs=* Mark
\ call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)

" ctags ( fzf )

"nnoremap xx :Tags <c-r><c-w><cr>
"vnoremap xx "zy:Tags <c-r>z<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)

set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap xx :!sh sh/ctags.sh

" plugin  #end#

"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o


" 
" vim script fnc
" 

" primitive

func! Exe(cmd) abort

  exe a:cmd
endfunc

func! Normal(cmd) abort

  call Exe('normal! ' . a:cmd)
endfunc

func! Sys_cmd(sys_cmd) abort

  return system(a:sys_cmd)

  "let l:cmd = '! ' . a:sys_cmd
  "call Exe(l:cmd)
endfunc

func! Col() abort " crnt

  return col('.')
endfunc

func! Pos() abort

  let l:pos = getpos('.')
  return l:pos
endfunc

func! Save() abort
  
  call Exe('w')
endfunc

command! -nargs=0 Dpl call Slf__dpl()

func! Slf__dpl() abort
  
  let l:sys_cmd = 'dpl ' . Slf_path()
  call Sys_cmd(l:sys_cmd)
endfunc

command! -nargs=1 Mv call Slf__mv(<q-args>)

func! Slf__mv(file_name_aft) abort
  
  let l:file_path_bfr = Slf_path()

  let l:sys_cmd = 'str_mv_f ' . l:file_path_bfr . ' ' . a:file_name_aft
  let l:file_path_aft = Sys_cmd(l:sys_cmd)

  let l:sys_cmd = 'mv ' . l:file_path_bfr . ' ' . l:file_path_aft
  call Sys_cmd(l:sys_cmd)

  let l:cmd = 'file ' . l:file_path_aft " save file_path ch
  call Exe(l:cmd)
endfunc

func! Slf_path() abort
  
  let l:path = expand('%:p')
  return l:path
endfunc

func! Slf_dir() abort

  let l:dir = expand('%:p:h')
  return l:dir
endfunc

func! Ynk__clr() abort

  let @a = ''
  "let @0 = ''
endfunc

func! Rgstr__clr() abort

  let @0 = ''
  "let @a = ''
endfunc

func! Int_2_str(num) abort

  let l:num_str = printf('%o', a:num)
  return l:num_str
endfunc

" file type cnd

func! Is_file_type(type) abort

  if &filetype == a:type
    return v:true
  else
    return v:false
  endif
endfunc

" char

func! Char__rpl(rpl) abort

  call Normal('r' . a:rpl)
endfunc

func! N_char__tgl() abort

  let l:c   = Cursor_c_char()
  let l:rpl = Char__tgl1(l:c)

  if Is_str_emp(l:rpl)
    call Normal('v~')
    return
  endif

  call Char__rpl(l:rpl)
endfunc

func! N_char__tgl2() abort " use not

  let l:c   = Cursor_c_char()
  let l:rpl = Char__tgl_trn(l:c)

  if Is_str_emp(l:rpl)
    call Normal('v~')
    return
  endif

  call Char__rpl(l:rpl)
endfunc

func! Char__tgl1(c) abort

  "let l:rpl = Char__tgl_bracket(a:c)
  let l:rpl = Char__tgl_trn(a:c)

  "if l:rpl != ''
  if ! Is_str_emp(l:rpl)
    return l:rpl
  endif

  let l:rpl = Char__tgl_etc(a:c)
  "if l:rpl != ''
  if ! Is_str_emp(l:rpl)
    return l:rpl
  endif

  return l:rpl
endfunc

func! Char__tgl_bracket(c) abort " use not

  let l:rpl = ''

  if     a:c == '('
    let l:rpl = '['
  elseif a:c == ')'
    let l:rpl = ']'

  elseif a:c == '['
    let l:rpl = '{'
  elseif a:c == ']'
    let l:rpl = '}'

  elseif a:c == '{'
    let l:rpl = '<'
  elseif a:c == '}'
    let l:rpl = '>'

  elseif a:c == '<'
    let l:rpl = '('
  elseif a:c == '>'
    let l:rpl = ')'
  endif

  return l:rpl
endfunc

func! Char__tgl_etc(c) abort

  let l:rpl = ''

  if     a:c == '/'
    let l:rpl = '-'
  elseif a:c == '-'
    let l:rpl = '\'
  elseif a:c == '\'
    let l:rpl = '|'
  elseif a:c == '|'
    let l:rpl = '/'

  elseif a:c == '"'
    let l:rpl = "'"
  elseif a:c == "'"
    let l:rpl = '`'
  elseif a:c == "`"
    let l:rpl = '"'

  elseif a:c == '*'
    let l:rpl = '+'
  elseif a:c == '+'
    let l:rpl = '*'

  elseif a:c == ','
    let l:rpl = '.'
  elseif a:c == '.'
    let l:rpl = ','

  elseif a:c == ';'
    let l:rpl = ':'
  elseif a:c == ':'
    let l:rpl = ';'

  elseif a:c == '?'
    let l:rpl = '!'
  elseif a:c == '!'
    let l:rpl = '?'

  "elseif a:c ==# 'T'
  "  let l:rpl = 'f'
  "elseif a:c ==# 'F'
  "  let l:rpl = 't'

  "elseif a:c ==# 'L'
  "  let l:rpl = 'r'
  "elseif a:c ==# 'R'
  "  let l:rpl = 'l'

  "elseif a:c ==# 'X'
  "  let l:rpl = 'y'
  "elseif a:c ==# 'Y'
  "  let l:rpl = 'x'

  "elseif a:c ==# 'I'
  "  let l:rpl = 'o'
  "elseif a:c ==# 'O'
  "  let l:rpl = 'i'
  endif

  return l:rpl
endfunc

func! Char__tgl_trn(c) abort
  
  let l:rpl = ''

  if     a:c == '<'
    let l:rpl = '>'
  elseif a:c == '>'
    let l:rpl = '<'

  elseif a:c == '{'
    let l:rpl = '}'
  elseif a:c == '}'
    let l:rpl = '{'

  elseif a:c == '['
    let l:rpl = ']'
  elseif a:c == ']'
    let l:rpl = '['

  elseif a:c == '('
    let l:rpl = ')'
  elseif a:c == ')'
    let l:rpl = '('
  endif

  return l:rpl
endfunc

" char cnd

func! Is_char_symbol(char) abort

  let l:ret = v:false

  if a:char !~ '\s' && a:char !~ '\w'
    let l:ret = v:true
  endif

  return l:ret
endfunc

" str

func! Str_l_char(str) abort
  
  let l:l_idx = 0
  let l:str_l = a:str[l:l_idx]
  "echo l:str_l
  return l:str_l
endfunc

func! Str_r_char(str) abort
  
  let l:r_idx = Str_len(a:str) - 1
  let l:str_r = a:str[l:r_idx]
  "echo l:str_r
  return l:str_r
endfunc

func! Str_len(str) abort " alias

  return strchars(a:str)
endfunc

func! Str_srch(...) abort " alias

  let l:str =                a:1
  let l:ptn =                a:2
  let l:idx = ( a:0 >= 3 ) ? a:3 : v:null

  let l:r_idx = match(l:str, l:ptn, l:idx)
  return l:r_idx " -1 : match not
endfunc

func! Str_srch_end(str, ptn) abort " alias

  let l:idx = matchend(a:str, a:ptn)
  return l:idx
endfunc

" str rpl

func! Str__rpl(str, srch, rpl) abort " alias

  l:r_str = substitute(a:str, a:srch, a:rpl)
  return l:r_str
endfunc

func! Str_path_win__rpl_unix(str) abort

  let l:str = a:str

  let l:str = Str__rpl(l:str, 'C:', '/c')
  let l:str = Str__rpl(l:str, 'c:', '/c')

  let l:str = Str__rpl(l:str, '\', '/')
  return l:str
endfunc

" str cnd

func! Is_str_emp(str) abort

  let l:ret = v:false

  if a:str == ''
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_str_eq_ptn(str, ptn) abort

  let l:ret = v:false

  if a:str =~ a:ptn
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_str_space(str) abort

  let l:ptn = '^\s\+$'
  let l:ret = Is_str_eq_ptn(a:str, l:ptn)
  return l:ret
endfunc

func! Is_str_num(num_str) abort

  let l:ptn = '^\d\+$'
  let l:ret = Is_str_eq_ptn(a:num_str, l:ptn)
  return l:ret
endfunc

" str mb

command! -range=% -nargs=0 MbCnv <line1>,<line2>call V_mb_cnv()

func! V_mb_cnv() range abort

  let l:sys_cmd = 'mb_cnv'
  call V_ins_sys_cmd_by_line_rng(l:sys_cmd, a:firstline, a:lastline)
endfunc

" cursor

func! Cursor_c_char() abort

  let l:c = getline('.')[col('.')-1]
  return l:c
endfunc

func! Cursor_l_char() abort

  let l:c = getline('.')[col('.')-2]
  return l:c
endfunc

func! Cursor_r_char() abort

  let l:c = getline('.')[col('.')]
  return l:c
endfunc

func! Cursor_word() abort

  let l:word = expand('<cword>')
  return l:word
endfunc

func! Cursor_filepath() abort

  if has('mac')
    let l:str = expand('<cfile>')
  else
    let l:str = Line_str()
  endif
  
  let l:str = trim(l:str)
  
  return l:str
endfunc

" cursor mv

func! Cursor__mv_by_line_num(line_num) abort

  if ! Is_str_num(a:line_num)
    return
  endif

  call Normal(a:line_num . 'G')
endfunc

func! Cursor__mv_by_line_info(line_info) abort
  
  let l:line_num = Line_info_line_num(a:line_info)
  call Cursor__mv_by_line_num(l:line_num)
endfunc

func! Cursor__mv_by_line_col(line_num, col) abort

  let l:line_num = (a:line_num == v:null) ? Line_num() : a:line_num
  
  call cursor(l:line_num, a:col)
endfunc

func! Cursor__mv_by_pos(pos) abort " use not
  
  call setpos('.', a:pos)
endfunc

func! Cursor__mv_line_top0() abort
  
  if Is_line_emp()
    return
  end

  call Normal('0')
endfunc

func! Cursor__mv_line_top1() abort

  if     Is_line_space()
    call Cursor__mv_line_end()

  elseif Is_line_markdown_itm()
    call Normal('^2l')
  else
    call Normal('^')
  end
endfunc

func! Cursor__mv_line_end() abort

  if ! Is_line_emp()
    call Normal('$l')
  end
endfunc

func! V_cursor__mv_line_end() abort

  call Slct_re_in_line_1()

  if ! Is_line_emp()

    call Normal('$h')
    "call Normal('g_')
  end
endfunc

func! Cursor__mv_char_f() abort

  call Normal('l')
endfunc

func! Cursor__mv_char_b() abort

  call Normal('h')
endfunc

func! Cursor__mv_word_f() abort

  if     Is_cursor_line_end() || Is_cursor_line_end_inr()

    call Cursor__mv_char_f()
    return

  elseif Is_line_str_side_r_space()

    call Cursor__mv_line_end()
    return
  endif

  let l:c_char = Cursor_c_char()
  let l:r_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:r_char =~ ' '
    call Normal('w')
  else
    call Normal('el')
  end
endfunc

func! Cursor__mv_word_b() abort
  
  let l:l_char = Cursor_l_char()

  if     Is_cursor_line_top0()
    call Cursor__mv_up_line_end()
    
  elseif Is_line_str_side_l_space()
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_line_top1()
    call Cursor__mv_line_top0()
    
  elseif Is_char_symbol(l:l_char)
    call Cursor__mv_char_b()
    
  else
    call Normal('b')
  end
endfunc

func! Cursor__mv_word_b_pre() abort " use not

  let l:c_char = Cursor_c_char()
  let l:l_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:l_char !~ ' '
    call Normal('gegel')
  else
    call Normal('gel')
  end
endfunc

func! Cursor__mv_up_line_end() abort

  call Normal('k')
  call Cursor__mv_line_end()
endfunc

func! Cursor__mv_line_top_or_new_line() abort

  if Is_cursor_line_top1()
    
    call Ins_line_emp()
    "call Indnt__crct()
  else
    call Cursor__mv_line_top1()
  end
endfunc

func! Cursor__mv_slctd_l() abort
  
  call Normal('`<')
endfunc

func! Cursor__mv_slctd_r() abort
  
  call Normal('`>')
endfunc

" cursor cnd

func! Is_cursor_line_end() abort

  if col('.') == Line_end_col()
    return v:true
  else
    return v:false
  end
endfunc

func! Is_cursor_line_end_inr() abort

  if col('.') == Line_end_col() - 1
    return v:true
  else
    return v:false
  end
endfunc

func! Is_cursor_line_top0() abort
  
  if col('.') == 1
    return v:true
  else
    return v:false
  end
endfunc

func! Is_cursor_line_top1() abort
  
  let l:pos_c = Pos()
  
  let l:col_c = col('.')
  
  call Cursor__mv_line_top1()
  let l:col_s1 = col('.')
  
  call setpos('.', l:pos_c)
  
  if l:col_c == l:col_s1
    return v:true
  else
    return v:false
  end
endfunc

" ins

func! Ins(str) abort

  let l:cmd = 'i' . a:str
  call Normal(l:cmd)
  call Cursor__mv_char_f()
  "call Normal('l')
endfunc

func! V_ins(str) range abort " todo cre

endfunc

func! Ins_mlt(str, num) abort

  if a:num == 0
    return
  endif

  let l:cmd = a:num.'i'.a:str
  call Normal(l:cmd)
endfunc

func! Ins_cr() abort

  let l:t_line_num = line('.')
  
  call Normal("i\<cr> ")
  call Normal('x')
  
  call Line_end_space__del(l:t_line_num)
  call Normal('j')
endfunc

func! Ins_space() abort

  call Normal('i ')
  "call Normal('l')
endfunc

func! Ins_hyphen() abort

  call Normal('i-')
  "call Ins('-')
endfunc

func! Ins_da() abort

  let l:da = strftime('%Y-%m-%d')
  call Ins(l:da)
endfunc

func! Ins_tm() abort

  let l:tm = strftime('%H:%M')
  call Ins(l:tm)
endfunc

func! Ins_dt() abort

  let l:dt = strftime('%Y-%m-%d.%H:%M')
  call Ins(l:dt)
endfunc

func! Ins_ts() abort

  let l:ts = strftime('%Y-%m-%d.%H:%M:%S')
  call Ins(l:ts)
endfunc

func! Ins_week() abort

  let l:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

  let l:week_num = strftime('%w')
  let l:week     = l:week_def[l:week_num]

  call Ins(l:week)
  "call Ins(' ' . l:week)
endfunc

func! Dots__() abort " todo dev, doing

  l:str = ' .. '
  l:line_str = Line_str()
  l:idx = Str_srch(l:line_str, l:str)

  if l:idx >= 0

    call Dots__crct()
  else

    call Ins_dots()
  endif
endfunc

let g:dots_put_col = 50

func! Ins_dots() abort

  let l:idx = 0
  let l:str = ''
  while l:idx < g:dots_put_col

    let l:str .= ' '

    let l:idx += 1
  endwhile
  let l:str .= '.. '

  let l:line_num = Line_num()
  call append(l:line_num, l:str)

  call Normal('$lvjhx')
endfunc

command! -nargs=* InsSysCmd call Ins_sys_cmd(<q-args>)

func! Ins_sys_cmd(sys_cmd) abort " read

  let l:is_line_num_eq_1 = Is_line_num_eq_1()

  if l:is_line_num_eq_1
    call Normal('O')
  else
    call Normal('k')
  endif

  let l:cmd = 'read ! ' . a:sys_cmd
  call Exe(l:cmd)

  if l:is_line_num_eq_1
    call Line__del_by_line_num(1)
  endif
endfunc

func! V_ins_sys_cmd(sys_cmd) abort " read

  let l:cmd = "'<,'> ! " . a:sys_cmd
  call Exe(l:cmd)
endfunc

func! V_ins_sys_cmd_by_line_rng(sys_cmd, lineS, lineE) abort " read

  let l:cmd = a:lineS . "," . a:lineE . " ! " . a:sys_cmd
  call Exe(l:cmd)
endfunc

command! -nargs=? -complete=dir Lf call Ins_lf(<q-args>)

func! Ins_lf(dir) abort

  let l:cmd = 'lf ' . trim(a:dir)
  call Ins_sys_cmd(l:cmd)
endfunc

" line

func! Line_num() abort " alias

  return line('.')
endfunc

func! Line_str() abort " alias

  return getline('.')
endfunc

func! Line_str_cursor_out_l() abort
  
  let l:line_l = getline('.')[:col('.')-2]
  return l:line_l
endfunc

func! Line_str_cursor_out_r() abort
  
  let l:line_r = getline('.')[col('.'):]
  return l:line_r
endfunc

func! Line_str_slctd_out_l() abort

  call Cursor__mv_slctd_l()

  let l:str = Line_str_cursor_out_l()
  return l:str
endfunc

func! Line_str_slctd_out_r() abort

  call Cursor__mv_slctd_r()

  let l:str = Line_str_cursor_out_r()
  return l:str
endfunc

func! Line_top0__ins(str) abort

  call Cursor__mv_line_top0()
  call Ins(a:str)
endfunc

func! Line_top1__ins(str) abort

  call Cursor__mv_line_top1()
  call Ins(a:str)
endfunc

let s:line_top_space_ptn = '^[ \t]*'

func! V_line_top_space__del() abort

  let l:rpl_cmd = 's/' . s:line_top_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

func! Line_end_col() abort

  let l:col = col('$')
  return l:col
endfunc

let s:line_end_space_ptn = '[ \t]*$'

func! Line_end_space__del(line_num) abort
  
  let l:rpl_cmd = a:line_num . 's/' . s:line_end_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

func! V_line_end_space__del() range abort

  for line_num in range(a:firstline, a:lastline)

    call Line_end_space__del(l:line_num)
  endfor
endfunc

func! V_line_end__padding() range abort " not use todo dev
  
  let l:char = ' '
  let l:w    = 75

  for line_num in range(a:firstline, a:lastline)
    
    call Cursor__mv_by_line_num(l:line_num)
    
    let l:len = l:w - Line_end_col()

    call Normal(l:len . 'A' . l:char)
  endfor
endfunc

func! Cursor_f_space__del() abort

  let l:c = Cursor_c_char()
  if l:c =~ '\s'
    "echo "del"
    call Slct_cursor_f_space()
    call Normal('"zd')
  else
    " nothing
    "echo "nothing"
  endif
endfunc

func! V_cursor_f_space__del() range abort

  "call Slct_re()
  call Slct_re_in_line_1()
  let l:col = Col()

  call Normal("\<esc>")

  for line_num in range(a:firstline, a:lastline)
    "echo l:line_num . ' ' . l:col
    call Cursor__mv_by_line_col(l:line_num, l:col)
    call Cursor_f_space__del()
  endfor
endfunc

func! Cursor_f_space__crct() abort

  call Normal('k')

  let l:c = Cursor_c_char()
  if l:c !~ '\s'
    call Normal('j')
    return
  endif

  call Slct_cursor_f_space()
  call Normal('"zy')

  call Normal('j')

  call Slct_cursor_f_space()
  call Normal('"yx')
  call Normal('"zP')
endfunc

" line ins

func! Ins_line(str) abort
  
  let l:line_num = Line_num() - 1
  call append(l:line_num, a:str)
  call Normal('k')
endfunc

func! Ins_line_emp() abort
  
  let l:str = ''
  call Ins_line(l:str)
endfunc

func! Ins_line_slf_path() abort
  
  let l:path = Slf_path()
  call Ins_line(l:path)
endfunc

func! Line__del() abort
  
  if Is_line_space()
    call Normal('"zdd')
  else
    call Normal('"add')
    "call Normal('"0dd')
    call Clipboard__ynk()
  endif
endfunc

func! V_line_del() abort " use not, todo mod
  
  "call Normal('"ad')
  "call Normal('gv"ad')
  
  call Normal('gvj')
  "call Normal('"ad')
  
  call Clipboard__ynk()
endfunc

func! Line__del_by_line_num(line_num) abort

  call deletebufline('%', a:line_num)
endfunc

func! V_mv_line(ud) range abort

  let l:mv_num   = a:lastline - a:firstline
  let l:line_num = l:mv_num + 1

  call Normal(a:firstline . 'G')
  call Normal(l:line_num . '"zdd')
  call Normal(a:ud)
  call Normal('"zP')
  call Normal('V')

  if l:mv_num >= 1
    call Normal(l:mv_num . 'j')
  endif
endfunc

" line cnd

func! Is_line_num_eq_1() abort

  if Line_num() == 1
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_line_emp() abort
  
  if Line_end_col() == 1
    return v:true
  else
    return v:false
  end
endfunc

func! Is_line_space() abort
  
  let l:str = Line_str()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

func! Is_line_str_side_l_space() abort

  let l:str = Line_str_cursor_out_l()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

func! Is_line_str_side_r_space() abort

  let l:str = Line_str_cursor_out_r()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

" line info

func! Line_info_line_num(line_info) abort

  let l:line_info = trim(a:line_info, ' ', 1)
  let l:line_num  = split(l:line_info, '\s\+')[0]
  return l:line_num
endfunc

" indnt

func! Indnt_col_by_c() abort

  let l:col = cindent(Line_num())
  return l:col
endfunc

func! Indnt__add(col) abort

  if a:col == 0
    return
  endif

  call Normal('0')

  if &expandtab " 1:'expandtab', 0:'noexpandtab'
    let l:char = ' '
    let l:col = a:col
  else
    let l:char = "\t"
    let l:col = a:col / 2
  endif
  call Ins_mlt(l:char, l:col)

  call Cursor__mv_line_top1()
endfunc

func! Indnt__del() abort " alias

  call Exe('left')
endfunc

func! Indnt__shft_l() abort

  call Normal('<<')
  call Cursor__mv_line_top1()
endfunc

func! Indnt__shft_r() abort

  let l:col = 2

  call Indnt__add(l:col)
endfunc

func! Indnt__crct() abort " nnoremap ; ==^

  let l:col = Indnt__crct_by_c()
  return l:col
endfunc

func! Indnt__crct_by_c() abort

  call Indnt__del()

  let l:col = Indnt_col_by_c()
  "echo l:col

  call Indnt__add(l:col)
  return l:col
endfunc

func! V_indnt_2_space() range abort

  let l:sys_cmd = '  expand   -t 2'
  call V_ins_sys_cmd(l:sys_cmd)
endfunc

func! V_indnt_2_tab() range abort

  let l:sys_cmd = 'unexpand   -t 2'
  call V_ins_sys_cmd(l:sys_cmd)
endfunc

" slct

func! Slct_word() abort

  let l:c = Cursor_c_char()

  if     l:c =~ '\w'
    call Normal('viw')

  elseif l:c =~ '\s'
    call Slct_cursor_f_space()
  else
    call Normal('v')
  endif
endfunc

func! Slct_cursor_f_space() abort

  let l:c = Cursor_c_char()
  if l:c !~ '\s'
    return
  endif
  "echo l:c

  call Normal('vwh')
endfunc

func! Slct_by_col(s_col, len) abort

  let l:e_col = a:len - 1

  call Slct_by_line_col(v:null, a:s_col, v:null, e_col)
endfunc

func! Slct_by_pos(s_pos, e_pos) abort " use not

  call Cursor__mv_by_pos(a:s_pos)
  call Normal('v')
  call Cursor__mv_by_pos(a:e_pos)
endfunc

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort

  let l:s_line = (a:s_line == v:null) ? Line_num() : a:s_line
  let l:e_line = (a:e_line == v:null) ? Line_num() : a:e_line

  call Cursor__mv_by_line_col(l:s_line, a:s_col)
  call Normal('v')
  call Cursor__mv_by_line_col(l:e_line, a:e_col)
endfunc

func! Slct_by_line_rng(line_num_fr, line_num_to) abort
  
  call Cursor__mv_by_line_num(a:line_num_fr)
  call Normal('V')
  call Cursor__mv_by_line_num(a:line_num_to)
endfunc

"func! Slct_re() abort " old , in line 1, use not, todo del
"
"  call Slct_re_in_line_1()
"endfunc

func! Slct_re_in_line_1() abort " in line 1

  call Normal('gv')
endfunc

func! Slct_re_box() range abort " todo dev
  
endfunc

func! V_slctd_re() abort " use not todo dev
  
  call Normal('gv')
  call Normal('"zy')
  call Normal('gv')

  "noautocmd normal! "zygv
endfunc

func! Slct_all() abort

  call Normal('ggVG')
endfunc

" slctd

func! Slctd_str() abort

  call Normal('gv"zy')
  return @z
endfunc

func! Slctd_str_len() abort

  let l:slctd_str = Slctd_str()
  let l:len       = Str_len(l:slctd_str)
  return l:len
endfunc

func! Slctd_l_col() abort

  call Cursor__mv_slctd_l()
  
  let l:col = Col()
  return l:col
endfunc

func! Slctd_r_col() abort

  call Cursor__mv_slctd_r()
  
  let l:col = Col()
  return l:col
endfunc

func! Slctd_l_pos() abort

  call Cursor__mv_slctd_l()
  
  let l:pos = Pos()
  return l:pos
endfunc

func! Slctd_r_pos() abort

  call Cursor__mv_slctd_r()
  
  let l:pos = Pos()
  return l:pos
endfunc

func! Slctd_l_out_char() abort

  call Cursor__mv_slctd_l()

  let l:l_char = Cursor_l_char()
  return l:l_char
endfunc

func! Slctd_r_out_char() abort

  call Cursor__mv_slctd_r()

  let l:r_char = Cursor_r_char()
  return l:r_char
endfunc

func! Slctd__expnd() abort " expnd lr

  let l:ptn = '[' . "'" . '")\]' . ']'

  call Cursor__mv_slctd_r()
  
  let l:line_r = Line_str_cursor_out_r()
  let l:r_idx  = Str_srch(l:line_r, l:ptn)
  
  if l:r_idx == -1
    return
  endif
  
  let l:c = l:line_r[l:r_idx]
  
  if l:c == '"' || l:c == "'"
    
    let l:line_l = Line_str_cursor_out_l()
    let l:l_idx = strridx(l:line_l, l:c)
    
    if l:l_idx == -1
      return
    endif
    
    let l:word_col_l =         l:l_idx + 2
    let l:word_col_r = Col() + l:r_idx
    
    if l:r_idx == 0
      let l:word_col_l -= 1
      let l:word_col_r += 1
    endif
    
    call Slct_by_line_col(v:null, l:word_col_l, v:null, l:word_col_r)
    
  elseif l:c == ')'
    call Normal('vi(')
    
  elseif l:c == ']'
    call Normal('vi[')
  endif

  call Normal('gv')
endfunc

func! Slctd__expnd_bracket_f() abort

  let l:bracket_ptn = '[' . "'" . '")}\]' . ']'
  
  let l:s_col = Slctd_l_col()
  
  let l:line_str_r = Line_str_slctd_out_r()
  let l:srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1

    call Normal('gv')
    return
  endif

  let l:len = l:s_col + Slctd_str_len() + l:srch_idx
  call Slct_by_col(l:s_col, l:len)
endfunc

func! Slctd__expnd_word_f() abort

  let l:slctd_str = Slctd_str()
  let l:slctd_r_out_char = Slctd_r_out_char()

  call Slct_re_in_line_1()

  if l:slctd_str =~ '\s' && l:slctd_r_out_char =~ '\s'

    call Normal('wh')
  else
    call Normal('e')
  endif
endfunc

func! Slctd_str__mv(lr) abort

  call Normal('gv"zx' . a:lr . '"zP')

  call Normal('v')

  let l:mv_len = Str_len(@z) - 1
  if l:mv_len <= 0
    return
  endif

  call Normal(l:mv_len . 'h')
endfunc

func! Slctd_str__mv_line_top() abort

  call Normal('gv"zx' . '^'  . '"zP')
endfunc

func! Slctd_str__mv_line_end() abort

  call Normal('gv"zx' . '$l' . '"zP')
endfunc

" slctd del

func! V_slctd__del() abort " use not todo dev tst

  "call V_slctd_re()

  call Normal('gv"ad')
  let @+ = @a
  "call Normal('gv"0d')
  "let @+ = @0
endfunc

func! V_slctd__space() range abort " use not, todo dev

  "call Slct_re_in_line_1()
  "or
  "call Slct_re_box()
  call Slct_by_line_rng(a:firstline, a:lastline)

  call Normal('"aygvr gv')
endfunc

" slctd ins

func! Slctd_l__ins(c) abort

  call Normal('`<')
  call Ins(a:c)
endfunc

func! Slctd_r__ins(c) abort

  call Normal('`>l')
  call Ins(a:c)
endfunc

command! -nargs=? SlctdEdgeIns call Slctd_edge__ins(<q-args>)

func! Slctd_edge__ins(c) abort " use not
  
  if     a:c   == '('
    let  l:c_l =  '('
    let  l:c_r =  ')'
  elseif a:c   == '['
    let  l:c_l =  '['
    let  l:c_r =  ']'
  elseif a:c   == '{'
    let  l:c_l =  '{'
    let  l:c_r =  '}'
  elseif a:c   == '<'
    let  l:c_l =  '<'
    let  l:c_r =  '>'
  else
    let  l:c_l = a:c
    let  l:c_r = a:c
  endif
  
  call Slctd_r__ins(l:c_r)
  call Slctd_l__ins(l:c_l)
endfunc

" slctd rpl, srch nxt slctd

func! Slctd_rpl_srch_nxt() abort " dir forward only
  
  call Slct_re_in_line_1()
  call Normal('"zd"aPlgn')
  "call Normal('"zd"0Plgn')
endfunc

" slctd cnd

func! Is_slctd_str_eq_srch_str() abort

  if Slctd_str() == @/
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_slctd_mode_v() abort " use not

  if mode() == 'v'
    return v:true
  else
    return v:false
  endif
endfunc

" ynk

func! Ynk__line() abort

  call Normal('"ayy')
  "call Normal('"0yy')

  call Clipboard__ynk()
  "call Normal('"+yy')
  
  "l:line_str = Line_str()
  "let @a = l:line_str
  "let @+ = l:line_str
endfunc

func! Ynk__line_all() abort

  let l:cmd = '%y' " todo rgstr a direct
  call Exe(l:cmd)

  let @a = @0
  call Clipboard__ynk()
endfunc

func! Ynk__slf_path() abort
  
  let l:path = Slf_path()

  let @a = l:path
  call Clipboard__ynk()
endfunc

func! Ynk__clipboard() abort

  let @a = @+
  "let @0 = @+
endfunc

func! V_ynk() abort

  call Normal('gv"ay')
  "call Normal('gv"0y')
  call Clipboard__ynk()
endfunc

func! V_ynk__add_slctd() abort

  call Normal('gv"Ay')
  call Clipboard__ynk()
endfunc

" paste

func! Paste() abort

  call Normal('"aP')
endfunc

func! V_paste() abort

  call Slct_re_in_line_1()
  call Normal('"zd')
  call Paste()
endfunc

func! Paste__clipboard() abort

  call Ynk__clipboard()
  call Paste()
endfunc

func! V_paste__clipboard() range abort

  call Ynk__clipboard()
  call V_paste()
endfunc

" clipboard

func! Clipboard__ynk() abort

  let @+ = @a
  "let @+ = @0
endfunc

" srch

func! Srch_str_word1(str)

  let l:str = a:str
  
  if Str_l_char(l:str) =~ '\w'
    let l:str = '\<' . l:str
  endif
  
  if Str_r_char(l:str) =~ '\w'
    let l:str =        l:str . '\>'
  endif
  
  "echo l:str
  return l:str
endfunc

func! Srch_str__(str, op_word1) abort
  
  let l:str  = escape(a:str, '.*~[]\^$')
  
  if a:op_word1
    let l:str = Srch_str_word1(l:str)
  endif

  if @/ == l:str
    return
  endif
  
  let g:srch_prv1 = @/

  let @/ = l:str

  call Normal('/' . l:str) " srch hstry add
endfunc

func! N_srch_str__(op_word1) abort

  let l:str = Cursor_word()
  
  call Srch_str__(l:str, a:op_word1)
endfunc

func! V_srch_str__slctd_str(op_word1) abort

  let l:str = Slctd_str()
  
  call Srch_str__(l:str, a:op_word1)
endfunc

func! N_srch_str__prv() abort

  if ! exists('g:srch_prv1')
    return
  endif

  let l:tmp = @/
  
  let @/ = g:srch_prv1
  
  let g:srch_prv1 = l:tmp
endfunc

func! Srch(dir) abort

  if     a:dir == 'f'
    let l:op = ''
  elseif a:dir == 'b'
    let l:op = 'b'
  endif

  let l:str = @/
  call search(l:str, l:op)
endfunc

func! V_srch(dir) abort " use not

  if Is_slctd_str_eq_srch_str()
    return
  endif

  call V_srch_str__slctd_str(v:false)
endfunc

func! Srch_slct(dir) abort

  if     a:dir == 'f'
    call Normal('gn')

  elseif a:dir == 'b'
    call Normal('gN')
  endif
endfunc

func! V_srch_slct(dir) abort " srch rpl skip

  if     a:dir == 'f'
    call Normal('`>lgn')

  elseif a:dir == 'b'
    call Normal('`<hgN')
  endif
endfunc

func! Srch_7_cursor__mv_nxt(dir) abort

  call Srch_slct(a:dir)
  call Normal("\<esc>")
  call Cursor__mv_char_f()
  "call Normal('l')
endfunc

func! Srch_char(dir, char) abort

  let @/ = '[' . a:char . ']'
  call Srch(a:dir)
endfunc

func! Srch_char_bracket(dir) abort

  let l:char_bracket = "'" . '")}\]'
  call Srch_char(a:dir, l:char_bracket)
endfunc

" srch __ rpl

func! V_srch_str__cr() range abort

  let l:rng = a:firstline . ',' . a:lastline

  let l:srch_str = @/

  let l:cmd = l:rng . 's/\(' . l:srch_str . '\)/\1\r/g'
  call Exe(l:cmd)
  "call Cmd(l:cmd)
endfunc

" srch __ rpl cmd

command! -range=% -nargs=* Rpl <line1>,<line2>call V_rpl(<f-args>)

func! V_rpl(srch, rpl) range abort

  let l:rng = a:firstline . ',' . a:lastline
  let l:cmd = l:rng . 's/' . a:srch . '/' . a:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

command! -range=% -nargs=* RplCr <line1>,<line2>call V_rpl_cr(<f-args>)

func! V_rpl_cr(srch) range abort

  let l:rng = a:firstline . ',' . a:lastline
  let l:rpl = a:srch . '\r'
  let l:cmd = l:rng . 'Rpl ' . a:srch . ' ' . l:rpl
  "echo l:cmd
  call Exe(l:cmd)
endfunc

" grep

func! Grep(opt, p_str) abort
  
  call Opn_grep_work()

  let l:rg_cmd = Rg_cmd(a:opt, a:p_str)
  call Ins_sys_cmd(l:rg_cmd)
endfunc

command! -nargs=? GrepStr call Grep_str(<q-args>)

func! Grep_str(str) abort
  
  call Grep(v:null, a:str)
endfunc

command! -nargs=? GrepWrd call Grep_wrd(<q-args>)

func! Grep_wrd(str) abort
  
  call Grep('-w'  , a:str)
endfunc

" cmnt

func! Ins_cmnt_1(line_top) abort

  let l:cmnt_1_def = {
  \ 'lua'       : '-- ',
  \ 'text'      : '# ' ,
  \ 'vim'       : '"'  ,
  \ 'fish'      : '#'  ,
  \ 'sh'        : '#'  ,
  \ 'css'       : '/* ',
  \ 'javascript': '// ',
  \ 'dflt'      : '# '
  \ }
  let l:str = get(l:cmnt_1_def, &filetype, l:cmnt_1_def['dflt'])

  call Normal(a:line_top . 'i' . l:str)
  
  call Normal('^') " or '0'
endfunc

func! V_ins_cmnt_1() range abort

  for line_num in range(a:firstline, a:lastline)

    call Normal(l:line_num . 'G')
    call Ins_cmnt_1('0')
  endfor
endfunc

func! Ins_cmnt_mlt_by_pos(pos) abort

  let l:cmnt_mlt_def = #{
  \  lua       : ['--[[' , '--]]'],
  \  html      : ['<!--' ,  '-->'],
  \  css       : ['/*'   ,  ' */'],
  \  javascript: ['/*'   ,  ' */'],
  \  dflt      : ['/*'   ,  ' */']
  \ }

  let l:str = get(l:cmnt_mlt_def, &filetype, l:cmnt_mlt_def['dflt'])

  "if has_key(l:cmnt_mlt_def, &filetype)
  "  let l:filetype = &filetype
  "else
  "  let l:filetype = 'dflt'
  "endif
  "let l:str = l:cmnt_mlt_def[l:filetype]

  if     a:pos == 'bgn'
    call Normal('O')
    call Normal('i' . l:str[0])

  elseif a:pos == 'end'
    call Normal('o')
    call Normal('i' . l:str[1])
  endif
endfunc

func! Ins_cmnt_mlt() abort

  call Ins_cmnt_mlt_by_pos('bgn')
  call Ins_cmnt_mlt_by_pos('end')
endfunc

func! V_ins_cmnt_mlt() range abort

  call Normal(a:lastline  . 'G')
  call Ins_cmnt_mlt_by_pos('end')

  call Normal(a:firstline . 'G')
  call Ins_cmnt_mlt_by_pos('bgn')
endfunc

" markdown

func! Ins_markdown_h() abort

  call Cursor__mv_line_top0()
  let l:top0_char = Cursor_c_char()

  let l:str = '#'

  if l:top0_char != l:str
    let l:str .= ' '
  endif

  call Ins(l:str)

  let l:ptn = '^#* '
  let l:idx = Str_srch_end(Line_str(), l:ptn) + 1
  call Cursor__mv_by_line_col(v:null, l:idx)
endfunc

func! Ins_markdown_cr() abort

  call Ins('  ')
endfunc

func! Ins_markdown_itm() abort

  if Is_line_markdown_itm()
    call Indnt__shft_r()
    return
  endif

  let l:col = Indnt__crct()

  let l:str = '- '
  "echo l:str
  call Line_top1__ins(l:str)
endfunc

func! Ins_markdown_code() abort

  let l:str = '```'
  call Ins_line(l:str)
endfunc

func! Char__tgl_markdown_chk() abort
  
  if Cursor_l_char() != '[' || Cursor_r_char() != ']'
    return
  endif
  
  let l:cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' '
    let l:rpl_char = 'x'
  else
    let l:rpl_char = ' '
  endif
  
  call Char__rpl(l:rpl_char)
endfunc

func! Markdown_2_html() abort
  
  if ! Is_file_type('markdown')
    return
  endif
  
  let l:path = expand('%')
  
  call Exe('! node ~/sh/nodejs/md_2_html.js ' . l:path)
  
  "call Opn_app(l:path . '.html')
endfunc

" markdown cnd

func! Is_line_markdown_itm() abort

  let l:ptn = '^\s*- '
  let l:str = Line_str()
  let l:idx = Str_srch(l:str, l:ptn)

  if l:idx == -1
    return v:false
  else
    return v:true
  endif
endfunc

" ???

"func! N_bracket_pair_tgl() abort
"
"  let l:col1 = col(".")
"  call N_bracket_tgl()
"
"  call Normal('%')
"  let l:col2 = col(".")
"
"  if l:col1 == l:col2
"    return
"  endif
"
"  call N_bracket_tgl()
"  call Normal('%')
"endfunc

" tag jmp

func! Tag_jmp(rg_out_line) abort
  
  let l:rg_out_line = trim(a:rg_out_line)

  "if l:rg_out_line == ''
  if Is_str_emp(l:rg_out_line)
    return
  end
  
  let l:rg_out_line = matchstr(l:rg_out_line, '\S\+')
  
  let l:rg_out_line_ar = Rg_out_parse(l:rg_out_line)
  let l:filename = l:rg_out_line_ar[0]
  let l:line_num = get(l:rg_out_line_ar, 1, 1)

  if ! filereadable(l:filename)
    return
  end

  call Exe('tab drop ' . l:filename)
  call Normal(l:line_num . 'G')
endfunc

func! N_tag_jmp() abort

  let l:base_buf_num = Buf_num()

  let l:str = Line_str()
  call Tag_jmp(l:str)

  call Exe('sbuffer ' . l:base_buf_num)
  call Normal('j')
endfunc

func! V_tag_jmp() range abort

  let l:base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(l:line_num)
    call Tag_jmp(l:line)
    call Exe('sbuffer ' . l:base_buf_num)
  endfor
endfunc

func! Rg_out_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  return l:ret
endfunc

" tmp file

func! Tmp_cre() abort " alias

  let l:tmp_path = Tmp_cre_sys()
  return l:tmp_path
endfunc

func! Tmp_cre_sys() abort

  let l:tmp_path = system('mktemp ')
  return l:tmp_path
endfunc

" opn file

command! -nargs=* -complete=file Opn call Opn(<q-args>)

func! Opn(filename) abort

  call Exe('tab drop ' . a:filename)
endfunc

func! Opn_tmp() abort

  let l:path = Tmp_cre()
  echo l:path
  call Opn(l:path)
endfunc

func! Opn_vimrc() abort

  let l:path = '~/.vimrc'
  call Opn(l:path)

  call Opn_vimrc_win()
endfunc

func! Opn_vimrc_win() abort

  if has('mac')

    let l:vimrc_win_dev_path = '~/doc/tech/github/vimrc/sh/git-bash/.vimrc_win'

    call Opn(l:vimrc_win_dev_path)

  else

    if ! filereadable(expand(g:vimrc_win_path))
      return
    endif

    call Opn(g:vimrc_win_path)


    if ! filereadable(expand(g:vimrc_win_env_path))
      return
    endif

    call Opn(g:vimrc_win_env_path)
  endif
endfunc

func! Opn_fish_cnf() abort

  let l:path = '~/.config/fish/config.fish'
  call Opn(l:path)
endfunc

command! -nargs=* OpnMan call Opn_man(<q-args>)

func! Opn_man(cmd) abort

  call Exe('tab new')
  call Exe('Man ' . a:cmd)
  call Exe('only')
endfunc

func! Opn_vim_key() abort

  let l:path = '~/doc/tech/vim/m.key.default.md'
  call Opn(l:path)
endfunc

let g:opn_memo_path = 'doc/memo.md'

func! Opn_memo() abort

  call Opn(g:opn_memo_path)
endfunc

let g:grep_work_path = 'doc/grep.lua'

func! Opn_grep_work() abort

  let l:file_type = getftype(g:grep_work_path)

  if Is_str_emp(l:file_type)

    call Opn(g:grep_work_path)
  else
    call Opn_tmp()
  endif
endfunc

" opn app

"command! -nargs=* OpnApp call Opn_app(<f-args>)

func! Opn_app(path) abort
  
  let l:path = a:path
  
  if has('mac')
    let l:res = system('open  ' . "'" . l:path . "'")
  else
    let l:path = Str_path_win__rpl_unix(l:path)
    let l:res = system('start ' . "'" . l:path . "'")
  endif
endfunc

func! V_opn_app() range abort

  for line_num in range(a:firstline, a:lastline)

    call Opn_app_by_line_path(l:line_num)
  endfor
endfunc

func! Opn_app_by_cursor_path() abort
  
  let l:path = Cursor_filepath()
  call Opn_app(l:path)
endfunc

func! Opn_app_by_line_path(line_num) abort
  
  "let l:path = Line_str_by_line_num()
  let l:path = getline(a:line_num)

  let l:path = trim(l:path)
  call Opn_app(l:path)
endfunc

func! Opn_app_by_slctd_str() abort
  
  let l:path = Slctd_str()
  let l:path = trim(l:path)
  call Opn_app(l:path)
endfunc

func! Opn_app_slf() abort

  let l:path = Slf_path()
  "echo l:path

  call Opn_app(l:path)
endfunc

func! Opn_brwsr()

  let l:url = 'https://www.google.com/'
  call Opn_app(l:url)
endfunc

func! Opn_ggl_srch(word) abort

  let l:url = 'https://www.google.com/search?q=' . a:word
  call Opn_app(l:url)
endfunc

func! V_opn_ggl_srch() abort

  let l:word = Slctd_str()
  let l:word = trim(l:word)
  call Opn_ggl_srch(l:word)
endfunc

func! Opn_yt(yt_video_id)

  let l:url = 'https://www.youtube.com/watch?v=' . a:yt_video_id
  call Opn_app(l:url)
endfunc

func! V_opn_yt() abort
  
  let l:yt_video_id = Slctd_str()
  let l:yt_video_id = trim(l:yt_video_id)
  call Opn_yt(l:yt_video_id)
endfunc

" etc

func! Buf_num() abort

  return bufnr('%')
endfunc

" mode insert ins lst

func! I_symbol() abort

  let l:lst = ['$', '%', '&', '\', '@', '?', '/']

  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_bracket() abort
  call complete( col('.'), [ '()', "''", '[]', '{}', '""', '<>' ])
  return ''
endfunc

func! I_markdown() abort
  call complete( col('.'), [ '``', '[]()', '```', '---' ])
  return ''
endfunc

func! I_week() abort
  let l:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]
  call complete(col('.'), l:week_def)
  return ''
endfunc

func! I_num() abort
  call complete(col('.'), ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
  return ''
endfunc

func! I_reg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc

func! I_lua_reserved() abort
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

func! I_ooq() abort
  call complete(col('.'), [
  \   '_s:',
  \   '_s._',
  \   'log._("", )',
  \   'log.pp("", )',
  \   '-- dbg',
  \   '--',
  \   '_.f',
  \   '_.t'
  \ ])
  return ''
"  \   'function',
"  \   'local',
"  \   'return',
"  \   'if _.t then return end',
"  \   'if  then',
"  \   'elseif  then',
"  \   'else',
"  \   'then',
"  \   'then return end',
"  \   'for key, val in pairs() do end',
"  \   'not',
"  \   'or',
"  \   'and',
"  \   'end',
"  \   'nil',
"  \   'alias',
endfunc

" undo clr

func! Undo_clr() abort

  let l:undolevels_old = &undolevels
  setlocal undolevels=-1
  exe "normal! a \<BS>\<Esc>"
  let &l:undolevels = l:undolevels_old
endfunc

" mark

let g:mark_alph_def = [
\   'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
\   'o','p','q','r','s','t','u','v','w','x','y','z'
\ ]

func! Mark_show_tgl() abort
  
  if exists('g:mark_show_flg') == 0
    
    let g:mark_show_flg = v:false
  endif
  
  if ! g:mark_show_flg
    
    exe 'DoShowMarks'
    let g:mark_show_flg = v:true
  else
    exe 'NoShowMarks'
    let g:mark_show_flg = v:false
  endif
endfunc

func! Mark_lst() abort
  
  let l:mark = []
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    let l:mark = add(l:mark, l:_mark['mark'][1])
  endfor
  "echo l:mark
  return l:mark
endfunc

func! Mark_alph_line() abort
  
  let l:line_c = line('.')
  
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    if l:_mark['pos'][1] == l:line_c
      "echo l:_alph
      return l:_alph
    endif
  endfor
  return ''
endfunc

func! Mark_tgl() abort
  
  let l:alph = Mark_alph_line()
  "echo 'Mark_tgl ' . l:alph
  
  "if l:alph == ''
  if Is_str_emp(l:alph)
    call Mark_add()
  else
    call Mark_del(l:alph)
  endif
  
  call Exe('DoShowMarks')
endfunc
  
func! Mark_add() abort
  
  let l:alph = Mark_alph_useabl()
  call Exe('mark ' . l:alph)
endfunc

func! Mark_alph_useabl() abort
  
  let l:mark = Mark_lst()
  
  for _alph in g:mark_alph_def
    if count(l:mark, _alph) == 0
      "echo _alph
      return _alph
    endif
  endfor
  
  echo 'use alph all'
  return ''
endfunc

func! Mark_del(alph) abort
  
  call Exe('delmark ' . a:alph)
endfunc

func! Mark_del_all() abort
  
  call Exe('delmark!')
  call Exe('DoShowMarks')
endfunc

" load re

func! Load_re() abort

  call Exe('e ')
endfunc

" load re encode sjis

func! Load_re_sjis() abort

  call Exe('e ++enc=sjis')
endfunc

" trns

func! V_trns() range abort

  let l:str = Slctd_str()

  let l:str = substitute(l:str, "\n", ' ', 'g')

  if l:str =~ '[^\x01-\x7E]' " mlt byte
    let l:lang = '{ja=en} '
  else
    let l:lang = ''
  endif

  let l:str = escape(l:str, "'")
  let l:sys_cmd = 'trns -no-ansi ' . l:lang . "'" . l:str . "'"
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
endfunc

" url encdoe

func! V_url_encode() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'url_encode "' . l:str . '"'
  let l:rslt = Sys_cmd(l:sys_cmd)
  "echo l:rslt
  call Ins(l:rslt)
endfunc

func! Hl_grp() abort

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunc
" and
" :highlight [grp name]

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" tst

"func! s:Tst() range abort
func! Tst() range abort

  "call Slct_re()
  call Slct_re_in_line_1()

  if     mode() == "\<c-v>"
    echo "c-v"
  elseif mode() == "v"
    echo "v"
  elseif mode() == "V"
    echo "V"
  else
    echo "else"
  endif

  echo "end"
endfunc


" 
" init
" 

" ynk init
call Ynk__clipboard()

" srch init
func! Srch_init() abort " use not

  let l:cmd = '/<cr>N'
  call Normal(l:cmd)
endfunc
"call Srch_init()


" netrw " use not

hi netrwDir      ctermfg=lightgreen
hi netrwTreeBar  ctermfg=lightgreen
hi netrwClassify ctermfg=lightgreen
hi netrwComment  ctermfg=14         ctermbg=none    cterm=none
hi netrwList     ctermfg=yellow     ctermbg=none    cterm=none
hi netrwVersion  ctermfg=130        ctermbg=none    cterm=none
hi netrwHelpCmd  ctermfg=130        ctermbg=none    cterm=none




" 
" dev  -  beta  -  try
" 

" rg lst

command! -nargs=? GitbashFzfRg call Gitbash_fzf_rg(<q-args>)

func! Gitbash_fzf_rg(str) abort

  call fzf#run(
  \   {
  \     'source' : Rg_rslt_ar(a:str),
  \     'sink'   : funcref('Tag_jmp'),
  \     'window' : '-tabnew',
  \   }
  \ )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

func! Rg_rslt_ar(str) abort

  let l:rg_rslt_txt = Rg_rslt_txt(v:null, a:str)
  let l:rg_rslt_ar  = split(l:rg_rslt_txt, "\n")
  return l:rg_rslt_ar
endfunc

let g:rg_cmd = 'rg '
\            . ' --line-number'
\            . ' --smart-case'
\            . ' --hidden'
\            . ' --no-ignore'
\            . ' -g "!.git" '

"\            . ' -g "*.lua"'
"\            . ' -g "*.script"'
"\            . ' -g "*.gui_script"'
"\            . ' -g "*.txt"'
"\            . ' -g "*.json"'
"\            . ' -g "*.fish"'
"\            . ' -g "*.vim"'
"\            . ' -g "*.html"'
"\            . ' -g "*.js"'
"\            . ' -g "*.css"'
"\            . ' -g "*.md"'

"\            . ' -ns'

func! Rg_rslt_txt(opt, p_str) abort
  
  let l:rg_cmd = Rg_cmd(a:opt, a:p_str)
  \            . ' --color always'

  let l:r_rslt_txt = Sys_cmd(l:rg_cmd)
  return l:r_rslt_txt
endfunc

func! Rg_cmd(opt, p_str) abort

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = a:opt
  endif
  
  if Is_str_emp(a:p_str)
    let l:str = @/
  else
    let l:str = trim(a:p_str)
  endif
  
  let l:str = escape(l:str, '\({')
  
  let l:rg_cmd = g:rg_cmd . ' ' . l:opt . ' "' . l:str . '"'
  return l:rg_cmd
endfunc



" 
" win
" 
let g:vimrc_win_path = '~/.vimrc_win'

if filereadable(expand(g:vimrc_win_path))

  call Exe('source ' . g:vimrc_win_path)
  "echo 'read .vimrc_win'
endif



