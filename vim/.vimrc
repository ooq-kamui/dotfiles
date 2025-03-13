" 
" Configuration file for vim
" 
" load re
" :source ~/.vimrc     " alias :v

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

" hi Cursor                           ctermbg=gray    guibg=gray
hi CursorLineNr ctermfg=magenta

hi Visual      ctermfg=none         ctermbg=darkmagenta cterm=none
hi VisualNOS                        ctermbg=darkmagenta cterm=none

hi Search      ctermfg=lightyellow  ctermbg=36          cterm=none
hi CurSearch   ctermfg=lightyellow  ctermbg=36          cterm=none
hi IncSearch   ctermfg=lightyellow  ctermbg=34          cterm=none
" bracket
hi MatchParen  ctermfg=lightmagenta ctermbg=none

hi TabLineSel                       ctermbg=magenta     cterm=none
hi TabLine     ctermfg=lightblue    ctermbg=none        cterm=none
hi TabLineFill                      ctermbg=none        cterm=none

hi StatusLine  ctermfg=lightblue    ctermbg=none        cterm=none
hi EndOfBuffer ctermfg=cyan                             cterm=none

hi Pmenu       ctermfg=lightgreen   ctermbg=darkblue    cterm=none
hi PmenuSel    ctermfg=cyan         ctermbg=magenta     cterm=bold

hi ErrorMsg    ctermfg=magenta      ctermbg=none        cterm=none
hi WarningMsg  ctermfg=magenta      ctermbg=none        cterm=none

hi NonText     ctermfg=25           ctermbg=none        cterm=none
hi SpecialKey  ctermfg=25           ctermbg=none        cterm=none

hi Comment     ctermfg=14           ctermbg=none        cterm=none

hi FullWidthSpace                   ctermbg=white
match FullWidthSpace /　/

" vimdiff
hi DiffAdd     ctermfg=10           ctermbg=22          cterm=none
hi DiffDelete  ctermfg=52           ctermbg=52          cterm=none
hi DiffChange  ctermfg=10           ctermbg=17          cterm=none
hi DiffText    ctermfg=10           ctermbg=21          cterm=none

" wildmenu
" hi wildMenu ??    ctermfg=cyan

au BufNewFile,BufRead *.script     set filetype=lua
au BufNewFile,BufRead *.gui_script set filetype=lua
au BufNewFile,BufRead *.fish       set filetype=fish

syntax on

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
set termencoding=utf-8

"set mouse=n
"map <LeftMouse> <Nop>

set autoindent
set shiftwidth=2 " 4
set tabstop=2    " 4
set expandtab " tab > space

filetype indent on
autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet " tab
autocmd FileType text     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType json     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType vim      setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType fish     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType sh       setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType markdown setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType python   setlocal sw=4 sts=4 ts=4   et " space

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
"set ambiwidth=double
set autoread


"set clipboard+=unnamedplus " ???

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
"set statusline+=%{&fileencoding}\  " file encoding
set statusline+=%y\                " file type
set statusline+=%c\                " column num
set statusline+=%p%%\              " line num %
set statusline+=%l/%L              " line num / line num all
set laststatus=2                   " 0:off  1:on when 2 win  2:on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I
"set nrformats+=unsigned " 2022-05-09

set noswapfile

" undo
if has('persistent_undo')
  set undodir=~/.vim-undo
  set undofile                                                                                                                                   
endif

" term

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
"nnoremap <c-z> <c-z>

" call
"nnoremap xx :call 

" save
"nnoremap a :w<cr>
nnoremap a :call Save()<cr>

" load re slf
"nnoremap xx :call Load_re()

" load re vimrc
nnoremap :v :source ~/wrk/cnf/vim/.vimrc

" 
" opn
" 

" opn tab file
nnoremap :o :Opn 

" opn latest
"nnoremap xx `0

" opn file srch  ( fzf )
nnoremap <leader>l :call Fzf_file()<cr>
"nnoremap <leader>l :FzfFile <cr>

" opn file hstry ( fzf )
nnoremap <leader>h :FzfFileHstry<cr>

" 
" opn etc
" 

" opn fish cnf
"nnoremap gf :call Opn_fish_cnf()<cr>

" opn .vimrc
nnoremap gh :call Opn_vimrc()<cr>

" opn tmp
nnoremap gt :call Opn_tmp()<cr>

" opn grep work
"nnoremap xx :call Opn_grep_wk()<cr>

" opn vim key note
"nnoremap xx :call Opn_vim_key()<cr>

" opn memo
"nnoremap gm :call Opn_memo()<cr>

" opn man
"nnoremap xx :OpnMan 

" opn app
nnoremap go :call Opn_app_by_cursor_path()<cr>

" opn app slf
"nnoremap xx :call Opn_app_slf()<cr>

" opn dir slf
nnoremap gd :call Opn_dir_slf()<cr>

" opn brwsr
"nnoremap xx :call Opn_brwsr()<cr>

" opn ggl srch
nnoremap ggl :call Opn_ggl_srch('')<cr>

" 
" cursor mv
" 

" cursor mv drct
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap k k
nnoremap j j

" cursor mv line mlt
nnoremap <c-k> 10<c-y>
nnoremap <c-j> 10<c-e>

" cursor mv line top | ins line
nnoremap y :call Cursor__mv_line_top_or_new_line()<cr>

" cursor mv line top
nnoremap <c-a> 0

" cursor mv line end
"nnoremap <c-y> xx
nnoremap <expr> <c-y>
\ Is_cursor_col__line_end() ? ':call Cursor__ins_markdown_cr()<cr>'     :
\                             ':call Cursor__mv_line_end()<cr>'
"\ Is_cursor_col__line_end() ? ':call Cursor__ins_space()<cr>'     :
"\                         ':call Cursor__mv_line_end()<cr>'

"nnoremap <c-e> :call Cursor__mv_line_end()<cr>

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
"nnoremap \ f_l

" cursor mv word dlm _ back
nnoremap <c-_> hT_
nnoremap \     T_h
nnoremap <bar> T_h
"nnoremap <c-\> T_h

" cursor mv word dlm ( camel or _ )  -  forward
nnoremap F :call Cursor__mv_word_dlm_f()<cr>

" cursor mv bracket pair
nnoremap <c-l> %

" cursor mv bracket out back
"nnoremap xx [{

" cursor mv bracket fnc back
"nnoremap xx [m

" cursor mv edited ( jmp list )
"nnoremap xx <c-o>
"nnoremap xx <c-i>

" cursor mv indnt auto
nnoremap <c-f> ll
" nnoremap <c-f> :call Cursor__mv_indnt_auto()<cr> " todo dev

" cursor mv file edge bgn
nnoremap gk :call Cursor__mv_file_edge_bgn()<cr>
"nnoremap gk :call Cursor__mv_file_edge('k')<cr>

" cursor mv file edge end
nnoremap gj :call Cursor__mv_file_edge_end()<cr>
"nnoremap gj :call Cursor__mv_file_edge('j')<cr>

" cursor mv edit latest
"nnoremap xx `.

" scroll

nnoremap K      <c-y>
nnoremap J      <c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" cursor mv jmp
nnoremap rk        :call Cursor__mv_jmp_v('k')<cr>
nnoremap rj        :call Cursor__mv_jmp_v('j')<cr>
nnoremap r<space>k :call Cursor__mv_jmp_char('k', 'f')<cr>
nnoremap r<space>j :call Cursor__mv_jmp_char('j', 'f')<cr>
nnoremap Rk        :call Cursor__mv_jmp_char('k', 'f')<cr>
nnoremap Rj        :call Cursor__mv_jmp_char('j', 'f')<cr>

" scroll cursor line upper
"nnoremap xx zt

" scroll cursor line middle
"nnoremap xx zz

" 
" slct / slctd / ynk / paste
" 

" slct
"nnoremap I v

" slctd __ word
nnoremap i :call Slctd__word()<cr>

" slctd __ word by under score

" todo dev
"nnoremap <c-_> :call Slctd__word_by_under_score()<cr>
" nnoremap <c-_> f_l
" hT_

" slctd __ char current - word end
nnoremap I ve

" slct visual box
nnoremap v <c-v>

" slct all
"nnoremap xx :call Ynk__line_all()<cr>

" slct re
nnoremap rr :call Slct_re()<cr>

" ynk clr
         
nnoremap <c-c> :call Ynk__clr()<cr>

" ynk line
nnoremap c :call Ynk__line()<cr>

" ynk char
"nnoremap xx "ayl

" ynk slf path
nnoremap gs :call Ynk__slf_path()<cr>
"nnoremap gp :call Ynk__slf_path()<cr>

" paste
nnoremap p :call Cursor__ins_ynk()<cr>

" paste clipboard
nnoremap P :call Cursor__ins_clipboard()<cr>

" paste rgstr history ( fzf )
nnoremap <leader>r :FzfRgstr<cr>
"nnoremap R         :FzfRgstr<cr>

" undo
nnoremap h     u

" redo
nnoremap <c-h> <c-r>

" undo history clr
nnoremap H :call Undo__clr()<cr>

" repeat
"nnoremap xx .

" 
" edit
" 

" mode ch ins
nnoremap <space> i

" mode ch ins rpl
"nnoremap xx R

" ins cr
nnoremap m :call Cursor__ins_cr()<cr>

" ins space
nnoremap L :call Cursor__ins_space(v:false)<cr>

" ins equal
nnoremap 2 i=<esc>

" ins period
nnoremap . i.<esc>

" ins comma
nnoremap , i, <esc>l

" ins comma $, nxt line
"nnoremap < A,<esc>j

" ins hyphen
nnoremap 0 :call Cursor__ins_hyphen()<cr>

" ins bracket
nnoremap <c-w> :call Cursor__ins_bracket()<cr>

" ins date
nnoremap * :call Cursor__ins_da()<cr>

" ins date time
nnoremap ; :call Cursor__ins_dt()<cr>

" ins day of week
"nnoremap xx :call Cursor__ins_week()<cr>

" ins slf path
"nnoremap xx :call Cursor__ins_line_slf_path()<cr>

" ins markdown code
nnoremap <c-u> :call Cursor__ins_markdown_code()<cr>

" ins markdown itm
"nnoremap O xx
nnoremap <expr> O
\ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_itm()<cr>' :
\                              ':call Cursor_line_indnt__shft_r()<cr>'

" ins dots ( or crnt )
nnoremap ru :call Cursor_line_end__dots_adjst()<cr>

" ins line emp
" ref nnoremap y

" ins comment mlt
nnoremap $ :call Cursor__ins_cmnt_mlt()<cr>

" ins comment 1
"nnoremap ! xx
nnoremap <expr> !
\ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
\                              ':call Cursor__ins_cmnt_1("^")<cr>'
"nnoremap 1 xx
nnoremap <expr> 1
\ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
\                              ':call Cursor__ins_cmnt_1("^")<cr>'

" ins __ line indnt space
nnoremap V :call Cursor_d__ins_line_space()<cr>

" cahr rpl, under score
"nnoremap <bar> :call Cursor_char__rpl_underscore()<cr>

" tgl markdown chk
"nnoremap xx :call Char_markdown_chk__tgl()<cr>

" del char
nnoremap s :call Cursor_c_char__del()<cr>

" del char ynk
"nnoremap xx :call Cursor_c_char__del_ynk()<cr>

" line del
nnoremap d :call Cursor_line__del()<cr>

" line forward del
nnoremap <c-d> D

" word back    del
"nnoremap xx hvbd

" word forward del
"nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zdw'
"nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zde'

" del cr ( line join )
nnoremap <c-m> J

" line mv up
"nnoremap xx "addk"aP

" line dpl
nnoremap D "zyy"zP

" repeat memory
"nnoremap xx qy
"nnoremap xx @y

" char tgl 01 ( ?? / num icl  )
nnoremap u :call N_char__tgl_switch01()<cr>

" char tgl 02 ( type ch / num dcl )
nnoremap U :call N_char__tgl_switch02()<cr>

" indnt shft
nnoremap ri :call Cursor_line_indnt__shft_l()<cr>
nnoremap ro :call Cursor_line_indnt__shft_r()<cr>

" indnt add
"nnoremap xx :call Cursor_line_indnt__add(2)<cr>

" indnt crct
"nnoremap xx :call Cursor_line_indnt__crct()<cr>

" cursor l char col __ crct
nnoremap q :call Cursor_f_str_col__crct_by_line_u()<cr>

" 
" srch
" 

" srch hl init
nnoremap S /<cr>N
nnoremap / /<cr>N
"nnoremap xx :call Srch_init()<cr>

" srch char in line - forward
"nnoremap xx f

" srch char in line repeat
"nnoremap xx ;

" srch by cmd
nnoremap <leader>k /

" srch by cmd word

nnoremap <leader>K /\<\><left><left>

" srch word or
"nnoremap xx Xxx

" srch forward
nnoremap n     :call Cursor__mv_srch('f')<cr>

" srch back
nnoremap <c-n> :call Cursor__mv_srch('b')<cr>

" srch, cursor mv nxt char
"nnoremap @ :call Srch_7_cursor__mv_nxt('f')<cr>

" srch str set
nnoremap e :call N_srch_str__flt()<cr>

" srch str set ( word 1 )
nnoremap E :call N_srch_str__word1_tgl()<cr>

" srch char bracket forward
"nnoremap xx :call Srch_char_bracket('f')<cr>

" srch str history ( fzf )
nnoremap <leader>f :FzfSrchHstry<cr>
"nnoremap <leader>n :FzfSrchHstry<cr>

" srch str set prv ( tgl )
nnoremap N :call Srch_str__prv_tgl()<cr>

" srch rpl one > ynk nxt ( only srch )
nnoremap <c-p> :call Srch_slct('f')<cr>

" srch ?=ts
"nnoremap xx /?ts=<cr>

" rpl ( cmd )
"nnoremap :s :Rpl 
nnoremap :s :%s///g

" fzf rg
" nnoremap <leader>o :call Fzf_rg('')<cr>
nnoremap <leader>o :call Fzf_rg(v:null)<cr>

" fzf rg fltr ext
nnoremap <leader>O :FzfRgExt js

" fzf rg with run
" nnoremap <leader>O :FzfRgWithRun <cr>

" fzf buf
nnoremap <leader>i :call N_fzf_buf()<cr>

" fzf jmplst
nnoremap <leader>e :FzfJmplst<cr>

" fzf pth lst
"nnoremap <leader>xx :FzfTagjmpByFile <cr>

" tag jmp tab new
nnoremap t :call Tag_jmp_by_cursor_line()<cr>

" 
" cmd
" 

" cmd history ( fzf )
nnoremap <leader>j :FzfCmdHstry<cr>

" sys cmd
nnoremap :! :! 
nnoremap :1 :! 

" ins sys cmd ( read )
nnoremap :r :InsSysCmd 

" pth
nnoremap :p :Pth <cr>

" cd slf
"nnoremap :d :call Dir__slf()

" cd parent
nnoremap :k :K

" fzf cd
nnoremap <leader>y :call Fzf_dir()<cr>

" fzf cd ( dir jmp )
nnoremap <leader>d :call Fzf_dir_jmp()<cr>

" fzf doc memo
nnoremap <leader>m :call Fzf_doc_memo_opn()<cr>
"nnoremap <leader>M :FzfFile ../memo/

" fzf vim fnc call
nnoremap <leader>c :call Fzf_vim_fnc_call()<cr>

" fzf doc tech
nnoremap <leader>t :call Fzf_doc_tech()<cr>

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
" buf
" 

" buf list
"nnoremap :xx :buffers

" buf fltr
nnoremap :f :%! jq
"nnoremap :xx :call Buf__fltr()<cr> " use not

