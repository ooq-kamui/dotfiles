-- 
-- key map
-- 

-- ojroques/nvim-osc52
vim.keymap.set('v', 'C', require('osc52').copy_visual)


-- 
-- migration  fr init.vim
-- 

-- 
-- mode normal
-- 

-- mode normal esc

-- vim.keymap.set('n', '<esc>'    , '<esc>')  --   nnoremap <esc>     <esc>
-- vim.keymap.set('n', '<space>'  , '<esc>')  -- " nnoremap <space>   <esc>
-- vim.keymap.set('n', '<s-space>', '<esc>')  --   nnoremap <s-space> <esc>
-- vim.keymap.set('n', '<cr>'     , '<esc>')  -- " nnoremap <cr>      <esc>
-- vim.keymap.set('n', '<bs>'     , '<esc>')  --   nnoremap <bs>      <esc>
-- vim.keymap.set('n', '<bar>'    , '<esc>')  -- " nnoremap <bar>     <esc> " |
-- 
-- vim.keymap.set('n', '-', '<esc>')  --   nnoremap - <esc>
-- vim.keymap.set('n', '+', '<esc>')  --   nnoremap + <esc>
-- vim.keymap.set('n', '=', '<esc>')  --   nnoremap = <esc>
-- vim.keymap.set('n', '@', '<esc>')  --   nnoremap @ <esc>
-- vim.keymap.set('n', ';', '<esc>')  -- " nnoremap ; <esc>
-- vim.keymap.set('n', ',', '<esc>')  -- " nnoremap , <esc>
-- vim.keymap.set('n', '.', '<esc>')  -- " nnoremap . <esc>
-- vim.keymap.set('n', '*', '<esc>')  -- " nnoremap * <esc>
-- vim.keymap.set('n', '_', '<esc>')  -- " nnoremap _ <esc>
-- vim.keymap.set('n', '~', '<esc>')  --   nnoremap ~ <esc>
-- vim.keymap.set('n', '^', '<esc>')  --   nnoremap ^ <esc>
-- vim.keymap.set('n', '/', '<esc>')  --   nnoremap / <esc>
-- vim.keymap.set('n', '?', '<esc>')  --   nnoremap ? <esc>
-- vim.keymap.set('n', '!', '<esc>')  -- " nnoremap ! <esc>
-- vim.keymap.set('n', '"', '<esc>')  --   nnoremap " <esc>
-- vim.keymap.set('n', '`', '<esc>')  --   nnoremap ` <esc>
-- vim.keymap.set('n', '#', '<esc>')  --   nnoremap # <esc>
-- vim.keymap.set('n', '$', '<esc>')  -- " nnoremap $ <esc>
-- vim.keymap.set('n', '%', '<esc>')  -- " nnoremap % <esc> " ?
-- vim.keymap.set('n', '&', '<esc>')  --   nnoremap & <esc>
-- vim.keymap.set('n', '(', '<esc>')  --   nnoremap ( <esc>
-- vim.keymap.set('n', '<', '<esc>')  --   nnoremap < <esc>
-- vim.keymap.set('n', '>', '<esc>')  --   nnoremap > <esc>
-- vim.keymap.set('n', '[', '<esc>')  -- " nnoremap [ <esc>
-- vim.keymap.set('n', ']', '<esc>')  -- " nnoremap ] <esc>
-- 
-- vim.keymap.set('n', '\\', '<esc>')  -- " nnoremap \ <esc>
-- 
-- vim.keymap.set('n', '<<', '<esc>')  -- " nnoremap << <esc>
-- vim.keymap.set('n', '>>', '<esc>')  -- " nnoremap >> <esc>
-- 
-- vim.keymap.set('n', '0', '<esc>')  -- " nnoremap 0 <esc>
-- vim.keymap.set('n', 'a', '<esc>')  -- " nnoremap a <esc>
-- vim.keymap.set('n', 'b', '<esc>')  --   nnoremap b <esc>
-- vim.keymap.set('n', 'c', '<esc>')  -- " nnoremap c <esc>
-- vim.keymap.set('n', 'd', '<esc>')  -- " nnoremap d <esc>
-- vim.keymap.set('n', 'e', '<esc>')  -- " nnoremap e <esc>
-- vim.keymap.set('n', 'f', '<esc>')  -- " nnoremap f <esc>
-- vim.keymap.set('n', 'g', '<esc>')  -- " nnoremap g <esc>
-- vim.keymap.set('n', 'h', '<esc>')  -- " nnoremap h <esc>
-- vim.keymap.set('n', 'i', '<esc>')  -- " nnoremap i <esc>
-- vim.keymap.set('n', 'j', '<esc>')  -- " nnoremap j <esc>
-- vim.keymap.set('n', 'k', '<esc>')  -- " nnoremap k <esc>
-- vim.keymap.set('n', 'l', '<esc>')  -- " nnoremap l <esc>
-- vim.keymap.set('n', 'm', '<esc>')  -- " nnoremap m <esc>
-- vim.keymap.set('n', 'n', '<esc>')  -- " nnoremap n <esc>
-- vim.keymap.set('n', 'o', '<esc>')  -- " nnoremap o <esc>
-- vim.keymap.set('n', 'q', '<esc>')  -- " nnoremap q <esc>
-- vim.keymap.set('n', 'r', '<esc>')  --   nnoremap r <esc>
-- vim.keymap.set('n', 's', '<esc>')  -- " nnoremap s <esc>
-- vim.keymap.set('n', 't', '<esc>')  -- " nnoremap t <esc>
-- vim.keymap.set('n', 'u', '<esc>')  -- " nnoremap u <esc>
-- vim.keymap.set('n', 'w', '<esc>')  -- " nnoremap w <esc>
-- vim.keymap.set('n', 'x', '<esc>')  --   nnoremap x <esc>
-- vim.keymap.set('n', 'y', '<esc>')  -- " nnoremap y <esc>
-- vim.keymap.set('n', 'z', '<esc>')  --   nnoremap z <esc>
-- 
-- vim.keymap.set('n', 'A', '<esc>')  -- " nnoremap A <esc>
-- vim.keymap.set('n', 'B', '<esc>')  --   nnoremap B <esc>
-- vim.keymap.set('n', 'C', '<esc>')  --   nnoremap C <esc>
-- vim.keymap.set('n', 'D', '<esc>')  -- " nnoremap D <esc>
-- vim.keymap.set('n', 'E', '<esc>')  -- " nnoremap E <esc>
-- vim.keymap.set('n', 'F', '<esc>')  -- " nnoremap F <esc>
-- vim.keymap.set('n', 'G', '<esc>')  --   nnoremap G <esc>
-- vim.keymap.set('n', 'H', '<esc>')  -- " nnoremap H <esc>
-- vim.keymap.set('n', 'I', '<esc>')  -- " nnoremap I <esc>
-- vim.keymap.set('n', 'J', '<esc>')  -- " nnoremap J <esc>
-- vim.keymap.set('n', 'K', '<esc>')  -- " nnoremap K <esc>
-- vim.keymap.set('n', 'L', '<esc>')  -- " nnoremap L <esc>
-- vim.keymap.set('n', 'M', '<esc>')  --   nnoremap M <esc>
-- vim.keymap.set('n', 'N', '<esc>')  -- " nnoremap N <esc>
-- vim.keymap.set('n', 'O', '<esc>')  -- " nnoremap O <esc>
-- vim.keymap.set('n', 'Q', '<esc>')  -- " nnoremap Q <esc>
-- vim.keymap.set('n', 'P', '<esc>')  -- " nnoremap P <esc>
-- vim.keymap.set('n', 'R', '<esc>')  --   nnoremap R <esc>
-- vim.keymap.set('n', 'S', '<esc>')  -- " nnoremap S <esc>
-- vim.keymap.set('n', 'T', '<esc>')  --   nnoremap T <esc>
-- vim.keymap.set('n', 'U', '<esc>')  -- " nnoremap U <esc>
-- vim.keymap.set('n', 'W', '<esc>')  -- " nnoremap W <esc>
-- vim.keymap.set('n', 'V', '<esc>')  -- " nnoremap V <esc>
-- vim.keymap.set('n', 'X', '<esc>')  --   nnoremap X <esc>
-- vim.keymap.set('n', 'Y', '<esc>')  --   nnoremap Y <esc>
-- 
-- vim.keymap.set('n', '<c-tab>'  , '<esc>')  --   nnoremap <c-tab>   <nop>
-- vim.keymap.set('n', '<c-space>', '<esc>')  --   nnoremap <c-space> <esc>
-- 
-- vim.keymap.set('n', '<c-@>', '<esc>')  --   nnoremap <c-@> <esc>
-- vim.keymap.set('n', '<c-^>', '<esc>')  -- " nnoremap <c-^> <esc>
-- vim.keymap.set('n', '<c-->', '<esc>')  -- " nnoremap <c--> <esc> " non
-- vim.keymap.set('n', '<c-*>', '<esc>')  -- " nnoremap <c-*> <esc> " non ?
-- vim.keymap.set('n', '<c-:>', '<esc>')  -- " nnoremap <c-:> <esc> " non
-- vim.keymap.set('n', '<c-;>', '<esc>')  -- " nnoremap <c-;> <esc> " non
-- vim.keymap.set('n', '<c-,>', '<esc>')  -- " nnoremap <c-,> <esc> " non ?
-- vim.keymap.set('n', '<c-.>', '<esc>')  -- " nnoremap <c-.> <esc> " non ?
-- vim.keymap.set('n', '<c-/>', '<esc>')  -- " nnoremap <c-/> <esc> " non ?
-- vim.keymap.set('n', '<c-_>', '<esc>')  -- " nnoremap <c-_> <esc>
-- vim.keymap.set('n', '<c-[>', '<esc>')  -- " nnoremap <c-[> <esc>
-- vim.keymap.set('n', '<c-]>', '<esc>')  --   nnoremap <c-]> <esc>
-- vim.keymap.set('n', '<c-\\>', '<esc>')  --   nnoremap <c-\> <esc>
-- 
-- vim.keymap.set('n', '<c-a>', '<esc>')  -- " nnoremap <c-a> <esc>
-- vim.keymap.set('n', '<c-b>', '<esc>')  --   nnoremap <c-b> <esc>
-- vim.keymap.set('n', '<c-c>', '<esc>')  -- " nnoremap <c-c> <esc>
-- vim.keymap.set('n', '<c-d>', '<esc>')  -- " nnoremap <c-d> <esc>
-- vim.keymap.set('n', '<c-e>', '<esc>')  --   nnoremap <c-e> <esc>
-- vim.keymap.set('n', '<c-f>', '<esc>')  -- " nnoremap <c-f> <esc>
-- vim.keymap.set('n', '<c-g>', '<esc>')  --   nnoremap <c-g> <esc>
-- vim.keymap.set('n', '<c-h>', '<esc>')  -- " nnoremap <c-h> <esc>
-- vim.keymap.set('n', '<c-i>', '<esc>')  -- " nnoremap <c-i> <esc> " tab
-- vim.keymap.set('n', '<c-l>', '<esc>')  -- " nnoremap <c-l> <esc>
-- vim.keymap.set('n', '<c-m>', '<esc>')  -- " nnoremap <c-m> <esc>
-- vim.keymap.set('n', '<c-n>', '<esc>')  -- " nnoremap <c-n> <esc>
-- vim.keymap.set('n', '<c-o>', '<esc>')  -- " nnoremap <c-o> <esc>
-- vim.keymap.set('n', '<c-p>', '<esc>')  -- " nnoremap <c-p> <esc>
-- vim.keymap.set('n', '<c-q>', '<esc>')  --   nnoremap <c-q> <esc>
-- vim.keymap.set('n', '<c-r>', '<esc>')  --   nnoremap <c-r> <esc>
-- vim.keymap.set('n', '<c-s>', '<esc>')  -- " nnoremap <c-s> <esc>
-- vim.keymap.set('n', '<c-t>', '<esc>')  --   nnoremap <c-t> <esc>
-- vim.keymap.set('n', '<c-u>', '<esc>')  -- " nnoremap <c-u> <esc>
-- vim.keymap.set('n', '<c-v>', '<esc>')  --   nnoremap <c-v> <esc>
-- vim.keymap.set('n', '<c-w>', '<esc>')  -- " nnoremap <c-w> <esc>
-- vim.keymap.set('n', '<c-x>', '<esc>')  --   nnoremap <c-x> <esc>
-- vim.keymap.set('n', '<c-y>', '<esc>')  -- " nnoremap <c-y> <esc>
-- vim.keymap.set('n', '<c-z>', '<esc>')  --   nnoremap <c-z> <esc>
-- 
-- vim.keymap.set('n', 'ga', '<esc>')  -- " nnoremap ga <esc>
-- vim.keymap.set('n', 'gb', '<esc>')  --   nnoremap gb <esc>
-- vim.keymap.set('n', 'gd', '<esc>')  -- " nnoremap gd <esc>
-- vim.keymap.set('n', 'ge', '<esc>')  -- " nnoremap ge <esc>
-- vim.keymap.set('n', 'gf', '<esc>')  --   nnoremap gf <esc>
-- vim.keymap.set('n', 'gg', '<esc>')  --   nnoremap gg <esc>
-- vim.keymap.set('n', 'gh', '<esc>')  -- " nnoremap gh <esc>
-- vim.keymap.set('n', 'gi', '<esc>')  --   nnoremap gi <esc>
-- vim.keymap.set('n', 'gj', '<esc>')  -- " nnoremap gj <esc>
-- vim.keymap.set('n', 'gk', '<esc>')  -- " nnoremap gk <esc>
-- vim.keymap.set('n', 'gl', '<esc>')  --   nnoremap gl <esc>
-- vim.keymap.set('n', 'gm', '<esc>')  --   nnoremap gm <esc>
-- vim.keymap.set('n', 'gn', '<esc>')  --   nnoremap gn <esc>
-- vim.keymap.set('n', 'go', '<esc>')  -- " nnoremap go <esc>
-- vim.keymap.set('n', 'gp', '<esc>')  --   nnoremap gp <esc>
-- vim.keymap.set('n', 'gs', '<esc>')  -- " nnoremap gs <esc>
-- vim.keymap.set('n', 'gt', '<esc>')  --   nnoremap gt <esc>
-- vim.keymap.set('n', 'gu', '<esc>')  --   nnoremap gu <esc>
-- vim.keymap.set('n', 'gv', '<esc>')  --   nnoremap gv <esc>
-- vim.keymap.set('n', 'gw', '<esc>')  --   nnoremap gw <esc>
-- vim.keymap.set('n', 'gy', '<esc>')  --   nnoremap gy <esc>
-- 
-- vim.keymap.set('n', 'ra', '<esc>')  --   nnoremap ra <esc>
--                                     -- "          :
-- vim.keymap.set('n', 're', '<esc>')  -- " nnoremap re <esc>
-- vim.keymap.set('n', 'rf', '<esc>')  -- " nnoremap rf <esc>
--                                     -- "          :
-- vim.keymap.set('n', 'rh', '<esc>')  -- " nnoremap rh <esc>
-- vim.keymap.set('n', 'ri', '<esc>')  -- " nnoremap ri <esc>
-- vim.keymap.set('n', 'rj', '<esc>')  -- " nnoremap rj <esc>
-- vim.keymap.set('n', 'rk', '<esc>')  -- " nnoremap rk <esc>
--                                     -- "          :
-- vim.keymap.set('n', 'rn', '<esc>')  -- " nnoremap rn <esc>
-- vim.keymap.set('n', 'ro', '<esc>')  -- " nnoremap ro <esc>
-- vim.keymap.set('n', 'rp', '<esc>')  --   nnoremap rp <esc>
-- vim.keymap.set('n', 'rq', '<esc>')  --   nnoremap rq <esc>
-- vim.keymap.set('n', 'rr', '<esc>')  -- " nnoremap rr <esc>
--                                     -- "          :
-- vim.keymap.set('n', 'ru', '<esc>')  -- " nnoremap ru <esc>
-- vim.keymap.set('n', 'rv', '<esc>')  --   nnoremap rv <esc>
--                                     -- "          :
-- vim.keymap.set('n', 'rz', '<esc>')  --   nnoremap rz <esc>
-- 
-- vim.keymap.set('n', 'Rj', '<esc>')  --   nnoremap Rj <esc>
-- vim.keymap.set('n', 'Rk', '<esc>')  --   nnoremap Rk <esc>
-- 
-- vim.keymap.set('n', 'xx', '<esc>')  --   nnoremap xx <esc>
-- 
-- vim.keymap.set('n', ':a', ':a')  --   nnoremap :a :a
-- vim.keymap.set('n', ':b', ':b')  --   nnoremap :b :b
-- vim.keymap.set('n', ':c', ':c')  --   nnoremap :c :c
-- vim.keymap.set('n', ':d', ':d')  --   nnoremap :d :d
-- vim.keymap.set('n', ':e', ':e')  --   nnoremap :e :e
-- vim.keymap.set('n', ':f', ':f')  -- " nnoremap :f :f
-- vim.keymap.set('n', ':g', ':g')  --   nnoremap :g :g
-- vim.keymap.set('n', ':h', ':h')  -- " nnoremap :h :h
--                                  -- "           :
-- vim.keymap.set('n', ':k', ':k')  -- " nnoremap :k :k
--                                  -- "           :
-- vim.keymap.set('n', ':p', ':p')  -- " nnoremap :p :p
-- vim.keymap.set('n', ':q', ':q')  -- " nnoremap :q :q
-- vim.keymap.set('n', ':r', ':r')  -- " nnoremap :r :r
-- vim.keymap.set('n', ':s', ':s')  -- " nnoremap :s :s
--                                  -- "           :
-- vim.keymap.set('n', ':u', ':u')  -- " nnoremap :u :u
--                                  -- "           :
-- vim.keymap.set('n', ':z', ':z')  --   nnoremap :z :z
-- 
-- vim.keymap.set('n', '<leader>:', '<esc>')  --   nnoremap <leader>: <esc>
-- vim.keymap.set('n', '<leader>a', '<esc>')  --   nnoremap <leader>a <esc>
-- vim.keymap.set('n', '<leader>b', '<esc>')  --   nnoremap <leader>b <esc>
-- vim.keymap.set('n', '<leader>c', '<esc>')  -- " nnoremap <leader>c <esc>
-- vim.keymap.set('n', '<leader>d', '<esc>')  -- " nnoremap <leader>d <esc>
-- vim.keymap.set('n', '<leader>e', '<esc>')  -- " nnoremap <leader>e <esc>
-- vim.keymap.set('n', '<leader>f', '<esc>')  -- " nnoremap <leader>f <esc>
-- vim.keymap.set('n', '<leader>g', '<esc>')  --   nnoremap <leader>g <esc>
-- vim.keymap.set('n', '<leader>h', '<esc>')  -- " nnoremap <leader>h <esc>
-- vim.keymap.set('n', '<leader>j', '<esc>')  -- " nnoremap <leader>j <esc>
-- vim.keymap.set('n', '<leader>l', '<esc>')  -- " nnoremap <leader>l <esc>
-- vim.keymap.set('n', '<leader>m', '<esc>')  -- " nnoremap <leader>m <esc>
-- vim.keymap.set('n', '<leader>n', '<esc>')  -- " nnoremap <leader>n <esc>
-- vim.keymap.set('n', '<leader>o', '<esc>')  -- " nnoremap <leader>o <esc>
-- vim.keymap.set('n', '<leader>p', '<esc>')  --   nnoremap <leader>p <esc>
-- vim.keymap.set('n', '<leader>r', '<esc>')  -- " nnoremap <leader>r <esc>
-- vim.keymap.set('n', '<leader>s', '<esc>')  --   nnoremap <leader>s <esc>
-- vim.keymap.set('n', '<leader>t', '<esc>')  -- " nnoremap <leader>t <esc>
-- vim.keymap.set('n', '<leader>u', '<esc>')  --   nnoremap <leader>u <esc>
-- vim.keymap.set('n', '<leader>v', '<esc>')  --   nnoremap <leader>v <esc>
-- vim.keymap.set('n', '<leader>w', '<esc>')  --   nnoremap <leader>w <esc>
-- vim.keymap.set('n', '<leader>y', '<esc>')  -- " nnoremap <leader>y <esc>
-- 
-- vim.keymap.set('n', '<leader>L', '<esc>')  -- " nnoremap <leader>L <esc>
-- vim.keymap.set('n', '<leader>M', '<esc>')  --   nnoremap <leader>M <esc>
-- vim.keymap.set('n', '<leader>O', '<esc>')  -- " nnoremap <leader>O <esc>

-- mode normal esc end


-- " quit buffer
   vim.keymap.set('n', 'w',  vim.fn.Buf__quit_swtch)

-- " quit buffer force
   vim.keymap.set('n', ':q', ':q!')

-- " quit vim
   vim.keymap.set('n', 'W', ':q<cr>')

-- " quit tab other
-- vim.keymap.set('n', 'xx', ':tabo<cr>')

-- " background job
-- vim.keymap.set('n', '<c-z>', '<c-z>')

-- " save
   vim.keymap.set('n', 'a', ':call Save()<cr>')

-- " load re slf
-- vim.keymap.set('n', 'xx', ':call Load_re()')

-- " load re vimrc
   vim.keymap.set('n', ':v', ':source ~/wrk/prj-pri/dotfiles/nvim/scrpt/dflt/init.vim')

-- 
-- opn
-- 

-- " opn tab file
   vim.keymap.set('n', ':o', ':Opn ')

-- " opn latest
-- "nnoremap xx `0
-- vim.keymap.set('n', 'xx', '`0')