" 
" win ( buf )
" 

" win ( buf ) splt quit
nnoremap rq :call Win_splt_quit()<cr>

" win ( buf ) splt h
nnoremap rh :call Win_splt_h()<cr>

" win ( buf ) splt v
nnoremap rv :call Win_splt_v()<cr>

" win ( buf ) nxt
nnoremap <c-e> :call Win_splt_cursor__mv_nxt()<cr>
nnoremap re    :call Win_splt_cursor__mv_nxt()<cr>

" win ( buf ) splt tgl
"nnoremap xx :call Win_splt_tgl()<cr>

" win ( buf ) mv r
"nnoremap xx <c-w>l

" win ( buf ) mv l
"nnoremap xx <c-w>h

" 
" term
" 

"nnoremap xx :Term 

" 
" mark
" 

" mark lst ( fzf )
"nnoremap <leader>xx :FzfMark<cr>

" mark show tgl
"nnoremap <leader>xx :call Mark_show_tgl()<cr>

" mark add / del tgl
"nnoremap <leader>xx :call Mark_tgl()<cr>

" mark del all
"nnoremap <leader>xx :call Mark_del_all()<cr>

" mark, cursor mv mark forward
"nnoremap <leader>xx ]`

" mark, cursor mv mark back
"nnoremap <leader>xx [`

" setting

" setting  -  line view wrap tgl
nnoremap :w :set wrap!

" setting  -  line num view tgl
nnoremap :N :set number!

" setting  -  line num rel tgl
nnoremap :n :set relativenumber!

" inf

" inf char
"nnoremap xx ga

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

nnoremap - <esc>
nnoremap + <esc>
nnoremap = <esc>
nnoremap @ <esc>
"nnoremap ; <esc>
"nnoremap , <esc>
"nnoremap . <esc>
"nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>
nnoremap ^ <esc>
"nnoremap / <esc>
"nnoremap \ <esc>
"nnoremap | <esc> " ref vvv
"nnoremap <bar> <esc>
nnoremap ? <esc>

"nnoremap ! <esc>
nnoremap " <esc>
nnoremap ` <esc>
nnoremap # <esc>
"nnoremap $ <esc>
"nnoremap % <esc> " ?
nnoremap & <esc>
nnoremap ( <esc>
nnoremap < <esc>
nnoremap > <esc>
"nnoremap << <esc>
"nnoremap >> <esc>

"nnoremap [ <esc>
"nnoremap ] <esc>

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
"nnoremap j <esc>
"nnoremap k <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap o <esc>
"nnoremap q <esc>
nnoremap r <esc>
"nnoremap s <esc>
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
nnoremap x <esc>
"nnoremap y <esc>
nnoremap z <esc>

nnoremap A <esc>
nnoremap B <esc>
nnoremap C <esc>
"nnoremap D <esc>
"nnoremap E <esc>
"nnoremap F <esc>
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
nnoremap R <esc>
"nnoremap S <esc>
nnoremap T <esc>
"nnoremap U <esc>
"nnoremap W <esc>
"nnoremap V <esc>
nnoremap X <esc>
nnoremap Y <esc>

nnoremap <c-tab> <nop>
nnoremap <c-space> <esc>

nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non
"nnoremap <c-*> <esc> " non ?
"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-/> <esc> " non ?
nnoremap <c-\> <esc>
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

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
"nnoremap gd <esc>
"nnoremap ge <esc>
nnoremap gf <esc>
nnoremap gg <esc>
"nnoremap gh <esc>
nnoremap gi <esc>
"nnoremap gj <esc>
"nnoremap gk <esc>
nnoremap gl <esc>
nnoremap gm <esc>
nnoremap gn <esc>
"nnoremap go <esc>
nnoremap gp <esc>
"nnoremap gs <esc>
"nnoremap gt <esc>
nnoremap gu <esc>
nnoremap gv <esc>
nnoremap gw <esc>
nnoremap gy <esc>

nnoremap ra <esc>
"        :
"nnoremap re <esc>
"nnoremap rf <esc>
"        :
"nnoremap rh <esc>
"nnoremap ri <esc>
"nnoremap rj <esc>
"nnoremap rk <esc>
"        :
nnoremap rn <esc>
"nnoremap ro <esc>
nnoremap rp <esc>
"        :
"nnoremap rr <esc>
"        :
"nnoremap ru <esc>
"        :
"nnoremap rv <esc>
"        :
nnoremap rz <esc>

"nnoremap Rj <esc>
"nnoremap Rk <esc>

nnoremap xx <esc>

nnoremap :a :a
nnoremap :b :b
nnoremap :c :c
nnoremap :d :d
nnoremap :e :e
"nnoremap :f :f
nnoremap :g :g
nnoremap :h :h
"          :
"nnoremap :k :k
"          :
"nnoremap :p :p
"nnoremap :q :q
"nnoremap :r :r
"nnoremap :s :s
"          :
"nnoremap :u :u
"          :
nnoremap :z :z

" mode normal end

" leader esc

nnoremap <leader>: <esc>

"nnoremap <leader>a <esc>
nnoremap <leader>b <esc>
"nnoremap <leader>c <esc>
"nnoremap <leader>d <esc>
"nnoremap <leader>e <esc>
"nnoremap <leader>f <esc>
nnoremap <leader>g <esc>
"nnoremap <leader>h <esc>
"nnoremap <leader>j <esc>
"nnoremap <leader>l <esc>
"nnoremap <leader>m <esc>
"nnoremap <leader>n <esc>
"nnoremap <leader>o <esc>
nnoremap <leader>p <esc>
"nnoremap <leader>r <esc>
nnoremap <leader>s <esc>
"nnoremap <leader>t <esc>
nnoremap <leader>u <esc>
nnoremap <leader>v <esc>
nnoremap <leader>w <esc>
"nnoremap <leader>y <esc>

"nnoremap <leader>L <esc>
nnoremap <leader>M <esc>
"nnoremap <leader>O <esc>

" 
" mode visual
" 

" mode ch line
vnoremap i V

" mode ch visual box
"vnoremap v <c-v>
vnoremap <expr> v
\ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>' :
\                     '<c-v>'

" file srch ( fzf )
"vnoremap <leader>xx "zy:FzfFile <c-r>z

" 
" cursor mv
" 

" cursor mv slctd edge tgl
vnoremap y :call Cursor__mv_slctd_edge_tgl()<cr>

" cursor mv slctd edge tgl, v box line same
vnoremap O O

" cursor mv char forward
vnoremap l l

" cursor mv char back
vnoremap <c-o> h

" cursor mv word - back
"vnoremap xx b
"vnoremap xx bh
"vnoremap xx Bh

" cursor mv line end
vnoremap <c-y> :call Slctd_cursor__mv_line_end()<cr>

" slctd __ reduce dlm _ r
vnoremap _ of_lo
"vnoremap h of_lo

" slctd __ reduce dlm _ l
"vnoremap h     F_h
vnoremap h     :call Slctd__reduce_dlm_l('_')<cr>
"vnoremap H     F_h
"vnoremap <c-_> F_h

" cursor mv space - forward ( word pre )
"vnoremap xx wh

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv jmp
vnoremap rk :call Slctd_cursor__mv_jmp_v('k')<cr>
vnoremap rj :call Slctd_cursor__mv_jmp_v('j')<cr>

" cursor mv bracket pair
vnoremap <c-l> %

" cursor mv bracket out back
"vnoremap xx [{

" cursor mv bracket fnc back
"vnoremap xx [m

" cursor mv file edge back    ( file bgn )
vnoremap gk :call Slctd_cursor__mv_file_edge('k')<cr>

" cursor mv file edge forward ( file end   )
vnoremap gj :call Slctd_cursor__mv_file_edge('j')<cr>

" 
" slct / ynk / paste
" 

" slctd expnd
"vnoremap xx :call Slctd__expnd()

" slctd expnd srch
vnoremap N :call Slctd__expnd_srch()<cr>

" slctd expnd word forward
vnoremap f :call Slctd__expnd_word_f()<cr>

" slctd expnd quote
vnoremap <c-i> :call Slctd__expnd_quote_switch()<cr>

" slctd expnd quote on
"vnoremap xx :call Slctd__expnd_quote_on_swtch()<cr>

" slctd expnd quote in
"vnoremap xx :call Slctd__expnd_quote_in_swtch()<cr>

" slctd expnd bracket forward
" vnoremap xx :call Slctd__expnd_bracket_f()<cr>

" slct all
vnoremap a :call Slct_all()<cr>

" ynk slctd
vnoremap o :call Ynk__slctd()<cr>

" ynk slctd add
"vnoremap xx :call Ynk__add_slctd()<cr>

" clipboard slctd
"vnoremap xx "+y

" paste
" todo refactoring
"vnoremap p xx
vnoremap <expr> p
\ mode() == '<c-v>' ? ':call Slctd_box_edge_l__ynk_line_1()<cr>' :
\ mode() == 'v'     ? ':call Slctd__ynk()<cr>'     :
\                     ':call Slctd__ynk()<cr>'
" \ mode() == 'v'     ? '"zd"aP'                  :

" paste clipboard
"vnoremap xx :call Slctd__clipboard()<cr>

" paste visual box
"vnoremap xx I<c-r>0<esc>

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

" ins date time
"vnoremap xx x:call Cursor__ins_da()<cr>

" ins day of week
"vnoremap xx x:call Cursor__ins_week()<cr>

" ins time
"vnoremap xx c<c-r>=strftime("%H:%M")<cr><esc>
"vnoremap xx c<c-r>=strftime('%H:%M')<cr><esc>

" line __ ins comment 1
vnoremap ! :call V_ins_cmnt_1()<cr>
vnoremap 1 :call V_ins_cmnt_1()<cr>

" line mlt __ ins comment
vnoremap & :call V_ins_cmnt_mlt()<cr>
"vnoremap $ :call V_ins_cmnt_mlt()<cr>

" line end __ ins comma
vnoremap , :call Curosr_line_end__ins(',')<cr>

" pad space
vnoremap S :call Slctd__pad_space()<cr>
"vnoremap <c-s> :call Slctd__pad_space()<cr>

" pad -
vnoremap - :call Slctd__pad('-')<cr>

" pad |
vnoremap <bar> :call Slctd__pad_bar()<cr>

" slctd str space __ under score
vnoremap q :call Slctd_str_space__underscore()<cr>

" line __ join per line
vnoremap J :call V_line__join_per_line(3)

" del str > ynk
"vnoremap d xx
vnoremap <expr> d
\ mode() == '<c-v>' ? '"ad:let @+ = @a<cr>gv' :
\                     '"ad:let @+ = @a<cr>'
"vnoremap xx :call V_slctd__del()<cr> " dev doing

" del str > ynk not
"vnoremap s xx
vnoremap <expr> s
\ mode() == '<c-v>' ? ':call Slctd__del()<cr>' :
\                     '"zx'

" line mlt forward del
vnoremap <c-d> D

" del line top space
"vnoremap xx :call V_line_top_space__del()<cr>

" del line end space
vnoremap m :call Slctd_line_end_space__del()<cr>

" del cursor f space
vnoremap K :call Slctd_box_cursor_r_space__crct()<cr>

" slctd edge quote __ tgl
"vnoremap w     :call Slctd_edge_out_quote__tgl()<cr>
vnoremap <expr> w
\ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>'    :
\                     ':call Slctd_edge_out_char__tgl()<cr>'
" \                     ':call Slctd_edge_out_quote__tgl()<cr>'

" slctd edge bracket __ tgl
vnoremap W :call Slctd_edge_out_bracket__tgl()<cr>

" slctd edge out __ ins space
vnoremap <c-s> :call Slctd_edge_out__ins(' ')<cr>
"vnoremap S :call Slctd_edge_out__ins(' ')<cr>

" slctd edge out __ ins markdown strikethrough
vnoremap ~ :call Slctd_edge_out__ins_markdown_strikethrough()<cr>

" slctd edge out __ ins markdown strikethrough
vnoremap b :call Slctd_edge_out__ins_markdown_bold()<cr>

" slctd box str mv back
"vnoremap xx :call Slctd_box_str__mv('l')<cr>

" slctd box str mv forward
"vnoremap xx :call Slctd_box_str__mv('r')<cr>

" slctd box space __ del
vnoremap D :call Slctd_box_space__del()<cr>

" slctd box mv back
vnoremap <c-w> :call Slctd_box__mv('l')<cr>

" slctd box mv forward
vnoremap <c-e> :call Slctd_box__mv('r')<cr>

" num icl
vnoremap + <c-a>gv

" num dcl
"vnoremap - <c-x>gv

" num seq
vnoremap * r0gvg<c-a>gv
"          ^^^^^^^^^^^^> r0 gv g<c-a> gv
"vnoremap * g<c-a>
"vnoremap = g<c-a>

" indnt shft
" slctd indnt __ shft l, r  -  todo dev,
"vnoremap ri :call Slctd_indnt__shft_l()<cr>
"vnoremap ro :call Slctd_indnt__shft_r()<cr>
vnoremap ri <gv
vnoremap ro >gv
"vnoremap " <gv
"vnoremap # >gv
"vnoremap 2 <gv
"vnoremap 3 >gv

" indnt crct
vnoremap ; =gv

" indnt tab   > space
vnoremap :e :call V_line_indnt__space(2)

" indnt space > tab
"vnoremap xx :call V_line_indnt__tab(2)<cr>

" tab > space
"vnoremap :t :call V_line_tab__rpl_space(12)

" tidy tbl
vnoremap :t :Tbl 

" line end ovr, pad __ space
"vnoremap xx :call V_line_end__pad_space()

" upper / lower tgl
vnoremap u ~gv

" upper force
vnoremap U Ugv

" lower force
"vnoremap xx ugv

" str mb
vnoremap M :MbCnv <cr>

" 
" srch
" 

" srch cmd
vnoremap <leader>k "zy/<c-r>z
"vnoremap <leader>i "zy/<c-r>z

" srch forward ( srch rpl skip )
vnoremap <c-n> :call V_srch_7_slct('f')<cr>

" srch back
"vnoremap xx    :call V_srch_7_slct('b')<cr>

" srch str set
vnoremap n :call Slctd_srch__switch()<cr>
"vnoremap e 
vnoremap <expr> e
\ mode() == '<c-v>' ? '<esc>' :
\                     ':call Slctd_srch_str__slctd_str()<cr>'

" srch rpl one > ynk, nxt
vnoremap <c-p> :call Slctd__rpl_7_srch_nxt()<cr>

" rpl ( cmd )
"vnoremap :s 
vnoremap <expr> :s
\ mode() == '<c-v>' ? ':VBoxRpl ' :
\                     ':s///g'
"\                     ':sort'
"\                     ':Rpl '

" rpl cr ( add cr )
vnoremap <c-m> :call V_line_srch_str__rpl_cr()<cr>

" v box edge char shft in
"vnoremap <c-h> 
vnoremap <expr> <c-h>
\ mode() == '<c-v>' ? ':call Slctd_box_edge_r_char__shft_in()<cr>' :
\                     ''

" cnv markdown tbl header
vnoremap :m :call V_2_markdown_tbl_header()

" fzf buf
vnoremap <leader>i :call V_fzf_buf()<cr>

" fzf rg
vnoremap <leader>o "zy:call Fzf_rg('<c-r>z')<cr>

" fzf rg word1
vnoremap <leader>O "zy:call Fzf_rg_word1('<c-r>z')<cr>

" tag jmp
"vnoremap t :call Tag_jmp_by_slctd_line()<cr>

" opn app
vnoremap go :call V_opn_app()<cr>

" opn brwsr
"vnoremap gx <plug>(openbrowser-smart-search)

" opn ggl srch
vnoremap ggl :call V_opn_ggl_srch()<cr>

" opn youtube video_id
vnoremap gy :call V_opn_yt()<cr>

" trns
vnoremap r :call V_trns()<cr>

" 
" cmd
" 

" cmd history ( fzf )
"vnoremap <leader>xx :FzfCmdHstry<cr>

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
vnoremap \ <esc>
"vnoremap | <esc> " ref vvv
"vnoremap <bar> <esc>
"vnoremap ! <esc>
vnoremap " <esc>
vnoremap # <esc>
vnoremap $ <esc>
"vnoremap % <esc> " ?
"vnoremap & <esc>
"vnoremap _ <esc>
vnoremap ? <esc>
vnoremap ( <esc>
"vnoremap ; <esc>
vnoremap < <esc>
vnoremap > <esc>
vnoremap = <esc>
"vnoremap - <esc>
"vnoremap + <esc>
"vnoremap , <esc>
vnoremap . <esc>
"vnoremap ~ <esc>

"vnoremap a <esc>
"vnoremap b <esc>
vnoremap c <esc>
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
"vnoremap q <esc>
"vnoremap r <esc>
"vnoremap s <esc>
vnoremap t <esc>
"vnoremap u <esc>
"vnoremap v <esc>
"vnoremap w <esc>
vnoremap x <esc>
"vnoremap y <esc>

vnoremap A <esc>
vnoremap B <esc>
vnoremap C <esc>
"vnoremap D <esc>
"vnoremap E <esc>
vnoremap F <esc>
vnoremap H <esc>
vnoremap I <esc>
"vnoremap J <esc>
"vnoremap K <esc>
"vnoremap L <esc>
"vnoremap M <esc>
"vnoremap N <esc>
"vnoremap O <esc>
vnoremap P <esc>
vnoremap Q <esc>
vnoremap R <esc>
"vnoremap S <esc>
vnoremap T <esc>
"vnoremap U <esc>
vnoremap V <esc>
"vnoremap W <esc>
vnoremap X <esc>
"vnoremap Y <esc>

vnoremap <c-_> <esc>
vnoremap <c-\> <esc>

vnoremap <c-a> <esc>
"vnoremap <c-b> <esc>
vnoremap <c-c> <esc>
"vnoremap <c-d> <esc>
"vnoremap <c-e> <esc>
"vnoremap <c-f> <esc>
"vnoremap <c-h> <esc>
"vnoremap <c-i> <esc>
"vnoremap <c-l> <esc>
"vnoremap <c-m> <esc>
"vnoremap <c-n> <esc>
"vnoremap <c-o> <esc>
"vnoremap <c-p> <esc>
vnoremap <c-q> <esc>
vnoremap <c-r> <esc>
"vnoremap <c-s> <esc>
vnoremap <c-u> <esc>
" v disable ??
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
"vnoremap gy <esc>

"vnoremap :a <esc>
vnoremap :f <esc>
" :
"vnoremap :t <esc>
" :
"vnoremap :z <esc>

" leader esc

vnoremap <leader>: <esc>

"vnoremap <leader>l <esc>
vnoremap <leader>u <esc>
"vnoremap <leader>y <esc>

" 
" mode insert
" 

" quit, esc
"inoremap <esc> xx
inoremap <expr> <esc>
\ pumvisible()               ? '<c-e>'  :
\ Is_cursor_col__line_top0() ? '<esc>'  :
\                              '<esc>l'

" inoremap <c-c> <esc>
inoremap <expr> <c-c>
\ pumvisible()               ? '<c-e>'  :
\ Is_cursor_col__line_top0() ? '<esc>'  :
\                              '<esc>l'

" cursor mv in line top
"inoremap <c-a> <c-o>^
"inoremap <c-a> <c-o>0

" cursor mv in line end
inoremap <c-e> <c-o>$

" cursor mv char forward
inoremap <c-l> <c-o>l

" cursor mv char back
inoremap <c-s> <c-o>h
"inoremap <c-o> xx
inoremap <expr> <c-o>
\ pumvisible() ? '<c-y>'  :
\                '<c-o>h'

" cursor mv word forward
"inoremap xx <c-o>e<c-o>l

" cursor mv word back
"inoremap xx <c-o>b
"inoremap <expr> <c-o>
"\ pumvisible() ? '<c-y>'  :
"\                '<c-o>b'

" cursor mv d
"inoremap <c-n> <c-o>j

" cursor mv u
"inoremap <c-p> <c-o>k

" ins cr
inoremap <c-m> <cr>

" ins tab
inoremap <tab> <c-v><tab>

" ins markdown cr
"inoremap xx <space><space>

" ins cmp default
inoremap <leader>f <c-p>
inoremap <c-r>     <c-p>
inoremap <c-q>     <c-p>

"inoremap <expr> <c-y>
"\ pumvisible() ? '<c-e>' :
"\                '<c-n>'

" ins bracket
"inoremap <c-u> <c-r>=I_quote()<cr>
inoremap <expr> <c-u>
\ pumvisible() ? '<c-n>'               :
\                '<c-r>=I_quote()<cr>'
"inoremap <c-u> <c-r>=I_bracket()<cr>

" ins quote
"inoremap <c-j> xx
inoremap <expr> <c-j>
\ pumvisible() ? '<c-n>'                 :
\                '<c-r>=I_bracket()<cr>'
" \                '<c-r>=I_quote()<cr>'

" ins num
inoremap <c-y>     <c-r>=I_num()<cr>
"inoremap <leader>k <c-r>=I_num()<cr>

" ins symbol
inoremap <c-n> <c-r>=I_symbol01()<cr>
inoremap <c-f> <c-r>=I_symbol02()<cr>
inoremap <c-p> <c-r>=I_symbol03()<cr>

" ins markdown
"inoremap <c-u> <c-r>=I_markdown_lnk()<cr>

" ins todo status
"inoremap xx <c-r>=I_todo_status()<cr>

" ins week
"inoremap xx <c-r>=I_week()<cr>

" ins register
"inoremap xx <c-r>=I_reg()<cr>

" ins reserved word lua
"inoremap xx <c-r>=I_reserved_lua()<cr>

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
\ pumvisible()                ? '<c-p>'   :
\ ! Is_cursor_col__line_end() ? '<c-o>dw' :
\                               ''

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

inoremap <leader>   <esc>
inoremap <esc>      <esc>
"inoremap <esc><esc> <esc>

"inoremap <tab> <nop>
inoremap <s-tab> <nop>
inoremap <c-tab> <nop>
"inoremap <c-space> <nop>
"inoremap <c-space> <tab> " ?? todo research
inoremap <c-space> <tab>

"inoremap <c-_> <nop> " non ?
inoremap <c-_> <nop>
inoremap <c-^> <nop>
inoremap <c-\> <nop>
inoremap <c--> <nop>
"inoremap <c-@> <nop> " non
"inoremap <c-,> <nop> " non
"inoremap <c-.> <nop> " non
"inoremap <c-:> <nop> " non
"inoremap <c-;> <nop> " non

inoremap <c-a> <nop>
inoremap <c-b> <nop>
"inoremap <c-f> <nop>
inoremap <c-g> <nop>
"inoremap <c-i> <nop>
"inoremap <c-k> <nop>
"inoremap <c-n> <nop>
"inoremap <c-o> <nop>
"inoremap <c-p> <nop>
"inoremap <c-q> <nop>
"inoremap <c-r> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>

"inoremap <leader>f <nop>
inoremap <leader>i <nop>

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
"cnoremap <c-v> <c-r>0
cnoremap <c-v> <c-r>a

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

" etc

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  exe "set <xUp>=\e[1;*A"
  exe "set <xDown>=\e[1;*B"
  exe "set <xRight>=\e[1;*C"
  exe "set <xLeft>=\e[1;*D"
endif

" quickfix

"packadd Cfilter

autocmd QuickFixCmdPost grep,vimgrep tab cw

" 
" cmd def
" 

command! -nargs=0 Pth call Pth()

command! -nargs=0 K     call Dir__parent(1)
command! -nargs=0 Kk    call Dir__parent(2)
command! -nargs=0 Kkk   call Dir__parent(3)

command! -nargs=0 Dpl call Slf__dpl()

command! -nargs=1 Mv call Slf__mv(<q-args>)

command! -range=% -nargs=0 MbCnv <line1>,<line2>call V_line_mb__cnv()

command! -nargs=* SrchOr call Srch_or(<f-args>)

command! -nargs=* InsSysCmd call Cursor__ins_sys_cmd(<q-args>)

command! -range=% -nargs=0 Tbl <line1>,<line2>call Slctd_line__crct_tbl()

command! -range=% -nargs=* Rpl <line1>,<line2>call V_line__rpl(<f-args>)

command! -range=% -nargs=* VBoxRpl <line1>,<line2>call Slctd_box__rpl(<f-args>)

command! -nargs=* -complete=file Opn call Opn(<q-args>)

command! -nargs=* OpnMan call Opn_man(<q-args>)

"command! -nargs=* OpnApp call Opn_app(<f-args>)

command! -nargs=? UrlEncode <line1>,<line2>call V_url_encode(<f-args>)

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

" tst slctd

"vnoremap T :call Tst()

func! Tst() range abort

  let l:val = Is_slctd_mode__box()
  echo l:val
endfunc

" tst slctd __ rpl sys cmd mb

"vnoremap T :TstSlctdRplSysCmdMb <cr>

command! -range=% -nargs=* TstSlctdRplSysCmdMb <line1>,<line2>call Tst_slctd_rpl_sys_cmd_mb()

func! Tst_slctd_rpl_sys_cmd_mb() range abort

  let l:pth = '~/wrk/cnf/doc/tst/tst-in.md'
  " let l:sys_cmd = 'cat ' . l:pth . ' | column -t | cat'
  let l:sys_cmd = 'cat ' . l:pth . ' | column -t'
  " let l:sys_cmd = 'cat ' . l:pth

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc


" 
" fnc def
" 

" fnc def index              line ( memo )
" 
" - primitive                2041      
"   - char                   2254      
"   - str                    2389      
"     - str cnd              2473      
"   - num                    2503      
"                                      
" - vim                                
"   - file                   2253      
"                                      
" - file ( sys )             ?         
" - opn                      ?         
" - win ( buf )              ?         
"                                      
" - line                     ?         
"                                      
" - cursor                   2546      
"   - cursor __ ( mv )       2549      
"   - cursor __ ( ins )                
"   - cursor char                      
"   - cursor str             3263      
"   -   cursor str __        3265      
"   - cursor line                      
" 
" - slctd                    3909      
"   - slctd cursor                     
"   - slctd __ expnd                   
"   - slctd str                        
"   - slctd line                       
"   - slctd edge                       
"     - slctd edge cnd                 
"   - slctd box                        
"   - slctd mode                       
"     - slctd mode cnd                 
"   - slctd etc              4962      
" 
" - ynk                      4965      
" - srch                     5040      
" 
" - complete                           
" - env                                
" - plugin                             
" - fzf                                
" - rg                                 
" - mark                               
" 

" primitive

" char

func! Lr_2_normal_cmd(lr) abort

  if     a:lr == 'l'
    let l:n_cmd = 'h'

  elseif a:lr == 'r'
    let l:n_cmd = 'l'
  endif

  return l:n_cmd
endfunc

" char cnd

func! Is_char__num(char) abort

  let l:ret = v:false

  if a:char =~ '\d'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_char__alpha(char) abort

  let l:ret = v:false

  if a:char =~ '\a'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_char__symbol(char) abort

  let l:ret = v:false

  if a:char !~ '\s' && a:char !~ '\w'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_char_bth__(ptn, c1, c2)

  let l:ret = v:false

  if a:c1 =~ a:ptn && a:c2 =~ a:ptn
    let l:ret = v:true
  endif

  return l:ret
endfunc

" char cnd tgl

func! Is_char__tgl_symbol(c) abort

  let l:rpl = ''

  if     a:c == '/'
    let l:rpl = '|'
  elseif a:c == '|'
    let l:rpl = '\'
  elseif a:c == '\'
    let l:rpl = '/'

  elseif a:c == "'"
    let l:rpl = '"'
  elseif a:c == '"'
    let l:rpl = '`'
  elseif a:c == '`'
    let l:rpl = "'"

  elseif a:c == '-'
    let l:rpl = '+'
  elseif a:c == '+'
    let l:rpl = '='
  elseif a:c == '='
    let l:rpl = '*'
  elseif a:c == '*'
    let l:rpl = '-'

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
  endif

  return l:rpl