-- " opn file srch  ( fzf )
   vim.keymap.set('n', '<leader>l', ':call Fzf_file()<cr>')

-- " opn file hstry ( fzf )
   vim.keymap.set('n', '<leader>h', ':FzfFileHstry<cr>')

-- 
-- opn etc
-- 

-- " opn fish cnf
-- "nnoremap gf :call Opn_fish_cnf()<cr>
-- vim.keymap.set('n', 'gf', ':call Opn_fish_cnf()<cr>')

-- " opn vimrc
   vim.keymap.set('n', 'gh', ':call Opn_vimrc()<cr>')

-- " opn tmp file
-- "nnoremap xx :call Opn_tmp_file()<cr>
-- vim.keymap.set('n', 'xx', ':call Opn_tmp_file()<cr>')

-- " opn grep work
-- "nnoremap xx :call Opn_grep_wk()<cr>
-- vim.keymap.set('n', 'xx', ':call Opn_grep_wk()<cr>')

-- " opn memo
-- "nnoremap xx :call Opn_memo()<cr>
-- vim.keymap.set('n', 'xx', ':call Opn_memo()<cr>')

-- " opn man
-- "nnoremap xx :OpnMan 
-- vim.keymap.set('n', 'xx', ':OpnMan ')

-- " opn app
   vim.keymap.set('n', 'go', ':call Opn_app_by_cursor_path()<cr>')

-- " opn app slf
-- "nnoremap xx :call Opn_app_buf_file()<cr>
-- vim.keymap.set('n', 'xx', ':call Opn_app_buf_file()<cr>')

-- " opn dir slf
   vim.keymap.set('n', 'gd', ':call Opn_buf_file_dir()<cr>')

-- " opn brwsr
-- "nnoremap xx :call Opn_brwsr()<cr>
-- vim.keymap.set('n', 'xx', ':call Opn_brwsr()<cr>')

-- " opn ggl srch
   vim.keymap.set('n', 'ggl', ':call Opn_ggl_srch("")<cr>')

-- 
-- cursor mv
-- 

-- " cursor mv drct
   vim.keymap.set('n', '<Right>', 'l')
   vim.keymap.set('n', '<Left>' , 'h')
   vim.keymap.set('n', '<Up>'   , 'k')
   vim.keymap.set('n', '<Down>' , 'j')

-- " cursor mv line
   vim.keymap.set('n', 'k', ':call Cursor__mv_u()<cr>')
   vim.keymap.set('n', 'j', ':call Cursor__mv_d()<cr>')

-- " cursor mv line mlt
   vim.keymap.set('n', '<c-k>', ':call Cursor__mv_mlt_u()<cr>')
   vim.keymap.set('n', '<c-j>', ':call Cursor__mv_mlt_d()<cr>')

-- " cursor mv line top | ins line
   vim.keymap.set('n', 'y', ':call Cursor__mv_line_top_or_new_line()<cr>')

-- " cursor mv line top
   vim.keymap.set('n', '<c-a>', '0')

-- " cursor mv line end
-- "nnoremap <c-y> xx
-- nnoremap <expr> <c-y>
-- \ Is_cursor_col__line_end() ? ':call Cursor__ins_markdown_cr()<cr>'     :
-- \                             ':call Cursor__mv_line_end()<cr>'
-- vim.keymap.set('n', '<c-y>', 'xx')
vim.keymap.set('n', '<c-y>', function()
  return vim.fn.Is_cursor_col__line_end() and
    ':call Cursor__ins_markdown_cr()<cr>' or
    ':call Cursor__mv_line_end()<cr>'
end, {expr = true})

-- " cursor mv char - forward
   vim.keymap.set('n', 'l', 'l')

-- " cursor mv char - back
   vim.keymap.set('n', '<c-o>', 'h')

-- " cursor mv word - forward
   vim.keymap.set('n', 'f', ':call Cursor__mv_word_f()<cr>')

-- " cursor mv word - back
   vim.keymap.set('n', 'o', ':call Cursor__mv_word_b()<cr>')

-- " cursor mv word - back pre
-- "nnoremap xx :call Cursor__mv_word_b_pre()<cr>
-- vim.keymap.set('n', 'xx', ':call Cursor__mv_word_b_pre()<cr>')

-- " cursor mv word dlm _ forward
   vim.keymap.set('n', '_', 'f_l')

-- " cursor mv word dlm _ back
   vim.keymap.set('n', '<c-_>', 'hT_')
   vim.keymap.set('n', '\\', 'T_h')
   vim.keymap.set('n', '<bar>', 'T_h')
-- "nnoremap <c-\> T_h
-- vim.keymap.set('n', '<c-\\>', 'T_h')

-- " cursor mv word dlm ( camel or _ )  -  forward
   vim.keymap.set('n', 'F', ':call Cursor__mv_word_dlm_f()<cr>')

-- " cursor mv fnc name
   vim.keymap.set('n', '<c-f>', ':call Cursor__mv_fnc_name()<cr>')

-- " cursor mv bracket pair
   vim.keymap.set('n', '<c-l>', '%')

-- " cursor mv bracket out back
-- "nnoremap xx [{
-- vim.keymap.set('n', 'xx', '[{')

-- " cursor mv bracket fnc back
-- "nnoremap xx [m
-- vim.keymap.set('n', 'xx', '[m')

-- " cursor mv indnt auto
-- "nnoremap xx :call Cursor__mv_indnt_auto()<cr> " todo dev
-- vim.keymap.set('n', 'xx', ':call Cursor__mv_indnt_auto()<cr>')

-- " cursor mv file edge bgn
   vim.keymap.set('n', 'gk', ':call Cursor__mv_file_edge_bgn()<cr>')

-- " cursor mv file edge end
   vim.keymap.set('n', 'gj', ':call Cursor__mv_file_edge_end()<cr>')

-- " cursor mv edit latest
-- "nnoremap xx `.
-- vim.keymap.set('n', 'xx', '`.')

-- " cursor mv jmp
   vim.keymap.set('n', 'rk', ':call Cursor__mv_v_jmp("k")<cr>')
   vim.keymap.set('n', 'rj', ':call Cursor__mv_v_jmp("j")<cr>')

   vim.keymap.set('n', 'r<space>k', ':call Cursor__mv_v_jmp_char("k", "f")<cr>')
   vim.keymap.set('n', 'r<space>j', ':call Cursor__mv_v_jmp_char("j", "f")<cr>')

-- " scroll
   vim.keymap.set('n', 'K'     , '<c-y>')
   vim.keymap.set('n', 'J'     , '<c-e>')
   vim.keymap.set('n', '<up>'  , '<c-y>')
   vim.keymap.set('n', '<down>', '<c-e>')

-- " scroll cursor line upper
-- "nnoremap xx zt
-- vim.keymap.set('n', 'xx', 'zt')

-- " scroll cursor line middle
-- "nnoremap xx zz
-- vim.keymap.set('n', 'xx', 'zz')

-- " 
-- " slct / slctd / ynk / paste
-- " 

-- " slct
-- "nnoremap I v
-- vim.keymap.set('n', 'I', 'v')

-- " slctd __ word
   vim.keymap.set('n', 'i', ':call Slctd_str__word()<cr>')

-- " slctd __ word by under score

-- " todo dev
-- "nnoremap <c-_> :call Slctd__word_by_under_score()<cr>
-- vim.keymap.set('n', '<c-_>', ':call Slctd__word_by_under_score()<cr>')
-- " nnoremap <c-_> f_l
-- " hT_  ???

-- " slctd __ char current - word end
   vim.keymap.set('n', 'I', 've')

-- " slct visual box
   vim.keymap.set('n', 'v', '<c-v>')

-- " slct all
-- "nnoremap xx :call Ynk__line_all()<cr>
-- vim.keymap.set('n', 'xx', ':call Ynk__line_all()<cr>')

-- " slct re
   vim.keymap.set('n', 'rr', ':call Slct_re()<cr>')

-- " ynk clr
   vim.keymap.set('n', '<c-c>', ':call Ynk__clr()<cr>')

-- " ynk line
   vim.keymap.set('n', 'c', ':call Ynk__line()<cr>')

-- " ynk char
-- "nnoremap xx "ayl
-- vim.keymap.set('n', 'xx', '"ayl')

-- " ynk slf path
   vim.keymap.set('n', 'gs', ':call Ynk__buf_file_path()<cr>')

-- " paste
   vim.keymap.set('n', 'p', ':call Cursor__ins_ynk()<cr>')

-- " paste clp
   vim.keymap.set('n', 'P', ':call Cursor__ins_clp()<cr>')

-- " paste rgstr history ( fzf )
   vim.keymap.set('n', '<leader>r', ':FzfRgstr<cr>')

-- " undo
   vim.keymap.set('n', 'h'    , 'u'    )

-- " redo
   vim.keymap.set('n', '<c-h>', '<c-r>')

-- " undo history clr
   vim.keymap.set('n', ':h', ':call Undo__clr()')

-- " repeat
-- "nnoremap xx .
-- vim.keymap.set('n', 'xx', '.')

-- 
-- edit
-- 

-- " mode ch ins
   vim.keymap.set('n', '<space>', 'i')

-- " mode ch ins rpl
-- "nnoremap xx R
-- vim.keymap.set('n', 'xx', 'R')

-- " ins cr
   vim.keymap.set('n', 'm', ':call Cursor__ins_cr()<cr>')

-- " ins space
   vim.keymap.set('n', 'L', ':call Cursor__ins_space(v:false)<cr>')

-- " ins equal
   vim.keymap.set('n', '2', 'i=<esc>')

-- " ins period
   vim.keymap.set('n', '.', 'i.<esc>')

-- " ins comma
   vim.keymap.set('n', ',', 'i, <esc>l')

-- " ins comma $, nxt line
-- "nnoremap xx A,<esc>j
-- vim.keymap.set('n', 'xx', 'A,<esc>j')

-- " ins hyphen
   vim.keymap.set('n', '0', ':call Cursor__ins_hyphen()<cr>')

-- " ins bracket
   vim.keymap.set('n', '<c-s>', ':call Cursor__ins_bracket()<cr>')

-- " ins date
   vim.keymap.set('n', '*', ':call Cursor__ins_da()<cr>')

-- " ins date time
   vim.keymap.set('n', ';', ':call Cursor__ins_dt()<cr>')

-- " ins day of week
-- "nnoremap xx :call Cursor__ins_week()<cr>
-- vim.keymap.set('n', 'xx', ':call Cursor__ins_week()<cr>')

-- " ins slf path
-- "nnoremap xx :call Cursor__ins_line_buf_file_path()<cr>
-- vim.keymap.set('n', 'xx', ':call Cursor__ins_line_buf_file_path()<cr>')

-- " ins anchor
   vim.keymap.set('n', 'A', ':call Cursor__ins_line_anchor()<cr>')

-- " ins markdown code
   vim.keymap.set('n', '<c-u>', ':call Cursor__ins_markdown_code()<cr>')

-- " ins markdown itm
-- "nnoremap O xx
-- nnoremap <expr> O
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_itm()<cr>'  :
-- \                              ':call Cursor_line_indnt__shft_r()<cr>'
-- vim.keymap.set('n', 'O', 'xx')
vim.keymap.set('n', 'O', function()
  return vim.fn.Is_file_type__('markdown') and
    ':call Cursor__ins_markdown_itm()<cr>' or
    ':call Cursor_line_indnt__shft_r()<cr>'
end, {expr = true})

-- " ins dots ( or crnt )
   vim.keymap.set('n', 'ru', ':call Cursor_line_end__dots_adjst()<cr>')

-- " ins line emp
-- " ref nnoremap y

-- " ins comment mlt
   vim.keymap.set('n', '$', ':call Cursor__ins_cmnt_mlt()<cr>')

-- " ins comment 1
-- "nnoremap ! xx
-- nnoremap <expr> !
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
-- \                              ':call Cursor__ins_cmnt_1("^")<cr>'
-- vim.keymap.set('n', '!', 'xx')
vim.keymap.set('n', '!', function()
  return vim.fn.Is_file_type__('markdown') and
    ':call Cursor__ins_markdown_h()<cr>' or
    ':call Cursor__ins_cmnt_1("^")<cr>'
end, {expr = true})
-- "nnoremap 1 xx
-- nnoremap <expr> 1
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
-- \                              ':call Cursor__ins_cmnt_1("^")<cr>'
-- vim.keymap.set('n', '1', 'xx')
vim.keymap.set('n', '1', function()
  return vim.fn.Is_file_type__('markdown') and
    ':call Cursor__ins_markdown_h()<cr>' or
    ':call Cursor__ins_cmnt_1("^")<cr>'
end, {expr = true})

-- " ins __ line indnt space
   vim.keymap.set('n', 'V', ':call Cursor_d__ins_line_space()<cr>')

-- " cahr rpl, under score
-- "nnoremap <bar> :call Cursor_char__rpl_underscore()<cr>
-- vim.keymap.set('n', '<bar>', ':call Cursor_char__rpl_underscore()<cr>')

-- " tgl markdown chk
-- "nnoremap xx :call Char_markdown_chk__tgl()<cr>
-- vim.keymap.set('n', 'xx', ':call Char_markdown_chk__tgl()<cr>')

-- " del char
   vim.keymap.set('n', 's', ':call Cursor_c_char__del()<cr>')

-- " del char ynk
-- "nnoremap xx :call Cursor_c_char__del_ynk()<cr>
-- vim.keymap.set('n', 'xx', ':call Cursor_c_char__del_ynk()<cr>')

-- " line del
   vim.keymap.set('n', 'd', ':call Cursor_line__del()<cr>')

-- " line forward del
   vim.keymap.set('n', '<c-d>', 'D')

-- " word back    del
-- "nnoremap xx hvbd
-- vim.keymap.set('n', 'xx', 'hvbd')

-- " word forward del
-- "nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zdw'
-- "nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zde'
-- vim.keymap.set('n', 'xx', 'XX')
-- vim.keymap.set('n', 'xx', 'XX')

-- " del cr ( line join )
   vim.keymap.set('n', '<c-m>', 'J')