endfunc

func! Is_char__tgl_bracket_trn(c) abort

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

func! Is_char__tgl_alpha_trn(c) abort " use not
  
  let l:rpl = ''

  if     a:c ==# 'T'
    let l:rpl = 'f'
  elseif a:c ==# 'F'
    let l:rpl = 't'
  endif

  return l:rpl
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

func! Str_sub(str, idx, len) abort " dev doing

  let l:str = a:str
  return l:str
endfunc

func! Str_space(len) abort

  let l:space_str = ''

  let l:idx = 0
  while l:idx < a:len

    let l:space_str .= ' '

    let l:idx += 1
  endwhile
  return l:space_str
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

  let l:r_str = substitute(a:str, a:srch, a:rpl, 'g')
  return l:r_str
endfunc

func! Str_path_unix__cnv_win(path) abort

  let l:path = a:path
  let l:path = Str__rpl(l:path, '/c/', 'C:/')
  let l:path = Str__rpl(l:path, '/', '\')
  return l:path
endfunc

func! Str_path_win__cnv_unix(path) abort

  let l:path = a:path
  let l:path = Str__rpl(l:path, 'C:', '/c')
  let l:path = Str__rpl(l:path, '\', '/')
  return l:path
endfunc

" str cnd

func! Is_str__emp(str) abort

  let l:ret = v:false

  if a:str == ''
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_str__ptn(str, ptn) abort

  let l:ret = v:false

  if a:str =~ a:ptn
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_str__space(str) abort

  let l:ptn = '^\s\+$'
  let l:ret = Is_str__ptn(a:str, l:ptn)
  return l:ret
endfunc

func! Is_str__num(str) abort

  let l:ptn = '^\d\+$'
  let l:ret = Is_str__ptn(a:str, l:ptn)
  return l:ret
endfunc

" str mb

func! V_line_mb__cnv() range abort

  let l:sys_cmd = 'mb__cnv'
  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" num ( idx )

func! Idx__icl(idx, ar_len) abort

  let l:r_idx = a:idx + 1

  if r_idx >= a:ar_len
    let l:r_idx = 0
  endif

  return l:r_idx
endfunc

func! Idx__dcl(idx, ar_len) abort

  let l:r_idx = a:idx - 1

  if r_idx < 0
    let l:r_idx = a:ar_len - 1
  endif

  return l:r_idx
endfunc

" vim

func! Nothing() abort " use by tst

  " echo "do nothing.."
endfunc

func! Echo(str) abort " alias

  echo a:str
endfunc

func! Exe(cmd) abort " alias

  exe a:cmd
endfunc

func! Normal(cmd) abort " alias

  call Exe('normal! ' . a:cmd)
endfunc

func! Esc() abort " alias

  call Normal("\<esc>")
endfunc

func! Cmdline__(str) abort

  call Ynk__(a:str)

  call feedkeys(':call ' . a:str)
endfunc

func! Sys_cmd(sys_cmd) abort

  return system(a:sys_cmd)

  "let l:cmd = '! ' . a:sys_cmd
  "call Exe(l:cmd)
endfunc

" undo clr, file ( crnt buf ? )

func! Undo__clr() abort

  let l:undo_lvl_tmp = &undolevels

  setlocal undolevels=-1

  exe "normal! a \<BS>\<Esc>"

  let &l:undolevels = l:undo_lvl_tmp
endfunc

" syntax color

func! Hl_grp() abort

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunc
" and
" :highlight [grp name]

func! Color_name_lst() abort

  let l:cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  call Exe(l:cmd)
endfunc

" dir crnt

func! Pth() abort

  call Exe('pwd')
endfunc

" dir ch

func! Dir__(dir) abort

  call Exe('cd ' . a:dir)
  call Pth()
endfunc

" dir ch __ slf

func! Dir__slf() abort

  let l:dir = Slf_dir()
  call Dir__(l:dir)
  " call Exe('cd ' . l:dir)

  " call Pth()
endfunc

" dir ch parent

func! Dir__parent(lvl) abort

  let l:cnt = 1
  while l:cnt <= a:lvl

    call Exe('cd ..')

    let l:cnt += 1
  endwhile

  call Pth()
endfunc

" file

func! Save() abort
  
  call Exe('w')
endfunc

func! Slf__dpl() abort
  
  let l:sys_cmd = 'dpl ' . Slf_path()
  call Sys_cmd(l:sys_cmd)
endfunc

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

func! Rgstr__clr() abort

  let @0 = ''
endfunc

func! Int_2_str(num) abort

  let l:num_str = printf('%o', a:num)
  return l:num_str
endfunc

" file type cnd

func! Is_file_type__(type) abort

  if &filetype == a:type
    return v:true
  else
    return v:false
  endif
endfunc

func! File_txt(file_path) abort

  if ! filereadable(a:file_path)
    return
  endif

  let l:cmd = 'cat ' . a:file_path

  let l:pth_lst_txt = Sys_cmd(l:cmd)
  return l:pth_lst_txt
endfunc

func! File_line_ar(file_path) abort

  let l:file_txt = File_txt(a:file_path)
  let l:file_line_ar = Txt_to_ar(file_txt)
  return l:file_line_ar
endfunc

" 
" cursor
" 

" cursor __ mv

func! Cursor__mv_by_col_num(col_num) abort

  if ! Is_str__num(a:col_num)
    return
  endif

  let l:line_num = Cursor_line_num()

  call Cursor__mv_by_line_col(l:line_num, a:col_num)
endfunc

func! Cursor__mv_by_line_num(line_num) abort

  if ! Is_str__num(a:line_num)
    return
  endif

  call Normal(a:line_num . 'G')
endfunc

func! Cursor__mv_by_line_col(line_num, col) abort

  let l:line_num = (a:line_num == v:null) ? Cursor_line_num() : a:line_num
  
  call cursor(l:line_num, a:col)
endfunc

func! Cursor__mv_by_line_info(line_info) abort
  
  let l:line_num = Line_num_by_Line_info(a:line_info)
  call Cursor__mv_by_line_num(l:line_num)
endfunc

func! Cursor__mv_by_pos(pos) abort
  
  call setpos('.', a:pos)
endfunc

func! Cursor__mv_line_top0() abort
  
  if Is_cursor_line_str__emp()
    return
  endif

  call Normal('0')
endfunc

func! Cursor__mv_line_top1() abort

  if     Is_cursor_line_str__space()
    call Cursor__mv_line_end()

  elseif Is_line_markdown_itm()
    call Normal('^2l')
  else
    call Normal('^')
  endif
endfunc

func! Cursor__mv_line_end() abort

  if ! Is_cursor_line_str__emp()
    call Normal('$l')
  endif
endfunc

func! Cursor__mv_char_f() abort

  call Normal('l')
endfunc

func! Cursor__mv_char_b() abort

  call Normal('h')
endfunc

func! Cursor__mv_word_f() abort

  if     Is_cursor_col__line_end() || Is_cursor_col__line_end_inr()

    call Cursor__mv_char_f()
    return

  elseif Is_cursor_line_str_side_r__space()

    call Cursor__mv_line_end()
    return
  endif

  let l:c_char = Cursor_c_char()
  let l:r_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:r_char =~ ' '
    call Normal('w')
  else
    call Normal('el')
  endif
endfunc

func! Cursor__mv_word_b() abort
  
  let l:l_char = Cursor_l_char()

  if     Is_cursor_col__line_top0()
    call Cursor__mv_u_line_end()
    
  elseif Is_cursor_line_str_side_l__space()
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_col__line_top1()
    call Cursor__mv_line_top0()
    
  elseif Is_char__symbol(l:l_char)
    call Cursor__mv_char_b()
    
  else
    call Normal('b')
  endif
endfunc

func! Cursor__mv_word_dlm_f() abort

  let l:ptn = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
  " let l:ptn = '[_\u]'

  let l:line_num = Cursor_line_num()

  call search(l:ptn, 'zW', l:line_num)
endfunc

func! Cursor__mv_word_b_pre() abort " use not

  let l:c_char = Cursor_c_char()
  let l:l_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:l_char !~ ' '
    call Normal('gegel')
  else
    call Normal('gel')
  endif
endfunc

func! Cursor__mv_u() abort " alias

  call Normal('k')
endfunc

func! Cursor__mv_d() abort " alias

  call Normal('j')
endfunc

func! Cursor__mv_u_line_end() abort

  " call Normal('k')
  call Cursor__mv_u()
  call Cursor__mv_line_end()
endfunc

func! Cursor__mv_line_top_or_new_line() abort

  if     Is_cursor_col__line_top0()

    call Cursor__ins_line_emp()

  elseif Is_cursor_col__line_top1()

    call Cursor__mv_line_top0()
  else
    call Cursor__mv_line_top1()
  endif
endfunc

func! Cursor__mv_slctd_edge_tgl() range abort

  call Slct_re()
  call Normal('o')
endfunc

func! Cursor__mv_slctd_edge_l() range abort

  call Slct_re()

  if ! Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()

  " let l:n_cmd = '`<'
  " call Normal(l:n_cmd)
endfunc

func! Cursor__mv_file_edge(n_cmd) abort

  if Is_cursor_line_num__file_edge()
    call Normal(a:n_cmd)
  endif

  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    call Normal(a:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_file_edge_bgn() abort " alias

  call Cursor__mv_file_edge('k')
endfunc

func! Cursor__mv_file_edge_end() abort " alias

  call Cursor__mv_file_edge('j')
endfunc

func! Cursor__mv_jmp_char(drct, is_space_through) abort

  "let l:is_space_stop = a:is_space_stop
  let l:is_space_through = a:is_space_through

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)
  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if ! ( Is_cursor_c_char__space() || Is_cursor_col__line_end() )
      break
    endif

    "if ( l:is_space_stop == 't' && Is_cursor_c_char__space() )
    if ( l:is_space_through == 'f' && Is_cursor_c_char__space() )
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_jmp_space(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  let l:cnt = 1
  let l:cnt_max = 10000
  "let l:cnt_max = 10

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if Is_cursor_c_char__space() || Is_cursor_col__line_end()
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_jmp_v(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  if Is_cursor_c_char__space() || Is_cursor_col__line_end()

    call Cursor__mv_jmp_char(l:n_cmd, 't')

  else
    call Cursor__mv_jmp_space(l:n_cmd)
  endif
endfunc

func! Cursor__mv_srch_ptn(ptn, dir) range abort

  let l:ptn = a:ptn

  if a:dir == 'b'
    let l:opt_dir = 'b'
  else
    let l:opt_dir = ''
  endif
  let l:opt = 'W' . l:opt_dir
  " let l:opt = 'zW' . l:opt_dir

  let l:line_num = Cursor_line_num()

  call search(l:ptn, l:opt, l:line_num)
endfunc

func! Cursor__mv_srch(drct) abort

  if     a:drct == 'f'
    let l:op = ''
  elseif a:drct == 'b'
    let l:op = 'b'
  endif

  let l:ptn = @/
  call search(l:ptn, l:op)
endfunc

func! Srch_or(...) abort

  let l:str = '\(' . join(a:000, '\|') . '\)'
  "echo l:str

  let @/ = l:str
  call Cursor__mv_srch('f')
endfunc

" cursor pos

func! Cursor_pos() abort " alias

  let l:pos = getpos('.')
  return l:pos
endfunc

" cursor col

func! Cursor_col_num() abort

  return col('.')
endfunc

func! Cursor_col_idx() abort

  let l:idx = col('.') - 1
  return l:idx
endfunc

" cursor col cnd

func! Is_cursor_col__line_end() abort

  if Cursor_col_num() == Cursor_line_end_col()

    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_col__line_end_ovr() range abort

  if Cursor_col_num() >= Cursor_line_end_col()
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_col__line_end_inr() abort

  if Cursor_col_num() == Cursor_line_end_col() - 1

    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_col__line_top0() abort

  if Cursor_col_num() == 1
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_col__line_top1() abort

  let l:pos_c = Cursor_pos()

  let l:col_c = Cursor_col_num()
  
  call Cursor__mv_line_top1()
  let l:col_s1 = Cursor_col_num()
  
  call setpos('.', l:pos_c)
  
  if l:col_c == l:col_s1
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_slctd_edge_l_col__line_top() range abort

  let l:ret = v:false

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  let l:cursor_l_pos = Cursor_pos()
  " echo l:cursor_l_pos

  call Cursor__mv_slctd_edge_tgl()

  if l:cursor_l_pos[2] == 1 " col
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_slctd_cursor_pos__r() range abort

  let l:ret = v:false

  call Slct_re()

  let l:cursor_pos1 = Cursor_pos()
  " echo l:cursor_pos1

  call Cursor__mv_slctd_edge_tgl()
  let l:cursor_pos2 = Cursor_pos()
  " echo l:cursor_pos2

  call Cursor__mv_slctd_edge_tgl()


  if     l:cursor_pos1[1] >  l:cursor_pos2[1] " line
    let l:ret = v:true

  elseif l:cursor_pos1[1] == l:cursor_pos2[1] " line

    if   l:cursor_pos1[2] >= l:cursor_pos2[2] " col
      let l:ret = v:true
    endif
  endif

  " echo l:ret
  return l:ret
endfunc

" cursor char

func! Cursor_c_char() abort

  let l:idx = Cursor_col_idx()
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_l_char() abort

  let l:idx = Cursor_col_idx() - 1
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_r_char() abort

  let l:idx = Cursor_col_idx() + 1
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_u_char() abort " dev doing

  if Is_cursor_line_num__file_edge_bgn()
    return ''
  endif

  let l:idx = Cursor_col_idx()
  let l:line_num = Cursor_line_num() - 1
  let l:c = getline(l:line_num)[l:idx]
  return l:c
endfunc

func! Cursor_d_char() abort " dev doing

  if Is_cursor_line_num__file_edge_end()
    return ''
  endif

  let l:idx = Cursor_col_idx()
  let l:line_num = Cursor_line_num() + 1
  let l:c = getline(l:line_num)[l:idx]
  return l:c
endfunc

" cursor char __

func! Cursor_char__rpl(rpl) abort

  call Normal('r' . a:rpl)
endfunc

func! Cursor_char__rpl_underscore() abort " alias

  " todo, case: line end

  call Cursor_char__rpl('_')
  call Normal('l')
  " call Cursor__mv_char_forward() " todo, fnc cre
endfunc

func! N_char__tgl_switch01() abort " todo fnc name mod

  let l:c = Cursor_c_char()

  if     Is_char__num(l:c)

    call Cursor_str__icl()
    return

  elseif Is_char__alpha(l:c)

    call Normal('v~') " upper / lower
    return
  endif

  let l:rpl = Is_char__tgl_bracket_trn(l:c)
  if ! Is_str__emp(l:rpl)
    call Cursor_char__rpl(l:rpl)
    return
  endif

  let l:rpl = Is_char__tgl_symbol(l:c)
  if ! Is_str__emp(l:rpl)

    call Cursor_char__rpl(l:rpl)
    return
  endif
endfunc

func! N_char__tgl_switch02() abort

  let l:c = Cursor_c_char()

  if Is_char__num(l:c)

    call Cursor_str__dcl()
    return
  endif

  call Cursor_char__tgl_type_shift(l:c)
endfunc

func! Cursor_char__tgl_type_shift(c) abort

  let l:rpl = ''

  if     a:c == "'"
    let l:rpl = '"'
  elseif a:c == '"'
    let l:rpl = '`'
  elseif a:c == '`'
    let l:rpl = "'"

  elseif a:c == "("
    let l:rpl = '['
  elseif a:c == "["
    let l:rpl = '{'
  elseif a:c == "{"
    let l:rpl = '<'
  elseif a:c == "<"
    let l:rpl = '('

  elseif a:c == ")"
    let l:rpl = ']'
  elseif a:c == "]"
    let l:rpl = '}'
  elseif a:c == "}"
    let l:rpl = '>'
  elseif a:c == ">"
    let l:rpl = ')'
  endif

  if ! Is_str__emp(l:rpl)

    call Cursor_char__rpl(l:rpl)
    return
  endif
endfunc

func! Cursor_c_char__del() abort

  let l:cmd = '"zx'
  call Normal(l:cmd)
endfunc

func! Cursor_c_char__del_ynk() abort

  let l:cmd = '"ax'
  call Normal(l:cmd)
endfunc

" cursor char cnd

func! Is_cursor_c_char__ptn(ptn) abort

  let l:c = Cursor_c_char()

  if l:c =~ a:ptn
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_c_char__space() abort

  let l:c = Cursor_c_char()

  if l:c =~ '\s'
    return v:true
  else
    return v:false
  endif

  " let l:ptn = '\s'
  " let l:ret = Is_cursor_c_char__ptn(l:ptn)
  " return l:ret
endfunc

func! Is_cursor_c_char__alph() abort

  let l:ptn = '\a'
  let l:ret = Is_cursor_c_char__ptn(l:ptn)
  return l:ret
endfunc

" cursor str

" cursor str __

func! Cursor_str__icl() abort

  let l:n_cmd = "\<c-a>"
  call Normal(l:n_cmd)
endfunc

func! Cursor_str__dcl() abort

  let l:n_cmd = "\<c-x>"
  call Normal(l:n_cmd)
endfunc

func! Cursor_str_week__icl() abort

  let l:week_str = Cursor_word()
  let l:week_idx = index(g:week_def, l:week_str)

  if l:week_idx == -1
    return
  endif

  let l:week_nxt_idx = Idx__icl(week_idx, len(g:week_def))
  let l:week_nxt_str = g:week_def[l:week_nxt_idx]

  call Slctd__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
endfunc

func! Cursor_str_week__dcl() abort

  let l:week_str = Cursor_word()
  let l:week_idx = index(g:week_def, l:week_str)

  if l:week_idx == -1
    return
  endif

  let l:week_nxt_idx = Idx__dcl(week_idx, len(g:week_def))
  let l:week_nxt_str = g:week_def[l:week_nxt_idx]

  call Slctd__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
endfunc

" cursor etc

func! Cursor_word() abort

  let l:word = expand('<cword>')
  return l:word
endfunc

func! Cursor_filepath() abort

  if     Is_env__('mac')

    let l:str = expand('<cfile>')

  elseif Is_env__('win64')

    let l:str = Cursor_line_str()

  elseif Is_env__('win32unix')

    let l:str = Cursor_line_str()

  else
    let l:str = Cursor_line_str()
  endif
  
  let l:str = trim(l:str)
  
  return l:str
endfunc

" cursor __ ins

func! Cursor__ins(str) abort

  let l:cmd = 'i' . a:str
  call Normal(l:cmd)
  call Cursor__mv_char_f()
endfunc

func! Cursor__ins_with_cursor_fix(str) abort " todo dev

endfunc

" cursor __ ins ynk ( paste )

func! Cursor__ins_ynk() abort

  call Normal('"aP')
endfunc

func! Cursor__ins_clipboard() abort

  call Ynk__clipboard()
  call Cursor__ins_ynk()
endfunc

func! Cursor__ins_mlt(str, num) abort

  if a:num == 0
    return
  endif

  let l:cmd = a:num.'i'.a:str
  call Normal(l:cmd)
endfunc

func! Cursor__ins_cr() abort

  let l:t_line_num = line('.')

  call Normal("i\<cr> ")
  call Normal('x')

  call Line_end_space__del(l:t_line_num)
  " call Normal('j')
  call Cursor__mv_d()
endfunc

func! Cursor__ins_space(is_cursor_mv) abort

  if a:is_cursor_mv
    call Cursor__ins(' ')

  else
    call Normal('i ')
    ""call Normal('l')
  endif
endfunc

func! Cursor__ins_hyphen() abort

  call Normal('i-')
  "call Cursor__ins('-')
endfunc

func! Cursor__ins_bracket() abort

  call Normal("i' '")
  call Normal('h')
  "call Cursor__ins('-')
endfunc

func! Cursor__ins_da() abort

  let l:da = strftime('%Y-%m-%d')
  call Cursor__ins(l:da)
endfunc

func! Cursor__ins_tm() abort

  let l:tm = strftime('%H:%M')
  call Cursor__ins(l:tm)
endfunc

func! Cursor__ins_dt() abort

  let l:dt = strftime('%Y-%m-%d.%H:%M')
  call Cursor__ins(l:dt)
endfunc

func! Cursor__ins_ts() abort

  let l:ts = strftime('%Y-%m-%d.%H:%M:%S')
  call Cursor__ins(l:ts)
endfunc

let g:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

func! Cursor__ins_week() abort

  let l:week_num = strftime('%w')
  let l:week     = g:week_def[l:week_num]
  call Cursor__ins(l:week)
  "call Cursor__ins(' ' . l:week)
endfunc

func! Cursor__ins_sys_cmd(sys_cmd) abort " read

  let l:is_line_num_eq_1 = Is_cursor_line_num__file_edge_bgn()

  if l:is_line_num_eq_1
    call Normal('O')
  else
    " call Normal('k')
    call Cursor__mv_u()
  endif

  let l:cmd = 'read ! ' . a:sys_cmd
  call Exe(l:cmd)

  if l:is_line_num_eq_1
    call Line__del_by_line_num(1)
  endif
endfunc

" cursor __ ins line

func! Cursor__ins_line(str) abort
  
  let l:line_num = Cursor_line_num() - 1
  call append(l:line_num, a:str)
  " call Normal('k')
  call Cursor__mv_u()
endfunc

func! Cursor_d__ins_line_d(str) abort
  
  let l:line_num = Cursor_line_num()
  call append(l:line_num, a:str)
endfunc

func! Cursor__ins_line_emp() abort
  
  let l:str = ''
  call Cursor__ins_line(l:str)
endfunc

func! Cursor__ins_line_slf_path() abort
  
  let l:path = Slf_path()
  call Cursor__ins_line(l:path)
endfunc

func! Cursor_d__ins_line_space() range abort

  let l:space_len = Cursor_col_num() - 1
  let l:space_str = Str_space(l:space_len)
  call Cursor_d__ins_line_d(l:space_str)
endfunc


func! Curosr_line_end__ins(str) abort

  let l:n_cmd = 'A' . a:str
  call Normal(l:n_cmd)
endfunc

" cursor line  -  todo refactoring

func! Cursor_line_num() abort " alias

  return line('.')
endfunc

func! Cursor_line_end_col() abort " alias

  let l:col = col('$')
  return l:col
endfunc

" cursor line str

func! Cursor_line_str() abort

  return getline('.')
endfunc

func! Cursor_line_str_len() abort

  let l:len = Cursor_line_end_col() - 1
  return l:len
endfunc

func! Cursor_line_str_side_l() abort

  let l:line_l = getline('.')[:col('.')-2]
  return l:line_l
endfunc

func! Cursor_line_str_side_r() abort

  let l:line_r = getline('.')[col('.'):]
  return l:line_r
endfunc

func! Cursor_line_str_side_r_with_c() abort

  let l:line_r = getline('.')[col('.') - 1:]
  return l:line_r
endfunc

" cursor line str end

" cursor line str __

func! Cursor_line_top0__ins(str) abort

  call Cursor__mv_line_top0()
  call Cursor__ins(a:str)
endfunc

func! Cursor_line_top1__ins(str) abort

  call Cursor__mv_line_top1()
  call Cursor__ins(a:str)
endfunc

func! Cursor_line_end__dots_adjst() abort " todo dev, mb_str

  let l:line_str = Cursor_line_str()
  let l:idx = Str_srch(l:line_str, escape(g:dots_str, '.'))

  if l:idx >= 0
    call Cursor_line_end_dots__crct()
  else
    call Cursor_line_end__ins_dots()
  endif
endfunc

func! Cursor_line_end_dots__crct() abort

  let l:line_str = Cursor_line_str()
  let l:idx = Str_srch(l:line_str, escape(g:dots_str, '.'))

  if     l:idx < 0
    return
  elseif l:idx == g:dots_put_col
    return
  endif

  let l:line_str_0 = strcharpart(l:line_str,     0, l:idx)
  let l:line_str_1 = strcharpart(l:line_str, l:idx       )

  if     l:idx < g:dots_put_col

    let l:space_str = Str_space(g:dots_put_col - l:idx)
    let l:line_str = l:line_str_0 . l:space_str . l:line_str_1
  else
    let l:line_str_0 = strcharpart(l:line_str_0, 0, g:dots_put_col)
    let l:line_str = l:line_str_0 . l:line_str_1
  endif

  let l:line_num = Cursor_line_num()
  call setline(l:line_num, l:line_str)
endfunc

func! Cursor_line_end__ins_dots() abort

  let l:line_num = Cursor_line_num()

  let l:line_str = Cursor_line_str()

  let l:line_str_len = Cursor_line_str_len()

  let l:space_len = g:dots_put_col - l:line_str_len
  if l:space_len < 0
    let l:space_len = 0
  endif

  let l:space_str = Str_space(l:space_len)

  let l:line_str .= l:space_str . g:dots_str

  call setline(l:line_num, l:line_str)
endfunc

" cursor f

func! Cursor_f_space__del() abort

  let l:c = Cursor_c_char()

  if l:c =~ '\s'
    " echo "del"
    call Slct_cursor_f_space()
    call Normal('"zd')
  else
    call Nothing()
  endif
endfunc

" cursor __ ins line




func! Cursor_line__del() abort

  if Is_cursor_line_str__emp() || Is_cursor_line_str__space()
    call Normal('"_dd') " rgstr del
  else
    call Normal('"add')
    call Clipboard__ynk()
  endif
endfunc

func! Cursor_f_str_col__crct_by_line_u() abort

  let l:cursor_pos = Cursor_pos()

  let l:str = Cursor_line_str_side_r_with_c()
  let l:trim_len = Str_srch(l:str, '[^ ]')
  " echo l:trim_len
  let l:str = trim(l:str)

  let l:cursor_r_char =  Str_l_char(l:str)
  " echo l:cursor_r_char

  call Cursor__mv_u()
  let l:target_line_str = Cursor_line_str_side_r()
  call Cursor__mv_d()

  let l:crct_len = Str_srch(l:target_line_str, l:cursor_r_char) + 1
  " echo l:crct_len
  if l:crct_len == -1
    return
  endif

  let l:crct_len = l:crct_len - l:trim_len
  let l:space_str = Str_space(l:crct_len)
  call Cursor__ins(l:space_str)

  call Cursor__mv_by_pos(l:cursor_pos)
endfunc

" cursor line str __ end

" cursor line cnd

func! Is_cursor_line_num__(line_num) abort

  let l:ret = v:false

  let l:line_num = Cursor_line_num()

  if l:line_num == a:line_num

    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_cursor_line_num__file_edge_bgn() abort

  let l:line_num = 1
  let l:ret = Is_cursor_line_num__(l:line_num)
  return l:ret
endfunc

func! Is_cursor_line_num__file_edge_end() abort

  let l:line_num = Line_num_file_edge_end()
  let l:ret = Is_cursor_line_num__(l:line_num)
  return l:ret
endfunc

func! Is_cursor_line_num__file_edge() abort

  let l:ret = v:false

  if Is_cursor_line_num__file_edge_bgn() || Is_cursor_line_num__file_edge_end()

    let l:ret = v:true
  endif
  "echo l:ret
  return l:ret
endfunc

func! Is_cursor_line_str__emp() abort
  
  if Cursor_line_end_col() == 1
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_str__space() abort
  
  let l:str = Cursor_line_str()
  let l:ret = Is_str__space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str_side_l__space() abort

  let l:str = Cursor_line_str_side_l()
  let l:ret = Is_str__space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str_side_r__space() abort

  let l:str = Cursor_line_str_side_r()
  let l:ret = Is_str__space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str__ptn(ptn) abort " todo dev

  let l:str = Cursor_line_str_side_r()

  let l:ret = v:false

  if Is_str__ptn(l:str, a:ptn)

    let l:ret = v:true
  endif
  return l:ret
endfunc

" 
" line
" 

func! Line_num_file_edge_bgn() abort

  return line('^')
endfunc

func! Line_num_file_edge_end() abort " alias

  return line('$')
endfunc

" line xx __ ins

let s:line_top_space_ptn = '^[ \t]*'

let s:line_end_space_ptn = '[ \t]*$'

func! Line_end_space__del(line_num) abort
  
  let l:rpl_cmd = a:line_num . 's/' . s:line_end_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

func! Line_end__pad_space(line_num, fil_end_col) abort

  let l:line_str     = getline(a:line_num)
  let l:line_str_len = Str_len(l:line_str)
  let l:space_len    = a:fil_end_col - l:line_str_len

  if l:space_len <= 0
    return
  endif

  let l:space_str = Str_space(l:space_len)
  let l:line_str .= l:space_str
  call setline(a:line_num, l:line_str)
endfunc

let g:dots_str = ' .. '
let g:dots_put_col = 50

" refactoring def pos

func! Slctd_box_cursor_r_space__crct() range abort

  call Slct_re()
  let l:col = Cursor_col_num()
  " echo l:col
  call Slctd__cancel()

  " echo a:firstline . ' ' . a:lastline
  call Cursor__mv_by_line_col(a:firstline, l:col)

  for line_num in range(a:firstline, a:lastline)
    " echo l:line_num . ' ' . l:col
    " call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor_f_space__del()
    " call Normal('j')
    call Cursor__mv_d()
  endfor
endfunc

" line ins > cursor __ ins line

func! Slctd_line__del() abort " use not, todo dev

  call Normal('gvj')
  "call Normal('"ad')

  call Clipboard__ynk()
endfunc

func! Line__del_by_line_num(line_num) abort

  call deletebufline('%', a:line_num)
endfunc

" line cnd

" line num

func! Line_num_by_Line_info(line_info) abort

  let l:line_info = trim(a:line_info, ' ', 1)
  let l:line_num  = split(l:line_info, '\s\+')[0]
  return l:line_num
endfunc

" indnt

func! Cursor_line_indnt_col_with_c() abort

  let l:col = cindent(Cursor_line_num())
  return l:col
endfunc

func! Cursor_line_indnt__add(col) abort

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
  call Cursor__ins_mlt(l:char, l:col)

  call Cursor__mv_line_top1()
endfunc

func! Cursor_line_indnt__del() abort " alias

  call Exe('left')
endfunc

func! Cursor_line_indnt__shft_l() abort

  call Normal('<<')
  call Cursor__mv_line_top1()
endfunc

func! Cursor_line_indnt__shft_r() abort

  let l:col = 2

  call Cursor_line_indnt__add(l:col)
endfunc

func! Cursor_line_indnt__crct() abort

  let l:col = Cursor_line_indnt__crct_by_c()
  return l:col
endfunc

func! Cursor_line_indnt__crct_by_c() abort

  call Cursor_line_indnt__del()

  let l:col = Cursor_line_indnt_col_with_c()
  "echo l:col

  call Cursor_line_indnt__add(l:col)
  return l:col
endfunc

let g:v_rng = "'<,'>"

" 
" slctd
" 

" slctd __ ( slct )

func! Slctd__cancel() range abort " alias

  call Esc()
endfunc

" refactoring slct > slctd __ xxx

func! Slct_re() range abort

  if mode() == "\<c-v>" || mode() == "v"
    return
  endif

  call Normal('gv')
endfunc

" refactoring slct > slctd __ xxx

func! Slct_all() abort

  call Normal('ggVG')
endfunc

func! Slctd__word() abort

  let l:c = Cursor_c_char()

  if     l:c =~ '\w'
    call Normal('viw')

  elseif l:c =~ '\s'
    call Slct_cursor_f_space()
  else
    call Normal('v')
  endif
endfunc

func! Slctd__word_by_under_score() abort

endfunc

" refactoring slct > slctd __ xxx

func! Slct_cursor_f_space() abort

  let l:c = Cursor_c_char()

  if l:c !~ '\s'
    return
  endif
  "echo l:c

  if Is_cursor_line_str_side_r__space()

    call Normal('v')
    call Normal('$h')
    "call Cursor__mv_word_f()
    "call Normal('h')

  else
    call Normal('vwh')
  endif
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_col(s_col, len) abort

  let l:e_col = a:len - 1

  call Slct_by_line_col(v:null, a:s_col, v:null, e_col)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_pos(s_pos, e_pos) abort " use not

  call Cursor__mv_by_pos(a:s_pos)
  call Normal('v')
  call Cursor__mv_by_pos(a:e_pos)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort

  let l:s_line = (a:s_line == v:null) ? Cursor_line_num() : a:s_line
  let l:e_line = (a:e_line == v:null) ? Cursor_line_num() : a:e_line

  call Cursor__mv_by_line_col(l:s_line, a:s_col)
  call Normal('v')
  call Cursor__mv_by_line_col(l:e_line, a:e_col)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_rng(line_num_fr, line_num_to) abort
  
  call Cursor__mv_by_line_num(a:line_num_fr)
  call Normal('V')
  call Cursor__mv_by_line_num(a:line_num_to)
endfunc

" refactoring, def pos, > slctd cursor __ mv

func! Cursor__mv_slctd_edge_r() range abort
  
  call Slct_re()

  if   Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()

  " let l:n_cmd = '`>'
  " call Normal(l:n_cmd)
endfunc

func! Slctd_cursor_drct__mv_forward() range abort

  call Slct_re()

  if Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()
endfunc

" slctd __ expnd

func! Slctd__expnd() abort " expnd lr, cre re

endfunc

func! Slctd__expnd_srch() range abort " todo dev

  call Slct_re()
  call Cursor__mv_srch("f")
endfunc

func! Slctd__expnd_word_f() abort " todo run confirm ?

  let l:slctd_str = Slctd_str()
  let l:slctd_r_out_char = Slctd_edge_r_out_char()

  call Slct_re()

  if     Is_cursor_line_str_side_r__space()

    call Normal('$h')

  elseif l:slctd_str =~ '\s' && l:slctd_r_out_char =~ '\s'

    call Normal('wh')
  else
    call Normal('e')
  endif
endfunc

" slctd __ expnd quote

let g:quote_ptn = '[' . "'" . '"' . '`' . ']'

func! Slctd__expnd_quote_on_f() range abort

  call Slct_re()
  call Cursor__mv_srch_ptn(g:quote_ptn, 'f')
endfunc

func! Slctd__expnd_quote_on_b() range abort

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  call Cursor__mv_srch_ptn(g:quote_ptn, 'b')
  " call Cursor__mv_slctd_edge_tgl ()
endfunc

func! Slctd__expnd_quote_on_swtch() range abort

  " Is_cursor_line_str__ptn() " todo dev ?

  call Slct_re()

  let l:c = Cursor_c_char()

  if l:c !~ g:quote_ptn
    call Slctd__expnd_quote_on_f()
  else
    call Slctd__expnd_quote_on_b()
  endif
endfunc

func! Slctd__expnd_quote_on() range abort

  call Slct_re()

  call Slctd__expnd_quote_on_f()
  call Slctd__expnd_quote_on_b()
endfunc

func! Slctd__expnd_quote_in_f() range abort

  call Slctd__expnd_quote_on_f()
  call Normal('h')
endfunc

func! Slctd__expnd_quote_in_b() range abort

  call Slctd__expnd_quote_on_b()
  call Normal('l')
  " call Cursor__mv_slctd_edge_tgl()
endfunc

func! Slctd__expnd_quote_in_swtch() range abort

  call Slct_re()

  if ! Is_cursor_line_str__ptn(g:quote_ptn)
    return
  endif

  let l:c_r = Slctd_edge_r_out_char()

  if l:c_r !~ g:quote_ptn

    call Slctd__expnd_quote_in_f()
  else
    call Slctd__expnd_quote_in_b()
  endif
endfunc

func! Slctd__expnd_quote_switch() range abort

  call Slct_re()

  if Is_slctd_edge_char__quote()
    " call Esc()
    return
  endif

  if Is_slctd_edge_out_char__quote()

    call Slctd__expnd_quote_on()
  else
    call Slctd__expnd_quote_in_swtch()
  endif
endfunc

func! Slctd__expnd_bracket_f() range abort " todo dev

  let l:bracket_ptn = '[' . "'" . '"`)}\]' . ']'
  
  let l:s_col = Slctd_l_col()
  
  let l:line_str_r = Slctd_edge_r_out_str()
  let l:srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1

    call Normal('gv')
    return
  endif

  let l:len = l:s_col + Slctd_str_len() + l:srch_idx
  call Slct_by_col(l:s_col, l:len)
endfunc

func! Slctd__reduce_dlm_l(char) range abort

  let l:char = a:char

  call Slct_re()

  let l:slctd_str = Slctd_str()
  let l:srch_idx = Str_srch(l:slctd_str, l:char)
  if l:srch_idx == -1
    call Slctd__cancel()
    return
  endif

  let l:n_cmd = 'F' . l:char . 'h'
  call Normal(l:n_cmd)
endfunc

" slctd str

func! Slctd_str() range abort

  " call Normal('gv"zy')

  call Slct_re()
  call Normal('"zy')

  call Slct_re()

  return @z
endfunc

func! Slctd_str_len() range abort

  call Slct_re()

  let l:slctd_str = Slctd_str()
  let l:len       = Str_len(l:slctd_str)
  return l:len
endfunc

" slctd str end

" slctd str __ ( edit )

" todo refactoring, v paste > slctd __ ynk

func! Slctd__ynk() range abort

  call Slct_re()
  call Normal('"zd')
  call Cursor__ins_ynk()
endfunc

func! Slctd__clipboard() range abort

  call Ynk__clipboard()
  call Slctd__ynk()
endfunc

" slctd str __ rpl

func! Slctd_str__rpl(srch, rpl) range abort

  call Slctd_box__rpl(a:srch, a:rpl)
endfunc

" slctd str __ ( rpl )

func! Slctd_str__(str) range abort " todo dev

endfunc

" slctd str __ rpl, srch nxt slctd

func! Slctd__rpl_7_srch_nxt() abort " dir forward only

  call Slct_re()
  call Normal('"zd"aPlgn')
endfunc

" slctd str __ del

func! V_slctd__del() abort " dev doing, can

  call Slct_re()

  call Normal('"ad')
  let @+ = @a
endfunc

func! Slctd__del() range abort

  call Slct_re()

  let l:rgstr = 'z'

  let l:cmd = '"' . l:rgstr . 'dgv'
  call Normal(l:cmd)
endfunc

" slctd str __ pad

func! Slctd__pad(char) range abort

  let l:char = a:char

  if l:char == '|'
    let l:char = "\<bar>"
  endif

  call Slct_re()

  call Normal('r' . l:char)

  call Slct_re()
endfunc

func! Slctd__pad_space() range abort

  call Slctd__pad(' ')
endfunc

func! Slctd__pad_bar() range abort

  call Slctd__pad('|')
endfunc

func! Slctd_str_space__underscore() range abort

  call Slctd_str__rpl(' ', '_')
endfunc

" slctd str __ ( edit ) end

" slctd str edge

func! Slctd_l_col() abort

  call Cursor__mv_slctd_edge_l()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_r_col() abort

  call Cursor__mv_slctd_edge_r()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_l_pos() abort

  call Cursor__mv_slctd_edge_l()
  let l:pos = Cursor_pos()
  return l:pos
endfunc

func! Slctd_r_pos() abort

  call Cursor__mv_slctd_edge_r()
  let l:pos = Cursor_pos()
  return l:pos
endfunc

func! Slctd_edge_l_char() abort

  call Cursor__mv_slctd_edge_l()

  let l:c_char = Cursor_c_char()
  return l:c_char
endfunc

func! Slctd_edge_r_char() abort

  call Cursor__mv_slctd_edge_r()

  let l:c_char = Cursor_c_char()
  return l:c_char
endfunc

func! Slctd_edge_l_out_char() abort

  call Cursor__mv_slctd_edge_l()

  let l:l_char = Cursor_l_char()
  return l:l_char
endfunc

func! Slctd_edge_r_out_char() abort

  call Cursor__mv_slctd_edge_r()

  let l:r_char = Cursor_r_char()
  return l:r_char
endfunc

func! Slctd_edge_l_out_str() abort

  call Cursor__mv_slctd_edge_l()

  let l:str = Cursor_line_str_side_l()
  return l:str
endfunc

func! Slctd_edge_r_out_str() abort

  call Cursor__mv_slctd_edge_r()

  let l:str = Cursor_line_str_side_r()
  return l:str
endfunc

" slctd str edge end

" slctd str edge __ ( edit )

func! Slctd_edge_out__ins(c) range abort

  call Slct_re()

  if a:firstline != a:lastline
    call Slctd__cancel()
    return
  endif

  let l:c_l = a:c

  let l:c_r = a:c
  if     a:c == '('
    let l:c_r = ')'
  elseif a:c == '{'
    let l:c_r = '}'
  elseif a:c == '['
    let l:c_r = ']'
  elseif a:c == '<'
    let l:c_r = '>'
  endif

  call Normal('"zx')
  call Cursor__ins(l:c_l . l:c_r)

  let l:str_len = Str_len(l:c_l)
  call Normal(l:str_len . 'h')

  call Normal('"zP')
  call Normal('gv')

  let l:cnt = 0
  while l:cnt < l:str_len
    call Slctd_box__mv('r')

    let l:cnt += 1
  endwhile
endfunc

func! Slctd_edge_out__ins_markdown_strikethrough()

  call Slct_re()

  if a:firstline != a:lastline
    call Slctd__cancel()
    return
  endif

  call Slctd_edge_out__ins('~~')
endfunc

func! Slctd_edge_out__ins_markdown_bold()

  call Slctd_edge_out__ins('**')
endfunc

func! Slctd_edge_out_char__tgl() range abort

  call Slctd_edge_out_char__tgl_switch()
  " call Slctd_edge_out_quote__tgl()
endfunc

func! Slctd_edge_out_char__tgl_switch() range abort

  " char chk
  let l:c_l = Slctd_edge_l_out_char()
  let l:c_r = Slctd_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r
    call Slctd_edge_out_quote__tgl()
  elseif l:c_l == '"' && l:c_l == l:c_r
    call Slctd_edge_out_quote__tgl()
  elseif l:c_l == '`' && l:c_l == l:c_r
    call Slctd_edge_out_quote__tgl()

  elseif l:c_l == '(' && l:c_r == ')'
    call Slctd_edge_out_bracket__tgl()
  elseif l:c_l == '{' && l:c_r == '}'
    call Slctd_edge_out_bracket__tgl()
  elseif l:c_l == '[' && l:c_r == ']'
    call Slctd_edge_out_bracket__tgl()
  elseif l:c_l == '<' && l:c_r == '>'
    call Slctd_edge_out_bracket__tgl()

  else
    call Slctd_edge_out_quote__tgl()
  endif
endfunc

func! Slctd_edge_out_quote__tgl() range abort

  call Slct_re()

  if a:firstline != a:lastline
    return
  endif

  if Is_cursor_col__line_end()
    return
  endif

  " char chk
  let l:c_l = Slctd_edge_l_out_char()
  let l:c_r = Slctd_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r

    call Slctd_edge_out_cahr__del()
    let l:c = '"'
    call Slctd_edge_out__ins(l:c)

  elseif l:c_l == '"' && l:c_l == l:c_r

    call Slctd_edge_out_cahr__del()
    let l:c = '`'
    call Slctd_edge_out__ins(l:c)

  elseif l:c_l == '`' && l:c_l == l:c_r

    call Slctd_edge_out_cahr__del()
  else
    let l:c = "'"
    call Slctd_edge_out__ins(l:c)
  endif
endfunc

func! Slctd_edge_out_bracket__tgl() range abort

  call Slct_re()

  if a:firstline != a:lastline
    return
  endif

  if Is_cursor_col__line_end()
    return
  endif

  " char chk
  let l:c_l = Slctd_edge_l_out_char()
  let l:c_r = Slctd_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == '(' && l:c_r == ')'

    call Slctd_edge_out_cahr__del()
    let l:c = '{'
    call Slctd_edge_out__ins(l:c)

  elseif l:c_l == '{' && l:c_r == '}'

    call Slctd_edge_out_cahr__del()
    let l:c = '['
    call Slctd_edge_out__ins(l:c)

  elseif l:c_l == '[' && l:c_r == ']'

    call Slctd_edge_out_cahr__del()
    let l:c = '<'
    call Slctd_edge_out__ins(l:c)

  elseif l:c_l == '<' && l:c_r == '>'

    call Slctd_edge_out_cahr__del()
  else
    let l:c = '('
    call Slctd_edge_out__ins(l:c)
  endif
endfunc

func! Slctd_edge_out_cahr__del() range abort

  call Slct_re()

  if Is_slctd_edge_l_col__line_top()
    return
  endif

  call Normal('"zx')
  call Normal('xhx')
  call Normal('"zP')
  call Normal('gv')
  call Slctd_box__mv('l')
endfunc

" slctd str edge __ ( edit ) end

" slctd line

"   : none ?

" slctd line end

" slctd line __ ( edit )

" todo refactoring, fnc name mod, v > slctd

" v line __ rpl

func! V_line__rpl(srch, rpl) range abort

  let l:cmd = g:v_rng . 's/' . a:srch . '/' . a:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

" v line srch str __ rpl cr ( add cr )

func! V_line_srch_str__rpl_cr() range abort

  let l:srch = @/

  let l:cmd = g:v_rng . 's/\(' . l:srch . '\)/\1\r/g'
  call Exe(l:cmd)
endfunc

func! Slctd_line__rpl_by_line1_line2() range abort

  let l:srch = getline(1)
  let l:rpl  = getline(2)

  "let l:rng = '3,$'
  let l:rng = g:v_rng
  let l:cmd = l:rng . 's/' . l:srch . '/' . l:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line__markdown_strikethrough() range abort " todo dev

  
endfunc

func! Slctd__sys_cmd(sys_cmd) range abort

  let l:cmd = g:v_rng . '! ' . a:sys_cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line__rpl_sys_cmd(sys_cmd) range abort " read

  let l:cmd = "'<,'>" . " ! " . a:sys_cmd
  call Exe(l:cmd)
endfunc

" refactoring , v line > slctd line, pos

func! V_line_top_space__del() abort " refactoring ?

  let l:rpl_cmd = 's/' . s:line_top_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

" func! V_line_end_space__del() range abort
func! Slctd_line_end_space__del() range abort

  for line_num in range(a:firstline, a:lastline)

    call Line_end_space__del(l:line_num)
  endfor
endfunc

func! V_line_end__pad_space() range abort " use not

  " use recommend "aygvr gv

  call Slct_re()
  call Normal('o')

  let l:fil_end_col = Cursor_col_num() - 1

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:fil_end_col)
  endfor
endfunc

func! V_line__join_per_line(per_line_num) range abort

  let l:n_cmd = a:per_line_num . 'Jj'

  let l:line_num = a:lastline - a:firstline + 1

  let l:exe_num = l:line_num / a:per_line_num
  "echo l:exe_num

  for idx in range(1, l:exe_num)

    call Normal(l:n_cmd)
  endfor
endfunc

" slctd line __ crct tbl

func! Slctd_line__crct_tbl() range abort

  if     Is_env__('linux')
    let l:sys_cmd = '/usr/bin/column -t'
  elseif Is_env__('mac')
    let l:sys_cmd = 'column -t'
  else
    let l:sys_cmd = 'column -t'
  endif

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" v line xxx > slctd line xxx

func! V_line_indnt__space(indnt_col) range abort

  if Is_env__('win64')
    '<,'>:call V_line_tab__rpl_space(a:indnt_col)

  else
    let l:sys_cmd = '  expand   -t ' . a:indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

func! V_line_indnt__tab(indnt_col) range abort

  if Is_env__('win64')
    call Nothing()
  else
    let l:sys_cmd = 'unexpand   -t ' . a:indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

" slctd line tab

func! V_line_tab__rpl_space(space_col) range abort

  let l:space_str = Str_space(a:space_col)
  let l:cmd = g:v_rng . 's/\t/' . l:space_str . '/g'
  call Exe(l:cmd)
endfunc

" markdown tbl header

func! V_2_markdown_tbl_header() range abort

  '<,'>:call V_line__rpl('[^|]', '-')
  '<,'>:call V_line__rpl( '|.',  '| ')
  '<,'>:call V_line__rpl('.|' , ' |' )
endfunc

" slctd line indnt __ shft

func! Slctd_indnt__shft_l() abort " todo

endfunc

func! Slctd_indnt__shft_r() abort " todo

endfunc

" slctd line __ ( edit ) end

" slctd box __ ( edit )

func! Slctd_box_edge_l__ynk_line_1() range abort

  if @a =~ '\n'
    echo 'yank is include cr'
    return
  endif

  call Slct_re()

  if Is_cursor_col__line_end()
    call Slctd__pad_space()

    call Slctd__del()
    " call Normal('"zdgv') " see
  endif

  call Cursor__mv_slctd_edge_l()
  call Esc()
  " call Normal("\<esc>")

  " let l:col_num = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    let l:col_num = Cursor_col_num()

    call Cursor__ins_ynk()

    call Cursor__mv_by_line_col(l:line_num, l:col_num)
    call Cursor__mv_d()
    " if l:line_num != a:lastline
    "   call Normal('j')
    " endif
  endfor
endfunc

func! Slctd_box__mv(lr) range abort

  call Slct_re()

  let l:n_cmd = Lr_2_normal_cmd(a:lr)
  call Normal('o' . l:n_cmd)
  call Normal('o' . l:n_cmd)
endfunc

func! Slctd_box_width__1() range abort

  call Slct_re()

  if ! Is_slctd_mode__box()
    return
  endif

  call Normal('o')
  let l:col_num = Cursor_col_num()

  call Normal('o')
  call Cursor__mv_by_col_num(l:col_num)
endfunc

func! Slctd_box_str__mv(lr) range abort

  let l:n_cmd = Lr_2_normal_cmd(a:lr)

  call Slct_re()
  call Normal('"zx')
  call Normal(l:n_cmd)
  call Normal('"zP')

  call Slct_re()
  call Slctd_box__mv(a:lr)
endfunc

" slctd box __ rpl

func! Slctd_box__rpl(srch, rpl) range abort

  let l:srch = a:srch
  let l:rpl  = a:rpl

  let l:cmd = g:v_rng . 's/' . '\%V' . l:srch . '/' . l:rpl . '/g'
  call Exe(l:cmd)
endfunc

" slctd box space __ del

func! Slctd_box_space__del() range abort

  let l:srch = ' '
  let l:rpl  = ''

  '<,'>:call Slctd_str__rpl(srch, rpl)
endfunc

" slctd box char __ shft

func! Slctd_box_edge_r_char__shft_in() range abort

  let l:cmd = g:v_rng . 's/' . '\%V\([ ]\+\)\([^ ]\)' . '/' . '\2\1' . '/g'
  call Exe(l:cmd)

  call Slct_re()
endfunc

" slctd box __ ( edit ) end

" slctd end

" slctd cnd

func! Is_slctd_str__srch_str() abort

  if Slctd_str() ==# @/
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_slctd_str__line_mlt() abort

  if Slctd_str() =~ '\n'
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_slctd_mode__box() range abort

  " call Slct_re()

  let l:ret = v:false

  if mode() == "\<c-v>"
    " echo "c-v"
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_slctd_mode__line() range abort

  " call Slct_re()

  let l:ret = v:false

  if mode() == "v"
    " echo "v"
    let l:ret = v:true
  endif
  return l:ret
endfunc

" slctd edge cnd

func! Is_slctd_edge_char__(ptn)

  let l:c1 = Slctd_edge_l_char()
  let l:c2 = Slctd_edge_r_char()

  let l:ret = Is_char_bth__(a:ptn, l:c1, l:c2)
  return l:ret
endfunc

func! Is_slctd_edge_char__quote() abort

  let l:ret = Is_slctd_edge_char__(g:quote_ptn)
  return l:ret
endfunc

func! Is_slctd_edge_out_char__(ptn)

  let l:c1 = Slctd_edge_l_out_char()
  let l:c2 = Slctd_edge_r_out_char()

  let l:ret = Is_char_bth__(a:ptn, l:c1, l:c2)
  return l:ret
endfunc

func! Is_slctd_edge_out_char__quote() abort

  let l:ret = Is_slctd_edge_out_char__(g:quote_ptn)
  return l:ret
endfunc

func! Slctd_cursor__mv_jmp_v(drct) range abort

  call Slct_re()
  call Cursor__mv_jmp_v(a:drct)
endfunc

func! Slctd_cursor__mv_line_end() range abort

  call Slct_re()

  if     Is_slctd_mode__box()

    if Is_cursor_col__line_end_ovr()
      return
    endif

    call Normal('$h')
    "call Normal('g_')

  elseif Is_slctd_mode__line()

    if Is_cursor_line_str__emp()
      return
    endif

    call Normal('$h')
    "call Normal('g_')
  else
    echo "v mode else"
  endif
endfunc

func! Slctd_cursor__mv_file_edge(n_cmd) abort

  call Slct_re()

  call Cursor__mv_file_edge(a:n_cmd)
endfunc

" slctd etc

func! Slctd_srch__switch() abort " srch, set or run

  if Is_slctd_str__line_mlt()

    call Slctd__expnd_srch()
  else
    call Slctd_srch_str__slctd_str()
  endif
endfunc

" ynk

func! Ynk__clr() abort

  let @a = ''
endfunc

func! Ynk__(str) abort

  let @a = a:str
endfunc

func! Ynk__line() abort

  call Normal('"ayy')
  "l:line_str = Cursor_line_str()
  "let @a = l:line_str

  call Clipboard__ynk()
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
endfunc

" func! V_ynk() abort
func! Ynk__slctd() abort

  let @e = @d
  let @d = @c
  let @c = @b
  let @b = @a

  call Normal('gv"ay')
  call Clipboard__ynk()
endfunc

func! Ynk__add_slctd() abort

  call Normal('gv"Ay')
  call Clipboard__ynk()
endfunc

" clipboard

func! Clipboard__ynk() abort

  if Is_env__('linux')

    "call C9clp__ynk() " off

  else
    let @+ = @a
  endif
endfunc

" 
" srch
" 

" srch exe, ref: cursor __ mv srch ptn

func! Srch_str() abort

  let l:str = @/
  return l:str
endfunc

func! Srch_str_flt() abort

  let l:str = @/

  if Is_srch_word1()
    let l:str = strcharpart(l:str, 2, strchars(l:str) - 4)
  endif
  " echo l:str

  return l:str
endfunc

func! Srch_str_word1(str) abort

  if a:str == v:null
    let l:str = Srch_str_flt()
  else
    let l:str = a:str
  endif

  let l:str = '\<' . l:str . '\>'
  return l:str
endfunc

func! Is_srch_word1() abort

  let l:str = @/
  let l:ret = v:false

  let l:str_l = strcharpart(l:str, 0, 2)
  let l:str_r = strcharpart(l:str, strchars(l:str) - 2)

  if l:str_l == '\<' && l:str_r == '\>'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Srch_str__(str, op_word1) abort

  let l:exe_str = a:str

  let l:exe_str = escape(l:exe_str, '.*~[]\^$')

  let l:exe_str = substitute(l:exe_str, '\n', '\\n', 'g')
  " echo l:exe_str

  if a:op_word1 == v:true
    let l:exe_str = Srch_str_word1(l:exe_str)
  endif

  if "@/" == "l:exe_str" " same ltst 01
    return
  endif

  let @/ = l:exe_str " highlight
  call Normal('/' . l:exe_str) " srch hstry add
endfunc

func! N_srch_str__flt() abort

  let l:str = Cursor_word()
  call Srch_str__(l:str, v:false)
endfunc

func! N_srch_str__word1_tgl() abort

  let l:str = Srch_str_flt()

  if Is_srch_word1()

    call Srch_str__(l:str, v:false)
  else
    call Srch_str__(l:str, v:true)
  endif
endfunc

func! Srch_str_ltst(idx) abort

  let l:str = histget('/', - a:idx)
  return l:str
endfunc

func! Srch_str__prv_tgl() abort

  if @/ == Srch_str_ltst(1)

    if            Srch_str_ltst(1)        == '\<' . Srch_str_ltst(2) . '\>'
      let l:srch_str = Srch_str_ltst(3)

    elseif '\<' . Srch_str_ltst(1) . '\>' ==        Srch_str_ltst(2)

      let l:srch_str = Srch_str_ltst(3)
    else
      let l:srch_str = Srch_str_ltst(2)
    endif
  else
    let l:srch_str = Srch_str_ltst(1)
  endif

  let @/ = l:srch_str
endfunc

" refactoring Slctd_srch_str__slctd_str > Srch_str__slctd_str ?

func! Slctd_srch_str__slctd_str() range abort

  if Is_slctd_str__srch_str()
    call Slctd__cancel()
    return
  endif

  call Slct_re()

  let l:str = Slctd_str()
  call Srch_str__(l:str, v:false)
  call Slctd__cancel()
endfunc

func! Srch_slct(dir) abort

  if     a:dir == 'f'
    call Normal('gn')

  elseif a:dir == 'b'
    call Normal('gN')
  endif
endfunc

func! V_srch_7_slct(dir) abort " srch rpl skip

  if     a:dir == 'f'
    call Normal('`>lgn')

  elseif a:dir == 'b'
    call Normal('`<hgN')
  endif
endfunc

func! Srch_7_cursor__mv_nxt(dir) abort

  call Srch_slct(a:dir)
  call Esc()
  " call Normal("\<esc>")
  call Esc()
  call Cursor__mv_char_f()
endfunc

func! Srch_char(dir, char) abort

  let @/ = '[' . a:char . ']'
  call Cursor__mv_srch(a:dir)
endfunc

func! Srch_char_bracket(dir) abort

  let l:char_bracket = "'" . '")}\]'
  call Srch_char(a:dir, l:char_bracket)
endfunc

" cmnt

func! Cursor__ins_cmnt_1(cmd_cursor__mv_line_top) abort

  let l:cmnt_1_def = {
  \ 'lua'       : '-- ',
  \ 'text'      : '# ' ,
  \ 'vim'       : '" ' ,
  \ 'fish'      : '# ' ,
  \ 'sh'        : '# ' ,
  \ 'css'       : '/* ',
  \ 'javascript': '// ',
  \ 'java'      : '// ',
  \ 'sql'       : '-- ',
  \ 'dflt'      : '# '
  \ }
  let l:str = get(l:cmnt_1_def, &filetype, l:cmnt_1_def['dflt'])

  if a:cmd_cursor__mv_line_top != v:null
    call Normal(a:cmd_cursor__mv_line_top)
  endif

  call Normal('i' . l:str)
  
  call Normal('^') " or '0'
endfunc

func! V_ins_cmnt_1() range abort

  call Normal(a:firstline . 'G')
  call Normal('^')
  let l:col = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:col - 1)

    call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor__ins_cmnt_1(v:null)
  endfor
endfunc

func! Cursor__ins_cmnt_mlt_by_pos(pos) abort

  let l:cmnt_mlt_def = #{
  \  lua       : ['--[[' , '--]]'],
  \  html      : ['<!--' ,  '-->'],
  \  css       : ['/*'   ,  ' */'],
  \  javascript: ['/*'   ,  ' */'],
  \  java      : ['/*'   ,  ' */'],
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

func! Cursor__ins_cmnt_mlt() abort

  call Cursor__ins_cmnt_mlt_by_pos('bgn')
  call Cursor__ins_cmnt_mlt_by_pos('end')
endfunc

func! V_ins_cmnt_mlt() range abort

  call Normal(a:lastline  . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('end')

  call Normal(a:firstline . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('bgn')
endfunc

" markdown

func! Cursor__ins_markdown_h() abort

  call Cursor__mv_line_top0()
  let l:top0_char = Cursor_c_char()

  let l:str = '#'

  if l:top0_char != l:str
    let l:str .= ' '
  endif

  call Cursor__ins(l:str)

  let l:ptn = '^#* '
  let l:col = Str_srch_end(Cursor_line_str(), l:ptn) + 1
  call Cursor__mv_by_line_col(v:null, l:col)
endfunc

func! Cursor__ins_markdown_cr() abort

  call Cursor__ins('  ')
endfunc

func! Cursor__ins_markdown_itm() abort

  if Is_line_markdown_itm()
    call Cursor_line_indnt__shft_r()
    return
  endif

  let l:col = Cursor_line_indnt__crct()

  let l:str = '- '
  "echo l:str
  call Cursor_line_top1__ins(l:str)
endfunc

func! Cursor__ins_markdown_code() abort

  let l:str = '```'
  call Cursor__ins_line(l:str)
endfunc

func! Char_markdown_chk__tgl() abort
  
  if Cursor_l_char() != '[' || Cursor_r_char() != ']'
    return
  endif
  
  let l:cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' '
    let l:rpl_char = 'x'
  else
    let l:rpl_char = ' '
  endif
  
  call Cursor_char__rpl(l:rpl_char)
endfunc

" markdown cnd

func! Is_line_markdown_itm() abort

  let l:ptn = '^\s*- '
  let l:str = Cursor_line_str()
  let l:idx = Str_srch(l:str, l:ptn)

  if l:idx == -1
    return v:false
  else
    return v:true
  endif
endfunc

" tag jmp by str

func! Tag_jmp_by_str(rg_rslt_line) abort

  let l:rg_rslt_line = trim(a:rg_rslt_line)

  if Is_str__emp(l:rg_rslt_line)
    echo 'empty'
    return
  endif

  let l:rg_rslt_line = matchstr(l:rg_rslt_line, '\S\+')
  " echo l:rg_rslt_line

  let l:rg_rslt_line_ar = Rg_rslt_line_parse(l:rg_rslt_line)
  " echo l:rg_rslt_line_ar

  let l:filename = l:rg_rslt_line_ar[0]
  let l:line_num = get(l:rg_rslt_line_ar, 1, 1)
  " echo l:line_num
  " return

  if ! filereadable(l:filename)
    echo 'file does not exist'
    return
  endif

  call Exe('tab drop ' . l:filename)
  call Normal(l:line_num . 'G')
endfunc

func! Tag_jmp_by_cursor_line() abort

  let l:base_buf_num = Buf_num()

  let l:str = Cursor_line_str()
  call Tag_jmp_by_str(l:str)

  call Exe('sbuffer ' . l:base_buf_num)
  " call Normal('j')
  call Cursor__mv_d()
endfunc

func! Tag_jmp_by_slctd_line() range abort

  let l:base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(l:line_num)
    call Tag_jmp_by_str(l:line)
    call Exe('sbuffer ' . l:base_buf_num)
  endfor
endfunc

func! Rg_rslt_line_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  "echo l:ret

  let l:idx = 0
  while l:idx < len(l:ret)

    let l:ret[l:idx] = trim(l:ret[l:idx])

    let l:idx = l:idx + 1
  endwhile

  if ( len(l:ret) > 1 ) && ( ! Is_char__num(l:ret[1]) )
    let l:ret[1] = '1'
  endif

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

func! Opn(filename) abort

  call Exe('tab drop ' . a:filename)
endfunc

func! Opn_tmp() abort

  let l:path = Tmp_cre()
  echo l:path
  call Opn(l:path)
endfunc

let g:vimrc_file_path = '~/wrk/cnf/vim/.vimrc'

func! Opn_vimrc() abort

  call Opn(g:vimrc_file_path)

  if Is_env__('win32unix') " gitbash

    let l:vimrc_gitbash_file_path = '~/wrk/cnf/vim/.vimrc_gitbash'
    call Opn(l:vimrc_gitbash_file_path)
  endif
endfunc

func! Opn_fish_cnf() abort

  let l:path = '~/.config/fish/config.fish'
  call Opn(l:path)
endfunc

func! Opn_man(cmd) abort

  call Exe('tab new')
  call Exe('Man ' . a:cmd)
  call Exe('only')
endfunc

func! Opn_vim_key() abort

  let l:path = '~/doc/tech/vim/m.key.default.md'
  call Opn(l:path)
endfunc

" let g:opn_memo_path = '../memo.md'
let g:opn_memo_path = 'doc/memo.md'

func! Opn_memo() abort

  call Opn(g:opn_memo_path)
endfunc

func! Opn_grep_wk() abort

  let g:grep_wk_path = '~/wrk/tmp/rg.md'

  let l:file_type = getftype(g:grep_wk_path)

  if Is_str__emp(l:file_type)

    call Opn(g:grep_wk_path)
  else
    call Opn_tmp()
  endif
endfunc

" opn app

func! Opn_app(path) abort
  
  let l:path = a:path
  
  if     Is_env__('mac')

    let l:cmd_sys = 'open'

  elseif Is_env__('win64')

    let l:cmd_sys = 'start'

  elseif Is_env__('win32unix')

    let l:cmd_sys = 'start'

  else
    return
  endif

  if Is_env__('win64')

    let l:path = Str_path_unix__cnv_win(l:path)
  endif

  let l:res = system(l:cmd_sys . " '" . l:path . "'")
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

  "let l:path = Line_str_by_line_num(a:line_num)
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
  echo l:path

  call Opn_app(l:path)
endfunc

func! Opn_dir_slf() abort

  let l:dir = Slf_dir()
  "echo l:path

  call Opn_app(l:dir)
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

" buf

func! Buf_num() abort

  return bufnr('%')
endfunc

func! Buf__fltr() abort " use not

endfunc

" win splt

func! Win_splt_h() abort

  let l:cmd = 'split'
  call Exe(l:cmd)
endfunc

func! Win_splt_v() abort

  let l:cmd = 'vsplit'
  call Exe(l:cmd)
endfunc

func! Win_splt_quit() abort

  let l:n_cmd = "\<c-w>c"
  call Normal(l:n_cmd)
endfunc

func! Win_splt_tgl() abort " todo dev

  
endfunc

func! Win_splt_cursor__mv_nxt() abort

  let l:n_cmd = "\<c-w>w"
  call Normal(l:n_cmd)
endfunc

" complete  -  mode insert ins lst

func! I_symbol01() abort

  let l:lst = [ '$', '@', '#', ';', '%' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_symbol02() abort

  let l:lst = [ '!', '?', '~', '^', '&', '|', '\', '/' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_symbol03() abort

  let l:lst = [ '=', '+', '-' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_bracket() abort

  let l:lst = [ '()', '{}', '[]', '<>', '[]()', '[][]', '(){}' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_quote() abort

  let l:lst = [ "''", '""', '``' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_markdown_lnk() abort

  let l:lst = [ '[]()', '[][]', '![]()' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_week() abort

  call complete(col('.'), g:week_def)
  return ''
endfunc

func! I_num() abort

  let l:lst = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_reg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc

func! I_todo_status() abort

  let l:lst = [ 'done', 'doing', 'on hold' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_reserved_lua() abort
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

" fzf fnc

func! Fzf_rg(...) abort " alias

  let l:ptn   = ( a:0 >= 1 ) ? a:1 : ''
  " let l:ptn   = ( a:0 >= 1 ) ? a:1 : g:rg_some_line_ptn
  
  let l:ext   = ( a:0 >= 2 ) ? a:2 : v:null
  let l:word1 = ( a:0 >= 3 ) ? a:3 : v:false

  call Fzf_rg_with_grep(l:ptn, l:ext, l:word1)
endfunc

func! Fzf_rg_with_grep(...) abort

  if ! ( Is_env__('mac') || Is_env__('linux') || Is_env__('win64') )
    return
  endif

  let l:ptn   = ( a:0 >= 1 ) ? a:1 : ''
  " let l:ptn   = ( a:0 >= 1 ) ? a:1 : g:rg_some_line_ptn

  let l:ext   = ( a:0 >= 2 ) ? a:2 : v:null
  let l:word1 = ( a:0 >= 3 ) ? a:3 : v:false

  let l:rg_cmd = Rg_cmd(l:ptn, l:ext, l:word1, v:null)
  " echo l:rg_cmd

  call fzf#vim#grep(
  \      l:rg_cmd,
  \      0,
  \      fzf#vim#with_preview(
  \        {'options': '--exact --delimiter : --nth 3..'},
  \        'up:70%:hidden',
  \        'ctrl-u'
  \      ),
  \      1
  \    )

  " ref
  " fzf#vim#grep(
  "   command,
  "   [has_column bool],
  "   [spec dict],
  "   [fullscreen bool]
  " )
endfunc

" fzf rg ext

func! Fzf_rg_ext(ext) abort

  let l:ext = a:ext
  call Fzf_rg(v:null, l:ext)
endfunc

" rg word1
func! Fzf_rg_word1(ptn) abort

  call Fzf_rg(a:ptn, v:null, v:true)
endfunc

" fzf rg by run

let g:fzf_line_cnt_max = 30000

func! Fzf_rg_with_run(...) abort

  let l:ptn = ( a:0 >= 1 ) ? a:1 : v:null

  if l:ptn == v:null

    let l:rg_rslt_cnt = Rg_all_cnt()

    if l:rg_rslt_cnt > g:fzf_line_cnt_max
      echo "l:rg_rslt_cnt, end"
      return
    endif

    let l:fzf_src_ar = Rg_all_rslt_ar()

  else
    let l:rg_rslt_cnt = Rg_ptn_cnt(l:ptn, v:null)

    if l:rg_rslt_cnt > g:fzf_line_cnt_max
      echo "l:rg_rslt_cnt, end"
      return
    endif

    let l:fzf_src_ar = Rg_ptn_rslt_ar(l:ptn, v:null)
  endif

  call fzf#run(
  \      {
  \        'source' : l:fzf_src_ar,
  \        'sink'   : funcref('Tag_jmp_by_str'),
  \        'window' : '-tabnew',
  \      }
  \    )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

func! Fzf_by_txt(...) abort

  let l:src_txt  = ( a:0 >= 1 ) ? a:1 : v:null
  let l:fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

  let l:src_ar = Txt_to_ar(l:src_txt)

  call Fzf_by_ar(l:src_ar, fnc_name)
endfunc

func! Fzf_by_ar(...) abort

  let l:src_ar   = ( a:0 >= 1 ) ? a:1 : v:null
  let l:fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

  if len(l:src_ar) > g:fzf_line_cnt_max
    echo "l:fzf src_ar, end"
    return
  endif

  call fzf#run(
  \      {
  \        'source' : l:src_ar,
  \        'sink'   : funcref(l:fnc_name),
  \        'window' : '-tabnew',
  \      }
  \    )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

" fzf tag jmp by file

func! Fzf_tag_jmp_by_file(...) abort

  let l:file_path = ( a:0 >= 1 ) ? a:1 : 'doc/memo.md'

  let l:fzf_src_txt = File_txt(l:file_path)
  let l:fnc_name    = 'Tag_jmp_by_str'
  call Fzf_by_txt(fzf_src_txt, fnc_name)
endfunc

" fzf buf

func! N_fzf_buf() abort
  
  exe 'FzfBufCrnt '
endfunc

func! V_fzf_buf() abort

  call Slctd_srch_str__slctd_str()
  exe 'FzfBufCrnt ' . escape(@z, '.*~')
endfunc

func! Fzf_rgstr() abort
  
  let l:rgstr_info = execute(':reg')->split("\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
  \   {
  \     'source': l:rgstr_info,
  \     'sink'  : funcref('Ynk__by_rgstr_info'),
  \     'window': '-tabnew'
  \   }
  \ )
  " \     'sink'  : funcref('Cursor__ins_rgstr_by_rgstr_info'),
endfunc

" fzf jmplst

func! Fzf_jmplst() abort
  
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

" fzf file

func! Fzf_file() abort

  let l:sys_cmd = 'fd --type f'
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Opn'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

" fzf dir

func! Fzf_dir() abort

  let l:sys_cmd = 'fd --type d'
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Fzf_dir_jmp() abort

  let l:sys_cmd = 'dir_jmp_lst_with_z'
  " let l:sys_cmd = 'dir_jmp_lst_with_zoxide'

  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Fzf_doc_memo_opn() abort

  let l:dir = '~'

  let l:fzf_src_ar = [
  \   l:dir . '/wrk/cnf/doc/memo.md',
  \   l:dir . '/wrk/prj-pri-share/doc-tech-ds/doc/memo.md',
  \   l:dir . '/wrk/prj-pri-share/life/doc/memo.md',
  \   l:dir . '/wrk/prj-pri-share/wall-paper/doc/memo.md'
  \ ]

  let l:fnc_name    = 'Opn'
  call Fzf_by_ar(l:fzf_src_ar, l:fnc_name)
endfunc

func! Fzf_vim_fnc_call() abort

  let l:rg_ptn = '^func! [\w]+\(.*\)'

  let l:sys_cmd_rg = "rg " . "-No '" . l:rg_ptn . "' " . g:vimrc_file_path

  let l:sys_cmd_sed = 'sed "s/func! //g"'

  let l:sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Cmdline__'

  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

let g:doc_tech_dir_rel = 'wrk/prj-pri-share/doc-tech-ds/docs/md'

func! Fzf_doc_tech() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt  = ' -v'
  let l:opt .= ' --no-heading'
  " let l:opt .= ' --line-number'
  let l:sys_cmd_rg = "rg" . l:opt . " '" . l:ptn . "' ~/" . g:doc_tech_dir_rel
  " echo l:sys_cmd

  let l:sys_cmd_sed = 'sed "s|^.*' . g:doc_tech_dir_rel . '/||g"'

  let l:sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed

  let l:fzf_src_txt = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Doc_tech_tag_jmp'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Doc_tech_tag_jmp(str) abort

  let l:str = $HOME . '/' . g:doc_tech_dir_rel . '/' . a:str
  " echo l:str
  call Tag_jmp_by_str(l:str)
endfunc

" rg

let g:fzf_rg_opt = ''
\     . ' --color=always'
\     . ' --line-number'
\     . ' --smart-case'
\     . ' --no-multiline'
\     . ' --no-heading'
\     . ' --hidden'

func! Rg_cmd(ptn, ext, word1, opt) abort

  if a:ptn == v:null
    let l:ptn = ''
  else
    let l:ptn = a:ptn
  endif

  if a:ext == v:null
    let l:fzf_rg_opt_ext = ''
  else
    let l:fzf_rg_opt_ext = ' -g "*.' . a:ext . '"'
  endif

  if a:word1 == v:true
    let l:fzf_rg_opt_word1 = ' -w'
  else
    let l:fzf_rg_opt_word1 = ''
  endif

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = ' ' . a:opt
  endif

  let l:rg_cmd = 'rg '
  \     . g:fzf_rg_opt
  \     . l:fzf_rg_opt_ext
  \     . l:fzf_rg_opt_word1
  \     . l:opt
  \     . ' -- ' . '"' . escape(l:ptn, '().$') . '"'

  return l:rg_cmd
endfunc

let g:rg_emp_line_ptn  = '^[ \t]*$'
let g:rg_some_line_ptn = '^[^ \t]+$'
" let g:rg_some_line_ptn = '[^ \t]'

func! Rg_ptn_cnt(ptn, opt) abort

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = a:opt
  endif

  let l:rg_cmd = "rg " . l:opt . " -e '" . a:ptn . "' | count"
  let l:rg_rslt_cnt = Sys_cmd(l:rg_cmd)
  return l:rg_rslt_cnt
endfunc

func! Rg_all_cnt() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt = '-v'

  let l:rg_rslt_cnt = Rg_ptn_cnt(l:ptn, l:opt)
  return l:rg_rslt_cnt
endfunc

func! Rg_all_rslt_ar() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt = '-v'

  let l:rslt_ar = Rg_ptn_rslt_ar(l:ptn, l:opt)
  return l:rslt_ar
endfunc

func! Rg_ptn_rslt_ar(ptn, opt) abort

  let l:rg_rslt_txt = Rg_ptn_rslt_txt(a:ptn, a:opt)
  let l:rg_rslt_ar  = split(l:rg_rslt_txt, "\n")
  return l:rg_rslt_ar
endfunc

func! Rg_ptn_rslt_txt(ptn, opt) abort
  
  let l:rg_cmd = Rg_cmd(a:ptn, v:null, v:null, a:opt) " todo dev
  let l:r_rslt_txt = Sys_cmd(l:rg_cmd)
  return l:r_rslt_txt
endfunc

func! Ynk__by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  let l:scrpt = 'let @a = @' . l:rgstr
  execute(l:scrpt)
endfunc

func! Cursor__ins_rgstr_by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  call Normal('"' . l:rgstr . l:rgstr . 'P')
endfunc

func! Rgstr_info_rgstr(rgstr_info) abort

  let l:rgstr = strcharpart(a:rgstr_info, 6, 1)
  return l:rgstr
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

func! Txt_to_ar(txt) abort

  let l:line_ar  = split(a:txt, "\n")
  return l:line_ar
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
  if Is_str__emp(l:alph)
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

" encode sjis  -  load re

func! Load_re__sjis() abort

  call Exe('e ++enc=sjis')
endfunc

" encode confirm

func! Encode_confirm() abort

  call Exe('set enc?')
endfunc

" trns

func! V_trns() range abort

  let l:str = Slctd_str()

  let l:str = substitute(l:str, "\n", ' ', 'g')

  if l:str =~ '[^\x01-\x7E]' " mlt byte
    let l:lang = '{ja=en}'
  else
    let l:lang = '{en=ja}'
    "let l:lang = ''
  endif

  let l:str = escape(l:str, "'")
  let l:sys_cmd = 'trans -no-ansi ' . l:lang . " '" . l:str . "'"
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
endfunc

" math

func! V_math() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'echo ' . "'" . l:str . "'" . ' | math'
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
  let @a = l:rslt
endfunc

" url encdoe

func! V_url_encode() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'url_encode "' . l:str . '"'
  let l:rslt = Sys_cmd(l:sys_cmd)
  "echo l:rslt
  call Cursor__ins(l:rslt)
endfunc

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" env

func! Is_env__(env) abort " alias

  " a:env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  let l:ret = has(a:env)

  if a:env != 'mac'
    " echo a:env . ' : ' . l:ret
    " echo hostname()
  endif

  return l:ret
endfunc

" 
" plugin
" 

func! Vim_plug_path() abort

  if     Is_env__('mac')

    let l:vim_plug_dir_mac_nvim = $HOME . '/.local/share/nvim/site'
    let l:vim_plug_dir_mac_vim  = $HOME . '/.vim'

    if     isdirectory(l:vim_plug_dir_mac_nvim)
      let l:vim_plug_dir = l:vim_plug_dir_mac_nvim

    elseif isdirectory(l:vim_plug_dir_mac_vim)
      let l:vim_plug_dir = l:vim_plug_dir_mac_vim

    else
      let l:vim_plug_dir = l:vim_plug_dir_mac_vim
    endif

  elseif Is_env__('win64')
    let l:vim_plug_dir = '~/appdata/local/nvim-data/site'

  elseif Is_env__('linux')

    let l:vim_plug_dir_c9 = "/home/ec2-user/.vim"
    let l:vim_plug_dir_s9 = "/home/centos/.local/share/nvim/site"

    if     isdirectory(l:vim_plug_dir_c9)
      let l:vim_plug_dir = l:vim_plug_dir_c9

    elseif isdirectory(l:vim_plug_dir_s9)
      let l:vim_plug_dir = l:vim_plug_dir_s9
    endif

  elseif Is_env__('win32unix')
    let l:vim_plug_dir = '~/.vim'

  else
    let l:vim_plug_dir = '~/.vim'
  endif

  let l:vim_plug_path = l:vim_plug_dir . '/autoload/plug.vim'
  return l:vim_plug_path
endfunc

func! Is_vim_plug__installed() abort

  let l:vim_plug_path = Vim_plug_path()
  " echo l:vim_plug_path

  let l:ret = ! empty(glob(l:vim_plug_path))
  " echo 'vim_plug installed : ' . l:ret

  return l:ret
endfunc

" 
" init
" 

if Is_vim_plug__installed()
  "echo 'plug#begin'

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/vim-molder'
  "Plug 'mattn/vim-molder-operations'
  "Plug 'jacquesbh/vim-showmarks'
  call plug#end()
endif
" do :PlugInstall
" or :PlugUpdate
" or :PlugClean

" ynk init
call Ynk__clipboard()

" shell & .vimrc_env
set shell=fish           " default

if     Is_env__('mac')   " mac

  set shell=fish

elseif Is_env__('linux') " c9

  "set shell=bash
  set shell=fish

  source ~/wrk/cnf/vim/.vimrc_c9

elseif Is_env__('win64') " pwsh ( for fzf )

  let &shell = Is_env__('win32') ? 'powershell' : 'pwsh'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=

  source ~/wrk/cnf/vim/.vimrc_pwsh

elseif Is_env__('win32unix') " gitbash ( for fzf )

  "echo "gitbash"
  set shell=bash

  source ~/wrk/cnf/vim/.vimrc_gitbash

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

" comment auto off ( final def )
au FileType * set fo-=c fo-=r fo-=o

" 
" ref normal
" 

" ref normal
" 
" https://vim-jp.org/vimdoc-ja/vimindex.html


" ref ptn ( regex )
" 
" url : xxx

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