-- " line mv up
-- "nnoremap xx "addk"aP
-- vim.keymap.set('n', 'xx', '"addk"aP')

-- " line dpl
   vim.keymap.set('n', 'D', '"zyy"zP')

-- " repeat memory
-- "nnoremap xx qy
-- "nnoremap xx @y
-- vim.keymap.set('n', 'xx', 'qy')
-- vim.keymap.set('n', 'xx', '@y')

-- " char tgl 01 ( ?? / num icl  )
   vim.keymap.set('n', 'u', ':call N_char__tgl_swtch01()<cr>')

-- " char tgl 02 ( type ch / num dcl )
   vim.keymap.set('n', 'U', ':call N_char__tgl_swtch02()<cr>')

-- " indnt shft
   vim.keymap.set('n', 'ri', ':call Cursor_line_indnt__shft_l()<cr>')
   vim.keymap.set('n', 'ro', ':call Cursor_line_indnt__shft_r()<cr>')

-- " indnt add
-- "nnoremap xx :call Cursor_line_indnt__add(2)<cr>
-- vim.keymap.set('n', 'xx', ':call Cursor_line_indnt__add(2)<cr>')

-- " indnt crct
   vim.keymap.set('n', 're', ':call Cursor_line_indnt__crct()<cr>')

-- " cursor l char col __ crct
   vim.keymap.set('n', 'q', ':call Cursor_f_str__crct_by_line_u()<cr>')
   vim.keymap.set('n', 'Q', ':call Cursor_f_str__crct_by_line_d()<cr>')

-- 
-- srch
-- 

-- " srch hl init
   vim.keymap.set('n', 'S', '/<cr>N')
-- "nnoremap xx :call Srch_init()<cr>
-- vim.keymap.set('n', 'xx', ':call Srch_init()<cr>')

-- " srch char in line - forward
-- "nnoremap xx f
-- vim.keymap.set('n', 'xx', 'f')

-- " srch char in line repeat
-- "nnoremap xx ;
-- vim.keymap.set('n', 'xx', ';')

-- " srch by cmd
   vim.keymap.set('n', '<leader>k', '/')

-- " srch by cmd word
   vim.keymap.set('n', '<leader>K', '/\\<\\><left><left>')

-- " srch word or
-- "nnoremap xx Xxx
-- vim.keymap.set('n', 'xx', 'Xxx')

-- " srch forward
   vim.keymap.set('n', 'n', ':call Cursor__mv_srch("f")<cr>')

-- " srch back
   vim.keymap.set('n', '<c-n>', ':call Cursor__mv_srch("b")<cr>')

-- " srch, cursor mv nxt char
-- "nnoremap @ :call Srch_7_cursor__mv_nxt('f')<cr>
-- vim.keymap.set('n', '@', ':call Srch_7_cursor__mv_nxt('f')<cr>')

-- " srch str set
   vim.keymap.set('n', 'e', ':call Srch_str__cursor_word()<cr>')

-- " srch str set ( word 1 )
   vim.keymap.set('n', 'E', ':call Srch_str__word1_tgl()<cr>')

-- " srch char bracket forward
-- "nnoremap xx :call Srch_char_bracket('f')<cr>
-- vim.keymap.set('n', 'xx', ':call Srch_char_bracket('f')<cr>')

-- " srch markdown h
   vim.keymap.set('n', 'M', ':call Srch_str__markdown_h()<cr>')

-- " srch str history ( fzf )
   vim.keymap.set('n', '<leader>f', ':FzfSrchHstry<cr>')

-- " srch str set prv ( tgl )
   vim.keymap.set('n', 'N', ':call Srch_str__prv_tgl()<cr>')

-- " srch rpl one > ynk nxt ( only srch )
   vim.keymap.set('n', '<c-p>', ':call Srch_slct("f")<cr>')

-- " srch ?=ts
-- "nnoremap xx /?ts=<cr>
-- vim.keymap.set('n', 'xx', '/?ts=<cr>')

-- " rpl ( cmd )
   vim.keymap.set('n', ':s', ':%s///g')
-- "nnoremap :s :Rpl 
-- vim.keymap.set('n', ':s', ':Rpl ')

-- " fzf rg
-- " nnoremap <leader>o :call Fzf_rg('')<cr>
   vim.keymap.set('n', '<leader>o', ':call Fzf_rg(v:null)<cr>')

-- " fzf rg fltr ext
   vim.keymap.set('n', '<leader>O', ':FzfRgExt js')

-- " fzf rg with run
-- " nnoremap <leader>O :FzfRgWithRun <cr>

-- " fzf buf
   vim.keymap.set('n', '<leader>i', ':call N_fzf_buf()<cr>')

-- " fzf jmplst
   vim.keymap.set('n', '<leader>e', ':FzfJmplst<cr>')

-- " fzf pth lst
-- "nnoremap <leader>xx :FzfTagjmpByFile <cr>
-- vim.keymap.set('n', '<leader>xx', ':FzfTagjmpByFile <cr>')

-- " tag jmp tab new
   vim.keymap.set('n', 't', ':call Tag_jmp_by_cursor_line()<cr>')

-- 
-- cmd
-- 

-- " cmd history ( fzf )
   vim.keymap.set('n', '<leader>j', ':FzfCmdHstry<cr>')

-- " sys cmd
   vim.keymap.set('n', ':!', ':!')
   vim.keymap.set('n', ':1', ':!')

-- " ins sys cmd ( read )
   vim.keymap.set('n', ':r', ':InsSysCmd')

-- " pth
   vim.keymap.set('n', ':p', ':Pth <cr>')

-- " cd slf
-- "nnoremap :d :call Dir__buf_file_dir()
-- vim.keymap.set('n', ':d', ':call Dir__buf_file_dir()')

-- " cd parent
   vim.keymap.set('n', ':k', ':K')

-- " fzf cd
   vim.keymap.set('n', '<leader>y', ':call Fzf_dir()<cr>')

-- " fzf cd ( dir jmp )
   vim.keymap.set('n', '<leader>d', ':call Fzf_dir_jmp()<cr>')

-- " fzf doc memo
   vim.keymap.set('n', '<leader>m', ':call Fzf_doc_memo_opn()<cr>')

-- " fzf vim fnc call
   vim.keymap.set('n', '<leader>c', ':call Fzf_vim_fnc_call()<cr>')

-- " fzf doc tech
   vim.keymap.set('n', '<leader>t', ':call Fzf_doc_tech()<cr>')

-- 
-- tab
-- 

-- " tab mv
   vim.keymap.set('n', '<tab>'  , 'gt')
   vim.keymap.set('n', '<s-tab>', 'gT')

-- " tab order
   vim.keymap.set('n', '<s-left>' , ':tabm-1<cr>')
   vim.keymap.set('n', '<s-right>', ':tabm+1<cr>')

-- 
-- buf
-- 

-- " buf list
-- "nnoremap :xx :buffers
-- vim.keymap.set('n', ':xx', ':buffers')

-- " buf fltr
   vim.keymap.set('n', ':f', ':%! jq')
-- "nnoremap :xx :call Buf__fltr()<cr> " use not
-- vim.keymap.set('n', 'xx', ':call Buf__fltr()<cr>')

-- 
-- win ( buf )
-- 

-- " win ( buf ) splt quit
-- "nnoremap rq :call Win_splt__quit()<cr>
-- vim.keymap.set('n', 'rq', ':call Win_splt__quit()<cr>')

-- " win ( buf ) splt h
   vim.keymap.set('n', 'rh', ':call Win__splt_h()<cr>')

-- " win ( buf ) splt v
   vim.keymap.set('n', 'rn', ':call Win__splt_v()<cr>')

-- " win ( buf ) nxt
   vim.keymap.set('n', '<c-w>', ':call Win_splt_cursor__mv_nxt()<cr>')

-- " win ( buf ) mv r
-- "nnoremap xx <c-w>l
-- vim.keymap.set('n', 'xx', '<c-w>l')

-- " win ( buf ) mv l
-- "nnoremap xx <c-w>h
-- vim.keymap.set('n', 'xx', '<c-w>h')

-- 
-- term
-- 

-- "nnoremap xx :Term 
-- vim.keymap.set('n', 'xx', ':Term ')

-- 
-- " setting ( set )
-- 

-- " setting  -  line view wrap tgl
   vim.keymap.set('n', ':w', ':set wrap!')

-- " setting  -  line num view tgl
   vim.keymap.set('n', ':N', ':set number!')

-- " setting  -  line num rel tgl
   vim.keymap.set('n', ':n', ':set relativenumber!')

-- " inf

-- " inf char
-- "nnoremap xx ga
-- vim.keymap.set('n', 'xx', 'ga')

-- " numpad shift
   vim.keymap.set('n', '<kInsert>'  , '0')
   vim.keymap.set('n', '<kEnd>'     , '1')
   vim.keymap.set('n', '<kDown>'    , '2')
   vim.keymap.set('n', '<kPageDown>', '3')
   vim.keymap.set('n', '<kLeft>'    , '4')
   vim.keymap.set('n', '<kOrigin>'  , '5')
   vim.keymap.set('n', '<kRight>'   , '6')
   vim.keymap.set('n', '<kHome>'    , '7')
   vim.keymap.set('n', '<kUp>'      , '8')
   vim.keymap.set('n', '<kPageUp>'  , '9')

-- mode normal end

-- 
-- mode visual
-- 

-- mode visual nop

-- vim.keymap.set('v', '<space>', '<nop>')  -- "vnoremap <space> <nop>

-- mode visual nop end

-- mode visual esc

-- vim.keymap.set('v', '@', '<esc>')  --   vnoremap @ <esc>
-- vim.keymap.set('v', '*', '<esc>')  -- " vnoremap * <esc>
-- vim.keymap.set('v', '/', '<esc>')  --   vnoremap / <esc>
-- vim.keymap.set('v', '\', '<esc>')  --   vnoremap \ <esc>
-- vim.keymap.set('v', '!', '<esc>')  -- " vnoremap ! <esc>
-- vim.keymap.set('v', '"', '<esc>')  --   vnoremap " <esc>
-- vim.keymap.set('v', '#', '<esc>')  --   vnoremap # <esc>
-- vim.keymap.set('v', '$', '<esc>')  --   vnoremap $ <esc>
-- vim.keymap.set('v', '%', '<esc>')  -- " vnoremap % <esc> " ?
-- vim.keymap.set('v', '&', '<esc>')  -- " vnoremap & <esc>
-- vim.keymap.set('v', '_', '<esc>')  -- " vnoremap _ <esc>
-- vim.keymap.set('v', '?', '<esc>')  --   vnoremap ? <esc>
-- vim.keymap.set('v', '(', '<esc>')  --   vnoremap ( <esc>
-- vim.keymap.set('v', ';', '<esc>')  -- " vnoremap ; <esc>
-- vim.keymap.set('v', '<', '<esc>')  --   vnoremap < <esc>
-- vim.keymap.set('v', '>', '<esc>')  --   vnoremap > <esc>
-- vim.keymap.set('v', '=', '<esc>')  --   vnoremap = <esc>
-- vim.keymap.set('v', '-', '<esc>')  -- " vnoremap - <esc>
-- vim.keymap.set('v', '+', '<esc>')  -- " vnoremap + <esc>
-- vim.keymap.set('v', ',', '<esc>')  -- " vnoremap , <esc>
-- vim.keymap.set('v', '.', '<esc>')  --   vnoremap . <esc>
-- vim.keymap.set('v', '~', '<esc>')  -- " vnoremap ~ <esc>
-- 
-- vim.keymap.set('v', '<bar>', '<esc>')  -- " vnoremap <bar> <esc>
-- 
-- vim.keymap.set('v', 'a', '<esc>')  -- " vnoremap a <esc>
-- vim.keymap.set('v', 'b', '<esc>')  -- " vnoremap b <esc>
-- vim.keymap.set('v', 'c', '<esc>')  --   vnoremap c <esc>
-- vim.keymap.set('v', 'd', '<esc>')  -- " vnoremap d <esc>
-- vim.keymap.set('v', 'e', '<esc>')  -- " vnoremap e <esc>
-- vim.keymap.set('v', 'f', '<esc>')  -- " vnoremap f <esc>
-- vim.keymap.set('v', 'g', '<esc>')  --   vnoremap g <esc>
-- vim.keymap.set('v', 'h', '<esc>')  -- " vnoremap h <esc>
-- vim.keymap.set('v', 'i', '<esc>')  -- " vnoremap i <esc>
-- vim.keymap.set('v', 'l', '<esc>')  -- " vnoremap l <esc>
-- vim.keymap.set('v', 'm', '<esc>')  -- " vnoremap m <esc>
-- vim.keymap.set('v', 'n', '<esc>')  -- " vnoremap n <esc>
-- vim.keymap.set('v', 'o', '<esc>')  -- " vnoremap o <esc>
-- vim.keymap.set('v', 'p', '<esc>')  -- " vnoremap p <esc>
-- vim.keymap.set('v', 'q', '<esc>')  -- " vnoremap q <esc>
-- vim.keymap.set('v', 'r', '<esc>')  -- " vnoremap r <esc>
-- vim.keymap.set('v', 's', '<esc>')  -- " vnoremap s <esc>
-- vim.keymap.set('v', 't', '<esc>')  --   vnoremap t <esc>
-- vim.keymap.set('v', 'u', '<esc>')  -- " vnoremap u <esc>
-- vim.keymap.set('v', 'v', '<esc>')  -- " vnoremap v <esc>
-- vim.keymap.set('v', 'w', '<esc>')  -- " vnoremap w <esc>
-- vim.keymap.set('v', 'x', '<esc>')  --   vnoremap x <esc>
-- vim.keymap.set('v', 'y', '<esc>')  -- " vnoremap y <esc>
-- 
-- vim.keymap.set('v', 'A', '<esc>')  --   vnoremap A <esc>
-- vim.keymap.set('v', 'B', '<esc>')  --   vnoremap B <esc>
-- vim.keymap.set('v', 'C', '<esc>')  --   vnoremap C <esc>
-- vim.keymap.set('v', 'D', '<esc>')  -- " vnoremap D <esc>
-- vim.keymap.set('v', 'E', '<esc>')  -- " vnoremap E <esc>
-- vim.keymap.set('v', 'F', '<esc>')  --   vnoremap F <esc>
-- vim.keymap.set('v', 'H', '<esc>')  --   vnoremap H <esc>
-- vim.keymap.set('v', 'I', '<esc>')  --   vnoremap I <esc>
-- vim.keymap.set('v', 'J', '<esc>')  -- " vnoremap J <esc>
-- vim.keymap.set('v', 'K', '<esc>')  -- " vnoremap K <esc>
-- vim.keymap.set('v', 'L', '<esc>')  -- " vnoremap L <esc>
-- vim.keymap.set('v', 'M', '<esc>')  --   vnoremap M <esc>
-- vim.keymap.set('v', 'N', '<esc>')  -- " vnoremap N <esc>
-- vim.keymap.set('v', 'O', '<esc>')  -- " vnoremap O <esc>
-- vim.keymap.set('v', 'P', '<esc>')  --   vnoremap P <esc>
-- vim.keymap.set('v', 'Q', '<esc>')  --   vnoremap Q <esc>
-- vim.keymap.set('v', 'R', '<esc>')  --   vnoremap R <esc>
-- vim.keymap.set('v', 'S', '<esc>')  -- " vnoremap S <esc>
-- vim.keymap.set('v', 'T', '<esc>')  --   vnoremap T <esc>
-- vim.keymap.set('v', 'U', '<esc>')  -- " vnoremap U <esc>
-- vim.keymap.set('v', 'V', '<esc>')  --   vnoremap V <esc>
-- vim.keymap.set('v', 'W', '<esc>')  -- " vnoremap W <esc>
-- vim.keymap.set('v', 'X', '<esc>')  --   vnoremap X <esc>
-- vim.keymap.set('v', 'Y', '<esc>')  -- " vnoremap Y <esc>
-- 
-- vim.keymap.set('v', '<c-_>', '<esc>')  --   vnoremap <c-_> <esc>
-- vim.keymap.set('v', '<c-\>', '<esc>')  --   vnoremap <c-\> <esc>
-- 
-- vim.keymap.set('v', '<c-a>', '<esc>')  --   vnoremap <c-a> <esc>
-- vim.keymap.set('v', '<c-b>', '<esc>')  -- " vnoremap <c-b> <esc>
-- vim.keymap.set('v', '<c-c>', '<esc>')  --   vnoremap <c-c> <esc>
-- vim.keymap.set('v', '<c-d>', '<esc>')  -- " vnoremap <c-d> <esc>
-- vim.keymap.set('v', '<c-e>', '<esc>')  -- " vnoremap <c-e> <esc>
-- vim.keymap.set('v', '<c-f>', '<esc>')  -- " vnoremap <c-f> <esc>
-- vim.keymap.set('v', '<c-h>', '<esc>')  -- " vnoremap <c-h> <esc>
-- vim.keymap.set('v', '<c-i>', '<esc>')  -- " vnoremap <c-i> <esc>
-- vim.keymap.set('v', '<c-l>', '<esc>')  -- " vnoremap <c-l> <esc>
-- vim.keymap.set('v', '<c-m>', '<esc>')  -- " vnoremap <c-m> <esc>
-- vim.keymap.set('v', '<c-n>', '<esc>')  -- " vnoremap <c-n> <esc>
-- vim.keymap.set('v', '<c-o>', '<esc>')  -- " vnoremap <c-o> <esc>
-- vim.keymap.set('v', '<c-p>', '<esc>')  -- " vnoremap <c-p> <esc>
-- vim.keymap.set('v', '<c-q>', '<esc>')  --   vnoremap <c-q> <esc>
-- vim.keymap.set('v', '<c-r>', '<esc>')  --   vnoremap <c-r> <esc>
-- vim.keymap.set('v', '<c-s>', '<esc>')  -- " vnoremap <c-s> <esc>
-- vim.keymap.set('v', '<c-u>', '<esc>')  --   vnoremap <c-u> <esc>
-- vim.keymap.set('v', '<c-v>', '<esc>')  --   vnoremap <c-v> <esc>
-- vim.keymap.set('v', '<c-w>', '<esc>')  -- " vnoremap <c-w> <esc>
-- vim.keymap.set('v', '<c-x>', '<esc>')  --   vnoremap <c-x> <esc>
-- vim.keymap.set('v', '<c-y>', '<esc>')  -- " vnoremap <c-y> <esc>
-- 
-- vim.keymap.set('v', 'gb', '<esc>')  --   vnoremap gb <esc>
-- vim.keymap.set('v', 'gg', '<esc>')  --   vnoremap gg <esc>
-- vim.keymap.set('v', 'gh', '<esc>')  --   vnoremap gh <esc>
-- vim.keymap.set('v', 'gi', '<esc>')  --   vnoremap gi <esc>
-- vim.keymap.set('v', 'gj', '<esc>')  -- " vnoremap gj <esc>
-- vim.keymap.set('v', 'gk', '<esc>')  -- " vnoremap gk <esc>
-- vim.keymap.set('v', 'go', '<esc>')  -- " vnoremap go <esc>
-- vim.keymap.set('v', 'gp', '<esc>')  --   vnoremap gp <esc>
-- vim.keymap.set('v', 'gs', '<esc>')  --   vnoremap gs <esc>
-- vim.keymap.set('v', 'gt', '<esc>')  --   vnoremap gt <esc>
-- vim.keymap.set('v', 'gy', '<esc>')  -- " vnoremap gy <esc>
-- 
-- vim.keymap.set('v', ':a', '<esc>')  -- " vnoremap :a <esc>
-- vim.keymap.set('v', ':f', '<esc>')  --   vnoremap :f <esc>
                                       -- "           :
-- vim.keymap.set('v', ':m', '<esc>')  -- " vnoremap :m <esc>
                                       -- "           :
-- vim.keymap.set('v', ':t', '<esc>')  -- " vnoremap :t <esc>
                                       -- "           :
-- vim.keymap.set('v', ':z', '<esc>')  -- " vnoremap :z <esc>
-- 
-- -- leader esc
-- 
-- vim.keymap.set('v', '<leader>:', '<esc>')  --   vnoremap <leader>: <esc>
-- vim.keymap.set('v', '<leader>l', '<esc>')  -- " vnoremap <leader>l <esc>
-- vim.keymap.set('v', '<leader>u', '<esc>')  --   vnoremap <leader>u <esc>
-- vim.keymap.set('v', '<leader>y', '<esc>')  -- " vnoremap <leader>y <esc>

-- mode visual esc end


-- " mode ch line
-- vnoremap i V
   vim.keymap.set('v', 'i', 'V')

-- " mode ch visual box
-- "vnoremap v <c-v>
-- vnoremap <expr> v
-- \ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>' :
-- \                     '<c-v>'
-- vim.keymap.set('v', 'v', 'xx')
vim.keymap.set('v', 'v', function()
  return vim.fn.Is_slctd_mode__box() and
    ':call Slctd_box_width__1()<cr>' or
    '<c-v>'
end, {expr = true})

-- " file srch ( fzf )
-- "vnoremap <leader>xx "zy:FzfFile <c-r>z
-- vim.keymap.set('v', '<leader>xx', '"zy:FzfFile <c-r>z')

-- 
-- cursor mv
-- 

-- " cursor mv slctd edge tgl
-- vnoremap y :call Cursor__mv_slctd_edge_tgl()<cr>
   vim.keymap.set('v', 'y', ':call Cursor__mv_slctd_edge_tgl()<cr>')

-- " cursor mv slctd edge tgl, v box line same
-- vnoremap O O
   vim.keymap.set('v', 'O', 'O')

-- " cursor mv char forward
-- vnoremap l l
   vim.keymap.set('v', 'l', 'l')

-- " cursor mv char back
-- vnoremap <c-o> h
   vim.keymap.set('v', '<c-o>', 'h')

-- " cursor mv word - back
-- "vnoremap xx b
-- "vnoremap xx bh
-- "vnoremap xx Bh
-- vim.keymap.set('v', 'xx', 'b')
-- vim.keymap.set('v', 'xx', 'bh')
-- vim.keymap.set('v', 'xx', 'Bh')

-- " cursor mv line end
-- vnoremap <c-y> :call Slctd_cursor__mv_line_end()<cr>
   vim.keymap.set('v', '<c-y>', ':call Slctd_cursor__mv_line_end()<cr>')

-- " slctd __ reduce dlm _ r
-- vnoremap _ of_lo
   vim.keymap.set('v', '_', 'of_lo')
-- "vnoremap h of_lo
-- vim.keymap.set('v', 'h', 'of_lo')

-- " slctd __ reduce dlm _ l
-- "vnoremap h     F_h
-- vim.keymap.set('v', 'h', 'F_h')
-- vnoremap h     :call Slctd_str__reduce_dlm_l('_')<cr>
   vim.keymap.set('v', 'h', ':call Slctd_str__reduce_dlm_l("_")<cr>')
-- "vnoremap H     F_h
-- "vnoremap <c-_> F_h
-- vim.keymap.set('v', 'H', 'F_h')
-- vim.keymap.set('v', '<c-_>', 'F_h')

-- " cursor mv space - forward ( word pre )
-- "vnoremap xx wh
-- vim.keymap.set('v', 'xx', 'wh')

-- " cursor mv line
-- vnoremap <c-j> 10j
-- vnoremap <c-k> 10k
   vim.keymap.set('v', '<c-j>', '10j')
   vim.keymap.set('v', '<c-k>', '10k')

-- " cursor mv jmp
-- vnoremap rk :call Slctd_cursor__mv_v_jmp('k')<cr>
-- vnoremap rj :call Slctd_cursor__mv_v_jmp('j')<cr>
   vim.keymap.set('v', 'rk', ':call Slctd_cursor__mv_v_jmp("k")<cr>')
   vim.keymap.set('v', 'rj', ':call Slctd_cursor__mv_v_jmp("j")<cr>')

-- " cursor mv bracket pair
-- vnoremap <c-l> %
   vim.keymap.set('v', '<c-l>', '%')

-- " cursor mv bracket out back
-- "vnoremap xx [{
-- vim.keymap.set('v', 'xx', '[{')

-- " cursor mv bracket fnc back
-- "vnoremap xx [m
-- vim.keymap.set('v', 'xx', '[m')

-- " cursor mv file edge back    ( file bgn )
-- vnoremap gk :call Slctd_cursor__mv_file_edge('k')<cr>
   vim.keymap.set('v', 'gk', ':call Slctd_cursor__mv_file_edge("k")<cr>')

-- " cursor mv file edge forward ( file end   )
-- vnoremap gj :call Slctd_cursor__mv_file_edge('j')<cr>
   vim.keymap.set('v', 'gj', ':call Slctd_cursor__mv_file_edge("j")<cr>')

-- 
-- slct / ynk / paste
-- 

-- " slctd expnd
-- "vnoremap xx :call Slctd_str__expnd()
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd()')

-- " slctd expnd srch
-- vnoremap N :call Slctd_str__expnd_srch()<cr>
   vim.keymap.set('v', 'N', ':call Slctd_str__expnd_srch()<cr>')

-- " slctd expnd word forward
-- vnoremap f :call Slctd_str__expnd_word_f()<cr>
   vim.keymap.set('v', 'f', ':call Slctd_str__expnd_word_f()<cr>')

-- " slctd expnd quote
-- vnoremap <c-i> :call Slctd_str__expnd_quote_swtch()<cr>
   vim.keymap.set('v', '<c-i>', ':call Slctd_str__expnd_quote_swtch()<cr>')

-- " slctd expnd quote on
-- "vnoremap xx :call Slctd_str__expnd_quote_on_swtch()<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd_quote_on_swtch()<cr>')

-- " slctd expnd quote in
-- "vnoremap xx :call Slctd_str__expnd_quote_in_swtch()<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd_quote_in_swtch()<cr>')

-- " slctd expnd bracket forward
-- " vnoremap xx :call Slctd_str__expnd_bracket_f()<cr>

-- " slct all
-- vnoremap a :call Slctd_str__all()<cr>
   vim.keymap.set('v', 'a', ':call Slctd_str__all()<cr>')

-- " ynk slctd
-- vnoremap o :call Ynk__slctd()<cr>
   vim.keymap.set('v', 'o', ':call Ynk__slctd()<cr>')

-- " ynk slctd add
-- "vnoremap xx :call Ynk__add_slctd()<cr>
-- vim.keymap.set('v', 'xx', ':call Ynk__add_slctd()<cr>')

-- " clp slctd
-- "vnoremap xx "+y
-- vim.keymap.set('v', 'xx', '"+y')

-- " paste
-- " todo refactoring
-- "vnoremap p xx
-- vnoremap <expr> p
-- \ mode() == '<c-v>' ? ':call Slctd_box_edge_l__ynk_line_1()<cr>' :
-- \ mode() == 'v'     ? ':call Slctd_str__ynk()<cr>'               :
-- \                     ':call Slctd_str__ynk()<cr>'
-- " \ mode() == 'v'     ? '"zd"aP'                  :
-- vim.keymap.set('v', 'p', 'xx')
vim.keymap.set('v', 'p', function()
  return vim.fn.Is_slctd_mode__box() and
    ':call Slctd_box_edge_l__ynk_line_1()<cr>' or
    ':call Slctd_str__ynk()<cr>'
end, {expr = true})

-- " paste clp
-- "vnoremap xx :call Slctd_str__clp()<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_str__clp()<cr>')

-- " paste visual box
-- "vnoremap xx I<c-r>0<esc>
-- vim.keymap.set('v', 'xx', 'I<c-r>0<esc>')

-- 
-- edit
-- 

-- " ins | cut & ins
-- "vnoremap <space> xx
-- vnoremap <expr> <space>
-- \ mode() == '<c-v>' ? 'I' :
-- \                     'c'
-- vim.keymap.set('v', '<space>', 'xx')
vim.keymap.set('v', '<space>', function()
  return vim.fn.Is_slctd_mode__box() and
    'I' or
    'c'
end, {expr = true})

-- " cut & ins
-- "vnoremap <leader><space> "zc
-- vim.keymap.set('v', '<leader><space>', '"zc')

-- " ins $
-- "vnoremap Y xx
-- vnoremap <expr> Y
-- \ mode() == '<c-v>' ? '$A'      :
-- \                     '<c-v>$A'
-- vim.keymap.set('v', 'Y', 'xx')
vim.keymap.set('v', 'Y', function()
  return vim.fn.Is_slctd_mode__box() and
    '$A' or
    '<c-v>$A'
end, {expr = true})

-- " ins space
-- "vnoremap L xx
-- vnoremap <expr> L
-- \ mode() == '<c-v>' ? 'I <esc>gv' :
-- \ mode() == 'v'     ? '>gv'       :
-- \                     ''
-- vim.keymap.set('v', 'L', 'xx')
vim.keymap.set('v', 'L', function()
  return vim.fn.Is_slctd_mode__box() and
    'I <esc>gv' or
    '>gv'
end, {expr = true})

-- " line __ ins comment 1
-- vnoremap ! :call V_ins_cmnt_1()<cr>
-- vnoremap 1 :call V_ins_cmnt_1()<cr>
   vim.keymap.set('v', '!', ':call V_ins_cmnt_1()<cr>')
   vim.keymap.set('v', '1', ':call V_ins_cmnt_1()<cr>')

-- " line mlt __ ins comment
-- vnoremap & :call V_ins_cmnt_mlt()<cr>
   vim.keymap.set('v', '&', ':call V_ins_cmnt_mlt()<cr>')
-- "vnoremap $ :call V_ins_cmnt_mlt()<cr>
-- vim.keymap.set('v', '$', ':call V_ins_cmnt_mlt()<cr>')

-- " line end __ ins comma
-- vnoremap , :call Curosr_line_end__ins(',')<cr>
   vim.keymap.set('v', ',', ':call Curosr_line_end__ins(",")<cr>')

-- " pad space
-- vnoremap S :call Slctd__pad_space()<cr>
   vim.keymap.set('v', 'S', ':call Slctd__pad_space()<cr>')

-- " pad -
-- vnoremap - :call Slctd__pad('-')<cr>
   vim.keymap.set('v', '-', ':call Slctd__pad("-")<cr>')

-- " pad |
-- vnoremap <bar> :call Slctd__pad_bar()<cr>
   vim.keymap.set('v', '<bar>', ':call Slctd__pad_bar()<cr>')

-- " slctd str space __ under score
-- vnoremap q :call Slctd_str_space__underscore()<cr>
   vim.keymap.set('v', 'q', ':call Slctd_str_space__underscore()<cr>')

-- " line __ join per line
-- vnoremap J :call Slctd_line__join_per_line(3)
   vim.keymap.set('v', 'J', ':call Slctd_line__join_per_line(3)')

-- " del str > ynk
-- "vnoremap d xx
-- vnoremap <expr> d
-- \ mode() == '<c-v>' ? '"ad:let @+ = @a<cr>gv' :
-- \                     '"ad:let @+ = @a<cr>'
-- vim.keymap.set('v', 'd', 'xx')
vim.keymap.set('v', 'd', function()
  return vim.fn.Is_slctd_mode__box() and
    '"ad:let @+ = @a<cr>gv' or
    '"ad:let @+ = @a<cr>'
end, {expr = true})

-- "vnoremap xx :call V_slctd__del()<cr> " dev doing
-- vim.keymap.set('v', 'xx', ':call V_slctd__del()<cr>')

-- " del str > ynk not
-- "vnoremap s xx
-- vnoremap <expr> s
-- \ mode() == '<c-v>' ? ':call Slctd__del()<cr>' :
-- \                     '"zx'
-- vim.keymap.set('v', 's', 'xx')
vim.keymap.set('v', 's', function()
  return vim.fn.Is_slctd_mode__box() and
    ':call Slctd__del()<cr>' or
    '"zx'
end, {expr = true})

-- " line mlt forward del
-- vnoremap <c-d> D
   vim.keymap.set('v', '<c-d>', 'D')

-- " slctd line __ del line top space
-- "vnoremap xx :call Slctd_line_top_space__del()<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_line_top_space__del()<cr>')

-- " slctd line __ del end space
-- vnoremap m :call Slctd_line_end_space__del()<cr>
   vim.keymap.set('v', 'm', ':call Slctd_line_end_space__del()<cr>')

-- " slctd box __ del cursor f space
-- vnoremap K :call Slctd_box_cursor_r_space__crct()<cr>
   vim.keymap.set('v', 'K', ':call Slctd_box_cursor_r_space__crct()<cr>')

-- " slctd str edge out quote __ tgl
-- "vnoremap w     xx
-- vnoremap <expr> w
-- \ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>'    :
-- \                     ':call Slctd_str_edge_out_char__tgl()<cr>'
-- vim.keymap.set('v', 'w', 'xx')
vim.keymap.set('v', 'w', function()
  return vim.fn.Is_slctd_mode__box() and
    ':call Slctd_box_width__1()<cr>' or
    ':call Slctd_str_edge_out_char__tgl()<cr>'
end, {expr = true})

-- " slctd str edge bracket __ tgl
-- " vnoremap xx :call Slctd_str_edge_out_bracket__tgl()<cr>

-- " slctd str edge out __ tgl shft
-- vnoremap W :call Slctd_str_edge_out__tgl_shft()<cr>
   vim.keymap.set('v', 'W', ':call Slctd_str_edge_out__tgl_shft()<cr>')

-- " slctd str edge out __ ins space
-- vnoremap <c-s> :call Slctd_str_edge_out__ins(' ')<cr>
   vim.keymap.set('v', '<c-s>', ':call Slctd_str_edge_out__ins(" ")<cr>')

-- " slctd str edge out __ ins markdown strikethrough
-- vnoremap ~ :call Slctd_str_edge_out__ins_markdown_strikethrough()<cr>
   vim.keymap.set('v', '~', ':call Slctd_str_edge_out__ins_markdown_strikethrough()<cr>')

-- " slctd str edge out __ ins markdown strikethrough
-- vnoremap b :call Slctd_str_edge_out__ins_markdown_bold()<cr>
   vim.keymap.set('v', 'b', ':call Slctd_str_edge_out__ins_markdown_bold()<cr>')

-- " slctd box str mv back
-- "vnoremap xx :call Slctd_box_str__mv('l')<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_box_str__mv('l')<cr>')

-- " slctd box str mv forward
-- "vnoremap xx :call Slctd_box_str__mv('r')<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_box_str__mv('r')<cr>')

-- " slctd box space __ del
-- vnoremap D :call Slctd_box_space__del()<cr>
   vim.keymap.set('v', 'D', ':call Slctd_box_space__del()<cr>')

-- " slctd box mv back
-- vnoremap <c-w> :call Slctd_box__mv('l')<cr>
   vim.keymap.set('v', '<c-w>', ':call Slctd_box__mv("l")<cr>')

-- " slctd box mv forward
-- vnoremap <c-e> :call Slctd_box__mv('r')<cr>
   vim.keymap.set('v', '<c-e>', ':call Slctd_box__mv("r")<cr>')

-- " num icl
-- vnoremap + <c-a>gv
   vim.keymap.set('v', '+', '<c-a>gv')

-- " num dcl
-- "vnoremap - <c-x>gv
-- vim.keymap.set('v', '-', '<c-x>gv')

-- " num seq
-- vnoremap * r0gvg<c-a>gv
-- "          ^^^^^^^^^^^^> r0 gv g<c-a> gv
   vim.keymap.set('v', '*', 'r0gvg<c-a>gv')

-- " indnt shft
-- " slctd indnt __ shft l, r  -  todo dev,
-- "vnoremap ri :call Slctd_indnt__shft_l()<cr>
-- "vnoremap ro :call Slctd_indnt__shft_r()<cr>
-- vim.keymap.set('v', 'ri', ':call Slctd_indnt__shft_l()<cr>')
-- vim.keymap.set('v', 'ro', ':call Slctd_indnt__shft_r()<cr>')
-- vnoremap ri <gv
-- vnoremap ro >gv
   vim.keymap.set('v', 'ri', '<gv')
   vim.keymap.set('v', 'ro', '>gv')

-- " indnt crct
-- vnoremap ; =gv
   vim.keymap.set('v', ';', '=gv')

-- " indnt tab   > space
-- vnoremap :e :call Slctd_line_indnt__space(2)
   vim.keymap.set('v', ':e', ':call Slctd_line_indnt__space(2)')

-- " indnt space > tab
-- "vnoremap xx :call Slctd_line_indnt__tab(2)<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_line_indnt__tab(2)<cr>')

-- " tidy tbl
-- vnoremap :t :call Slctd_line__crct_tbl()
   vim.keymap.set('v', ':t', ':call Slctd_line__crct_tbl()')

-- " line end ovr, pad __ space
-- "vnoremap xx :call Slctd_line_end__pad_space()
-- vim.keymap.set('v', 'xx', ':call Slctd_line_end__pad_space()')

-- " upper / lower tgl
-- vnoremap u ~gv
   vim.keymap.set('v', 'u', '~gv')

-- " upper force
-- vnoremap U Ugv
   vim.keymap.set('v', 'U', 'Ugv')

-- " lower force
-- "vnoremap xx ugv
-- vim.keymap.set('v', 'xx', 'ugv')

-- " str mb
-- vnoremap :m :call Slctd_line_mb__cnv()
   vim.keymap.set('v', ':m', ':call Slctd_line_mb__cnv()')

-- 
-- srch
-- 

-- " srch cmd
-- vnoremap <leader>k "zy/<c-r>z
   vim.keymap.set('v', '<leader>k', '"zy/<c-r>z')
-- "vnoremap <leader>i "zy/<c-r>z
-- vim.keymap.set('v', '<leader>i', '"zy/<c-r>z')

-- " srch forward ( srch rpl skip )
-- vnoremap <c-n> :call Slctd_srch_7_slctd__srch_nxt('f')<cr>
   vim.keymap.set('v', '<c-n>', ':call Slctd_srch_7_slctd__srch_nxt("f")<cr>')

-- " srch back
-- "vnoremap xx    :call Slctd_srch_7_slctd__srch_nxt('b')<cr>
-- vim.keymap.set('v', 'xx', ':call Slctd_srch_7_slctd__srch_nxt('b')<cr>')

-- " srch str set
-- vnoremap n :call Slctd_srch__swtch()<cr>
   vim.keymap.set('v', 'n', ':call Slctd_srch__swtch()<cr>')
-- "vnoremap e     xx
-- vnoremap <expr> e
-- \ mode() == '<c-v>' ? '<esc>' :
-- \                     ':call Srch_str__slctd_str()<cr>'
-- vim.keymap.set('v', 'e', 'xx')
vim.keymap.set('v', 'e', function()
  return vim.fn.Is_slctd_mode__box() and
    '<esc>' or
    ':call Srch_str__slctd_str()<cr>'
end, {expr = true})

-- " srch rpl one > ynk, nxt
-- vnoremap <c-p> :call Slctd__rpl_7_srch_nxt()<cr>
   vim.keymap.set('v', '<c-p>', ':call Slctd__rpl_7_srch_nxt()<cr>')

-- " rpl ( cmd )
-- "vnoremap :s    xx
-- vnoremap <expr> :s
-- \ mode() == '<c-v>' ? ':VBoxRpl ' :
-- \                     ':s///g'
-- "\                     ':sort'
-- "\                     ':Rpl '
-- vim.keymap.set('v', ':s', 'xx')
vim.keymap.set('v', ':s', function()
  return vim.fn.Is_slctd_mode__box() and
    ':VBoxRpl ' or
    ':s///g'
    -- ':sort'
    -- ':Rpl '
end, {expr = true})

-- " rpl cr ( add cr )
-- vnoremap <c-m> :call Slctd_line_srch_str__rpl_cr()<cr>
   vim.keymap.set('v', '<c-m>', ':call Slctd_line_srch_str__rpl_cr()<cr>')

-- " v box edge char shft in
-- "vnoremap <c-h> xx
-- vnoremap <expr> <c-h>
-- \ mode() == '<c-v>' ? ':call Slctd_box_edge_r_char__shft_in()<cr>' :
-- \                     ''
-- vim.keymap.set('v', '<c-h>', 'xx')
vim.keymap.set('v', '<c-h>', function()
  return vim.fn.Is_slctd_mode__box() and
    ':call Slctd_box_edge_r_char__shft_in()<cr>' or
    ''
end, {expr = true})

-- " fzf buf
-- vnoremap <leader>i :call V_fzf_buf()<cr>
   vim.keymap.set('v', '<leader>i', ':call V_fzf_buf()<cr>')

-- " fzf rg
-- vnoremap <leader>o "zy:call Fzf_rg('<c-r>z')<cr>
   vim.keymap.set('v', '<leader>o', '"zy:call Fzf_rg("<c-r>z")<cr>')

-- " fzf rg word1
-- vnoremap <leader>O "zy:call Fzf_rg_word1('<c-r>z')<cr>
   vim.keymap.set('v', '<leader>O', '"zy:call Fzf_rg_word1("<c-r>z")<cr>')

-- " tag jmp
-- "vnoremap t :call Tag_jmp_by_slctd_line()<cr>
-- vim.keymap.set('v', 't', ':call Tag_jmp_by_slctd_line()<cr>')

-- " opn app
-- vnoremap go :call Slctd_line_7_opn_app()<cr>
   vim.keymap.set('v', 'go', ':call Slctd_line_7_opn_app()<cr>')

-- " opn brwsr
-- "vnoremap gx <plug>(openbrowser-smart-search)
-- vim.keymap.set('v', 'gx', '<plug>(openbrowser-smart-search)')

-- " opn ggl srch
-- vnoremap ggl :call Slctd_str_7_opn_ggl_srch()<cr>
   vim.keymap.set('v', 'ggl', ':call Slctd_str_7_opn_ggl_srch()<cr>')

-- " opn youtube video_id
-- vnoremap gy :call Slctd_str_7_opn_yt()<cr>
   vim.keymap.set('v', 'gy', ':call Slctd_str_7_opn_yt()<cr>')

-- " trns
-- vnoremap r :call Slctd_trns()<cr>
   vim.keymap.set('v', 'r', ':call Slctd_trns()<cr>')

-- 
-- cmd
-- 

-- " cmd history ( fzf )
-- "vnoremap <leader>xx :FzfCmdHstry<cr>
-- vim.keymap.set('v', '<leader>xx', ':FzfCmdHstry<cr>')

-- 
-- mode insert
-- 

-- 
-- esc / nop
-- 

-- vim.keymap.set('i', '<leader>'  , '<esc>')  --   inoremap <leader>   <esc>
-- vim.keymap.set('i', '<esc>'     , '<esc>')  --   inoremap <esc>      <esc>
-- vim.keymap.set('i', '<esc><esc>', '<esc>')  -- " inoremap <esc><esc> <esc>
-- 
-- vim.keymap.set('i', '<tab>'    , '<nop>')  -- " inoremap <tab>     <nop>
-- vim.keymap.set('i', '<s-tab>'  , '<nop>')  --   inoremap <s-tab>   <nop>
-- vim.keymap.set('i', '<c-tab>'  , '<nop>')  --   inoremap <c-tab>   <nop>
-- vim.keymap.set('i', '<c-space>', '<nop>')  -- " inoremap <c-space> <nop>
-- vim.keymap.set('i', '<c-space>', '<nop>')  -- " inoremap <c-space> <tab> " ?? todo research
-- vim.keymap.set('i', '<c-space>', '<nop>')  --   inoremap <c-space> <tab>
-- 
-- vim.keymap.set('i', '<c-_>', '<nop>')  --   inoremap <c-_> <nop> " non ?
-- vim.keymap.set('i', '<c-^>', '<nop>')  --   inoremap <c-^> <nop>
-- vim.keymap.set('i', '<c-\>', '<nop>')  --   inoremap <c-\> <nop>
-- vim.keymap.set('i', '<c-->', '<nop>')  --   inoremap <c--> <nop>
-- vim.keymap.set('i', '<c-@>', '<nop>')  -- " inoremap <c-@> <nop> " non
-- vim.keymap.set('i', '<c-,>', '<nop>')  -- " inoremap <c-,> <nop> " non
-- vim.keymap.set('i', '<c-.>', '<nop>')  -- " inoremap <c-.> <nop> " non
-- vim.keymap.set('i', '<c-:>', '<nop>')  -- " inoremap <c-:> <nop> " non
-- vim.keymap.set('i', '<c-;>', '<nop>')  -- " inoremap <c-;> <nop> " non
-- 
-- vim.keymap.set('i', '<c-a>', '<nop>')  --   inoremap <c-a> <nop>
-- vim.keymap.set('i', '<c-b>', '<nop>')  --   inoremap <c-b> <nop>
-- vim.keymap.set('i', '<c-f>', '<nop>')  -- " inoremap <c-f> <nop>
-- vim.keymap.set('i', '<c-g>', '<nop>')  --   inoremap <c-g> <nop>
-- vim.keymap.set('i', '<c-i>', '<nop>')  -- " inoremap <c-i> <nop>
-- vim.keymap.set('i', '<c-k>', '<nop>')  -- " inoremap <c-k> <nop>
-- vim.keymap.set('i', '<c-n>', '<nop>')  -- " inoremap <c-n> <nop>
-- vim.keymap.set('i', '<c-o>', '<nop>')  -- " inoremap <c-o> <nop>
-- vim.keymap.set('i', '<c-p>', '<nop>')  -- " inoremap <c-p> <nop>
-- vim.keymap.set('i', '<c-q>', '<nop>')  -- " inoremap <c-q> <nop>
-- vim.keymap.set('i', '<c-r>', '<nop>')  -- " inoremap <c-r> <nop>
-- vim.keymap.set('i', '<c-s>', '<nop>')  -- " inoremap <c-s> <nop>
-- vim.keymap.set('i', '<c-t>', '<nop>')  -- " inoremap <c-t> <nop>
-- vim.keymap.set('i', '<c-u>', '<nop>')  -- " inoremap <c-u> <nop>
-- vim.keymap.set('i', '<c-y>', '<nop>')  -- " inoremap <c-y> <nop>
-- 
-- vim.keymap.set('i', '<leader>f', '<nop>')  -- " inoremap <leader>f <nop>
-- vim.keymap.set('i', '<leader>i', '<nop>')  --   inoremap <leader>i <nop>

-- esc / nop end

-- " quit, esc
-- "inoremap <esc> xx
-- inoremap <expr> <esc>
-- \ pumvisible()               ? '<c-e>'  :
-- \ Is_cursor_col__line_top0() ? '<esc>'  :
-- \                              '<esc>l'
-- vim.keymap.set('i', '<esc>', 'xx')
vim.keymap.set('i', '<esc>', function()
  return vim.fn.pumvisible() and
    '<c-e>' or
    '<esc>'
end, {expr = true})

-- " inoremap <c-c> xx
-- inoremap <expr> <c-c>
-- \ pumvisible()               ? '<c-e>'  :
-- \ Is_cursor_col__line_top0() ? '<esc>'  :
-- \                              '<esc>l'
-- vim.keymap.set('i', '<c-c>', 'xx')
vim.keymap.set('i', '<c-c>', function()
  return vim.fn.pumvisible() and
    '<c-c>' or
    '<c-c>'
end, {expr = true})

-- " cursor mv in line top
-- "inoremap <c-a> <c-o>^
-- "inoremap <c-a> <c-o>0
-- vim.keymap.set('i', '<c-a>', '<c-o>^')
-- vim.keymap.set('i', '<c-a>', '<c-o>0')

-- dev anchor  continue

-- " cursor mv in line end
-- inoremap <c-e> <c-o>$
   vim.keymap.set('i', '<c-e>', '<c-o>$')

-- " cursor mv char forward
-- inoremap <c-l> <c-o>l
   vim.keymap.set('i', '<c-l>', '<c-o>l')

-- " cursor mv char back
-- inoremap <c-s> <c-o>h
   vim.keymap.set('i', '<c-s>', '<c-o>h')
-- "inoremap <c-o> xx
-- inoremap <expr> <c-o>
-- \ pumvisible() ? '<c-y>'  :
-- \                '<c-o>h'
-- vim.keymap.set('i', '<c-o>', 'xx')
vim.keymap.set('i', '<c-o>', function()
  return vim.fn.pumvisible() and
    '<c-y>' or
    '<c-o>h'
end, {expr = true})

-- " cursor mv word forward
-- "inoremap xx <c-o>e<c-o>l
-- vim.keymap.set('i', 'xx', '<c-o>e<c-o>l')

-- " cursor mv word back
-- "inoremap <c-o> xx
-- "inoremap <expr> <c-o>
-- "\ pumvisible() ? '<c-y>'  :
-- "\                '<c-o>b'

-- " cursor mv d
-- "inoremap <c-n> <c-o>j
-- vim.keymap.set('i', '<c-n>', '<c-o>j')

-- " cursor mv u
-- "inoremap <c-p> <c-o>k
-- vim.keymap.set('i', '<c-p>', '<c-o>k')

-- " ins cr
-- inoremap <c-m> <cr>
   vim.keymap.set('i', '<c-m>', '<cr>')

-- " ins tab
-- inoremap <tab> <c-v><tab>
   vim.keymap.set('i', '<tab>', '<c-v><tab>')

-- " ins cmplt default
-- inoremap <leader>f <c-p>
   vim.keymap.set('i', '<leader>f', '<c-p>')

-- "inoremap <c-y> xx
-- "inoremap <expr> <c-y>
-- "\ pumvisible() ? '<c-e>' :
-- "\                '<c-n>'

-- " ins bracket
-- "inoremap <c-u> xx
-- inoremap <expr> <c-u>
-- \ pumvisible() ? '<c-n>'               :
-- \                '<c-r>=I_quote()<cr>'
-- vim.keymap.set('i', '<c-u>', 'xx')
vim.keymap.set('i', '<c-u>', function()
  return vim.fn.pumvisible() and
    '<c-n>' or
    '<c-r>=I_quote()<cr>'
end, {expr = true})

-- " ins quote
-- "inoremap <c-j> xx
-- inoremap <expr> <c-j>
-- \ pumvisible() ? '<c-n>'                 :
-- \                '<c-r>=I_bracket()<cr>'
-- vim.keymap.set('i', '<c-j>', 'xx')
vim.keymap.set('i', '<c-j>', function()
  return vim.fn.pumvisible() and
    '<c-n>' or
    '<c-r>=I_bracket()<cr>'
end, {expr = true})

-- " ins num
-- inoremap <c-y>     <c-r>=I_num()<cr>
   vim.keymap.set('i', '<c-y>', '<c-r>=I_num()<cr>')
-- "inoremap <leader>k <c-r>=I_num()<cr>
-- vim.keymap.set('i', '<leader>k', '<c-r>=I_num()<cr>')

-- " ins symbol
-- inoremap <c-n> <c-r>=I_symbol01()<cr>
   vim.keymap.set('i', '<c-n>', '<c-r>=I_symbol01()<cr>')
-- inoremap <c-f> <c-r>=I_symbol02()<cr>
   vim.keymap.set('i', '<c-f>', '<c-r>=I_symbol02()<cr>')
-- inoremap <c-p> <c-r>=I_symbol03()<cr>
   vim.keymap.set('i', '<c-p>', '<c-r>=I_symbol03()<cr>')

-- " ins markdown
-- "inoremap <c-u> <c-r>=I_markdown_lnk()<cr>
-- vim.keymap.set('i', '<c-u>', '<c-r>=I_markdown_lnk()<cr>')

-- " ins todo status
-- "inoremap xx <c-r>=I_todo_status()<cr>
-- vim.keymap.set('i', 'xx', '<c-r>=I_todo_status()<cr>')

-- " ins week
-- "inoremap xx <c-r>=I_week()<cr>
-- vim.keymap.set('i', 'xx', '<c-r>=I_week()<cr>')

-- " ins register
-- "inoremap xx <c-r>=I_reg()<cr>
-- vim.keymap.set('i', 'xx', '<c-r>=I_reg()<cr>')

-- " ins reserved word lua
-- "inoremap xx <c-r>=I_reserved_lua()<cr>
-- vim.keymap.set('i', 'xx', '<c-r>=I_reserved_lua()<cr>')

-- " ins ooq ( lua )
-- "inoremap xx <c-r>=I_ooq()<cr>
-- vim.keymap.set('i', 'xx', '<c-r>=I_ooq()<cr>')

-- " ins bracket
-- vim.keymap.set('i', '<', '<><c-o>h')  -- "inoremap < <><c-o>h
-- vim.keymap.set('i', '(', '()<c-o>h')  -- "inoremap ( ()<c-o>h
-- vim.keymap.set('i', '{', '{}<c-o>h')  -- "inoremap { {}<c-o>h
-- vim.keymap.set('i', '[', '[]<c-o>h')  -- "inoremap [ []<c-o>h
-- vim.keymap.set('i', '"', '""<c-o>h')  -- "inoremap " ""<c-o>h
-- vim.keymap.set('i', "'", "''<c-o>h")  -- "inoremap ' ''<c-o>h

-- " del char forward
-- inoremap <c-d> <c-o>x
   vim.keymap.set('i', '<c-d>', '<c-o>x')

-- " del char back
-- inoremap <c-h> <c-h>
   vim.keymap.set('i', '<c-h>', '<c-h>')

-- " del word back
-- inoremap <c-w> <c-w>
   vim.keymap.set('i', '<c-w>', '<c-w>')

-- " del word forword
-- "inoremap <c-k> xx
-- inoremap <expr> <c-k>
-- \ pumvisible()                ? '<c-p>'   :
-- \ ! Is_cursor_col__line_end() ? '<c-o>dw' :
-- \                               ''
-- vim.keymap.set('i', '<c-k>', 'xx')
vim.keymap.set('i', '<c-k>', function()
  return vim.fn.pumvisible() and
    '<c-p>' or
    '<c-o>dw'
end, {expr = true})

-- " del line
-- " non

-- " paste
-- "inoremap xx <c-r>0
-- vim.keymap.set('i', 'xx', '<c-r>0')

-- " paste clp
-- inoremap <c-v> <c-r><c-o>+
   vim.keymap.set('i', '<c-v>', '<c-r><c-o>+')

-- " clr
-- "inoremap <expr> <esc> pumvisible() ? '<c-e>'  : ''
-- "inoremap <expr> <c-w> pumvisible() ? '<c-e>'  : '<c-w>'
-- vim.keymap.set('i', 'xx', '<c-o>l')
-- vim.keymap.set('i', 'xx', '<c-o>l')

-- " numpad shift
   vim.keymap.set('i', '<kInsert>'  , '0')  -- inoremap <kInsert>   0
   vim.keymap.set('i', '<kEnd>'     , '1')  -- inoremap <kEnd>      1
   vim.keymap.set('i', '<kDown>'    , '2')  -- inoremap <kDown>     2
   vim.keymap.set('i', '<kPageDown>', '3')  -- inoremap <kPageDown> 3
   vim.keymap.set('i', '<kLeft>'    , '4')  -- inoremap <kLeft>     4
   vim.keymap.set('i', '<kOrigin>'  , '5')  -- inoremap <kOrigin>   5
   vim.keymap.set('i', '<kRight>'   , '6')  -- inoremap <kRight>    6
   vim.keymap.set('i', '<kHome>'    , '7')  -- inoremap <kHome>     7
   vim.keymap.set('i', '<kUp>'      , '8')  -- inoremap <kUp>       8
   vim.keymap.set('i', '<kPageUp>'  , '9')  -- inoremap <kPageUp>   9

-- 
-- mode cmd
-- 

-- " quit
-- cnoremap <c-q> <c-c>
   vim.keymap.set('c', '<c-q>', '<c-c>')

-- " cursor mv line in
-- cnoremap <c-a> <c-b>
   vim.keymap.set('c', '<c-a>', '<c-b>')
-- cnoremap <c-e> <c-e>
   vim.keymap.set('c', '<c-e>', '<c-e>')
-- "cnoremap <c-a> <home>
-- "cnoremap <c-e> <end>
-- vim.keymap.set('c', '<c-a>', '<home>')
-- vim.keymap.set('c', '<c-e>', '<end>' )

-- " cursor mv char
-- cnoremap <c-s> <Left>
   vim.keymap.set('c', '<c-s>', '<Left>')
-- cnoremap <c-l> <Right>
   vim.keymap.set('c', '<c-l>', '<Right>')

-- " cursor mv word
-- cnoremap <c-o> <s-left>
   vim.keymap.set('c', '<c-o>', '<s-left>')
-- cnoremap <c-f> <s-right>
   vim.keymap.set('c', '<c-f>', '<s-right>')

-- " del char
-- cnoremap <c-h> <bs>
   vim.keymap.set('c', '<c-h>', '<bs>')
-- cnoremap <c-d> <del>
   vim.keymap.set('c', '<c-d>', '<del>')

-- " del word forward
-- "cnoremap ?? non ? idea <s-right><c-w>
-- cnoremap <c-k> <del>
   vim.keymap.set('c', '<c-k>', '<del>')

-- " del word back
-- cnoremap <c-w> <c-w>
   vim.keymap.set('c', '<c-w>', '<c-w>')

-- " del in line back
-- cnoremap <c-u> <c-u>
   vim.keymap.set('c', '<c-u>', '<c-u>')

-- " paste
-- cnoremap <c-v> <c-r>a
   vim.keymap.set('c', '<c-v>', '<c-r>a')

-- " history
-- "cnoremap <c-p> <Up>
-- "cnoremap <c-n> <Down>
-- vim.keymap.set('c', '<c-p>', '<Up>'  )
-- vim.keymap.set('c', '<c-n>', '<Down>')

-- " cmdline win
-- cnoremap <c-_> <c-f>
   vim.keymap.set('c', '<c-_>', '<c-f>')

-- " numpad shift
   vim.keymap.set('c', '<kInsert>'  , '0')  -- cnoremap <kInsert>   0
   vim.keymap.set('c', '<kEnd>'     , '1')  -- cnoremap <kEnd>      1
   vim.keymap.set('c', '<kDown>'    , '2')  -- cnoremap <kDown>     2
   vim.keymap.set('c', '<kPageDown>', '3')  -- cnoremap <kPageDown> 3
   vim.keymap.set('c', '<kLeft>'    , '4')  -- cnoremap <kLeft>     4
   vim.keymap.set('c', '<kOrigin>'  , '5')  -- cnoremap <kOrigin>   5
   vim.keymap.set('c', '<kRight>'   , '6')  -- cnoremap <kRight>    6
   vim.keymap.set('c', '<kHome>'    , '7')  -- cnoremap <kHome>     7
   vim.keymap.set('c', '<kUp>'      , '8')  -- cnoremap <kUp>       8
   vim.keymap.set('c', '<kPageUp>'  , '9')  -- cnoremap <kPageUp>   9

-- 
-- mode term
-- 

-- " term > normal
-- tnoremap <c-_> <c-\><c-n>
   vim.keymap.set('t', '<c-_>', '<c-\\><c-n>')


