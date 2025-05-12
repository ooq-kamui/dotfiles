-- 
-- key map
-- 

-- leader
   vim.g.mapleader = vim.api.nvim_replace_termcodes('<esc>', false, false, true)

-- 
-- mode normal
-- 

-- mode normal esc

   vim.keymap.set('n', '<esc>'    , '<esc>')
   vim.keymap.set('n', '<space>'  , '<esc>')
   vim.keymap.set('n', '<s-space>', '<esc>')
   vim.keymap.set('n', '<cr>'     , '<esc>')
   vim.keymap.set('n', '<bs>'     , '<esc>')
   vim.keymap.set('n', '<bar>'    , '<esc>') -- |
   vim.keymap.set('n', '<enter>'  , '<esc>')
   vim.keymap.set('n', '<tab>'    , '<esc>')

   vim.keymap.set('n', '-', '<esc>')
   vim.keymap.set('n', '+', '<esc>')
   vim.keymap.set('n', '=', '<esc>')
   vim.keymap.set('n', '@', '<esc>')
   vim.keymap.set('n', ';', '<esc>')
   vim.keymap.set('n', ',', '<esc>')
   vim.keymap.set('n', '.', '<esc>')
   vim.keymap.set('n', '*', '<esc>')
   vim.keymap.set('n', '_', '<esc>')
   vim.keymap.set('n', '~', '<esc>')
   vim.keymap.set('n', '^', '<esc>')
   vim.keymap.set('n', '/', '<esc>')
   vim.keymap.set('n', '?', '<esc>')
   vim.keymap.set('n', '!', '<esc>')
   vim.keymap.set('n', '"', '<esc>')
   vim.keymap.set('n', '`', '<esc>')
   vim.keymap.set('n', '#', '<esc>')
   vim.keymap.set('n', '$', '<esc>')
   vim.keymap.set('n', '%', '<esc>')  -- ?
   vim.keymap.set('n', '&', '<esc>')
   vim.keymap.set('n', '(', '<esc>')
   vim.keymap.set('n', '<', '<esc>')
   vim.keymap.set('n', '>', '<esc>')
   vim.keymap.set('n', '[', '<esc>')
   vim.keymap.set('n', ']', '<esc>')

   vim.keymap.set('n', '\\', '<esc>')

   vim.keymap.set('n', '<<', '<esc>')
   vim.keymap.set('n', '>>', '<esc>')

   vim.keymap.set('n', '0', '<esc>')
   vim.keymap.set('n', '2', '<esc>')

   vim.keymap.set('n', 'a', '<esc>')
   vim.keymap.set('n', 'b', '<esc>')
   vim.keymap.set('n', 'c', '<esc>')
   vim.keymap.set('n', 'd', '<esc>')
   vim.keymap.set('n', 'e', '<esc>')
   vim.keymap.set('n', 'f', '<esc>')
   vim.keymap.set('n', 'g', '<esc>')
   vim.keymap.set('n', 'h', '<esc>')
   vim.keymap.set('n', 'i', '<esc>')
   vim.keymap.set('n', 'j', '<esc>')
   vim.keymap.set('n', 'k', '<esc>')
   vim.keymap.set('n', 'l', '<esc>')
   vim.keymap.set('n', 'm', '<esc>')
   vim.keymap.set('n', 'n', '<esc>')
   vim.keymap.set('n', 'o', '<esc>')
   vim.keymap.set('n', 'q', '<esc>')
   vim.keymap.set('n', 'r', '<esc>')
   vim.keymap.set('n', 's', '<esc>')
   vim.keymap.set('n', 't', '<esc>')
   vim.keymap.set('n', 'u', '<esc>')
   vim.keymap.set('n', 'w', '<esc>')
   vim.keymap.set('n', 'x', '<esc>')
   vim.keymap.set('n', 'y', '<esc>')
   vim.keymap.set('n', 'z', '<esc>')
   
   vim.keymap.set('n', 'A', '<esc>')
   vim.keymap.set('n', 'B', '<esc>')
   vim.keymap.set('n', 'C', '<esc>')
   vim.keymap.set('n', 'D', '<esc>')
   vim.keymap.set('n', 'E', '<esc>')
   vim.keymap.set('n', 'F', '<esc>')
   vim.keymap.set('n', 'G', '<esc>')
   vim.keymap.set('n', 'H', '<esc>')
   vim.keymap.set('n', 'I', '<esc>')
   vim.keymap.set('n', 'J', '<esc>')
   vim.keymap.set('n', 'K', '<esc>')
   vim.keymap.set('n', 'L', '<esc>')
   vim.keymap.set('n', 'M', '<esc>')
   vim.keymap.set('n', 'N', '<esc>')
   vim.keymap.set('n', 'O', '<esc>')
   vim.keymap.set('n', 'Q', '<esc>')
   vim.keymap.set('n', 'P', '<esc>')
   vim.keymap.set('n', 'R', '<esc>')
   vim.keymap.set('n', 'S', '<esc>')
   vim.keymap.set('n', 'T', '<esc>')
   vim.keymap.set('n', 'U', '<esc>')
   vim.keymap.set('n', 'W', '<esc>')
   vim.keymap.set('n', 'V', '<esc>')
   vim.keymap.set('n', 'X', '<esc>')
   vim.keymap.set('n', 'Y', '<esc>')

   vim.keymap.set('n', '<c-tab>'  , '<esc>')
   vim.keymap.set('n', '<c-space>', '<esc>')
   
   vim.keymap.set('n', '<c-@>', '<esc>')
   vim.keymap.set('n', '<c-^>', '<esc>')
   vim.keymap.set('n', '<c-->', '<esc>') -- non
   vim.keymap.set('n', '<c-*>', '<esc>') -- non ?
   vim.keymap.set('n', '<c-:>', '<esc>') -- non
   vim.keymap.set('n', '<c-;>', '<esc>') -- non
   vim.keymap.set('n', '<c-,>', '<esc>') -- non ?
   vim.keymap.set('n', '<c-.>', '<esc>') -- non ?
   vim.keymap.set('n', '<c-/>', '<esc>') -- non ?
   vim.keymap.set('n', '<c-_>', '<esc>')
   vim.keymap.set('n', '<c-[>', '<esc>')
   vim.keymap.set('n', '<c-]>', '<esc>')

   vim.keymap.set('n', '<c-\\>', '<esc>')
   
   vim.keymap.set('n', '<c-a>', '<esc>')
   vim.keymap.set('n', '<c-b>', '<esc>')
   vim.keymap.set('n', '<c-c>', '<esc>')
   vim.keymap.set('n', '<c-d>', '<esc>')
   vim.keymap.set('n', '<c-e>', '<esc>')
   vim.keymap.set('n', '<c-f>', '<esc>')
   vim.keymap.set('n', '<c-g>', '<esc>')
   vim.keymap.set('n', '<c-h>', '<esc>')
   vim.keymap.set('n', '<c-i>', '<esc>') -- tab
   vim.keymap.set('n', '<c-l>', '<esc>')
   vim.keymap.set('n', '<c-m>', '<esc>')
   vim.keymap.set('n', '<c-n>', '<esc>')
   vim.keymap.set('n', '<c-o>', '<esc>')
   vim.keymap.set('n', '<c-p>', '<esc>')
   vim.keymap.set('n', '<c-q>', '<esc>')
   vim.keymap.set('n', '<c-r>', '<esc>')
   vim.keymap.set('n', '<c-s>', '<esc>')
   vim.keymap.set('n', '<c-t>', '<esc>')
   vim.keymap.set('n', '<c-u>', '<esc>')
   vim.keymap.set('n', '<c-v>', '<esc>')
   vim.keymap.set('n', '<c-w>', '<esc>')
   vim.keymap.set('n', '<c-x>', '<esc>')
   vim.keymap.set('n', '<c-y>', '<esc>')
   vim.keymap.set('n', '<c-z>', '<esc>')

   vim.keymap.set('n', 'ga', '<esc>')
   vim.keymap.set('n', 'gb', '<esc>')
   vim.keymap.set('n', 'gd', '<esc>')
   vim.keymap.set('n', 'ge', '<esc>')
   vim.keymap.set('n', 'gf', '<esc>')
   vim.keymap.set('n', 'gg', '<esc>')
   vim.keymap.set('n', 'gh', '<esc>')
   vim.keymap.set('n', 'gi', '<esc>')
   vim.keymap.set('n', 'gj', '<esc>')
   vim.keymap.set('n', 'gk', '<esc>')
   vim.keymap.set('n', 'gl', '<esc>')
   vim.keymap.set('n', 'gm', '<esc>')
   vim.keymap.set('n', 'gn', '<esc>')
   vim.keymap.set('n', 'go', '<esc>')
   vim.keymap.set('n', 'gp', '<esc>')
   vim.keymap.set('n', 'gs', '<esc>')
   vim.keymap.set('n', 'gt', '<esc>')
   vim.keymap.set('n', 'gu', '<esc>')
   vim.keymap.set('n', 'gv', '<esc>')
   vim.keymap.set('n', 'gw', '<esc>')
   vim.keymap.set('n', 'gy', '<esc>')
   
   vim.keymap.set('n', 'ra', '<esc>')
   --                   :
   vim.keymap.set('n', 're', '<esc>')
   vim.keymap.set('n', 'rf', '<esc>')
   --                   :
   vim.keymap.set('n', 'rh', '<esc>')
   vim.keymap.set('n', 'ri', '<esc>')
   vim.keymap.set('n', 'rj', '<esc>')
   vim.keymap.set('n', 'rk', '<esc>')
   --                   :
   vim.keymap.set('n', 'rn', '<esc>')
   vim.keymap.set('n', 'ro', '<esc>')
   vim.keymap.set('n', 'rp', '<esc>')
   vim.keymap.set('n', 'rq', '<esc>')
   vim.keymap.set('n', 'rr', '<esc>')
   --                   :
   vim.keymap.set('n', 'ru', '<esc>')
   vim.keymap.set('n', 'rv', '<esc>')
   --                   :
   vim.keymap.set('n', 'rz', '<esc>')

   vim.keymap.set('n', 'Rj', '<esc>')
   vim.keymap.set('n', 'Rk', '<esc>')

   vim.keymap.set('n', 'xx', '<esc>')

   vim.keymap.set('n', ':a', ':a')
   vim.keymap.set('n', ':b', ':b')
   vim.keymap.set('n', ':c', ':c')
   vim.keymap.set('n', ':d', ':d')
   vim.keymap.set('n', ':e', ':e')
   vim.keymap.set('n', ':f', ':f')
   vim.keymap.set('n', ':g', ':g')
   vim.keymap.set('n', ':h', ':h')
   --                    :
   vim.keymap.set('n', ':k', ':k')
   --                    :
   vim.keymap.set('n', ':p', ':p')
   vim.keymap.set('n', ':q', ':q')
   vim.keymap.set('n', ':r', ':r')
   vim.keymap.set('n', ':s', ':s')
   --                    :
   vim.keymap.set('n', ':u', ':u')
   --                    :
   vim.keymap.set('n', ':z', ':z')

   vim.keymap.set('n', '<leader>:', '<esc>')
   vim.keymap.set('n', '<leader>a', '<esc>')
   vim.keymap.set('n', '<leader>b', '<esc>')
   vim.keymap.set('n', '<leader>c', '<esc>')
   vim.keymap.set('n', '<leader>d', '<esc>')
   vim.keymap.set('n', '<leader>e', '<esc>')
   vim.keymap.set('n', '<leader>f', '<esc>')
   vim.keymap.set('n', '<leader>g', '<esc>')
   vim.keymap.set('n', '<leader>h', '<esc>')
   vim.keymap.set('n', '<leader>j', '<esc>')
   vim.keymap.set('n', '<leader>l', '<esc>')
   vim.keymap.set('n', '<leader>m', '<esc>')
   vim.keymap.set('n', '<leader>n', '<esc>')
   vim.keymap.set('n', '<leader>o', '<esc>')
   vim.keymap.set('n', '<leader>p', '<esc>')
   vim.keymap.set('n', '<leader>r', '<esc>')
   vim.keymap.set('n', '<leader>s', '<esc>')
   vim.keymap.set('n', '<leader>t', '<esc>')
   vim.keymap.set('n', '<leader>u', '<esc>')
   vim.keymap.set('n', '<leader>v', '<esc>')
   vim.keymap.set('n', '<leader>w', '<esc>')
   vim.keymap.set('n', '<leader>y', '<esc>')
   
   vim.keymap.set('n', '<leader>L', '<esc>')
   vim.keymap.set('n', '<leader>M', '<esc>')
   vim.keymap.set('n', '<leader>O', '<esc>')

-- mode normal esc end


-- quit buffer
   vim.keymap.set('n', 'w',  vim.fn.Buf__quit_swtch)

-- quit buffer force
   vim.keymap.set('n', ':q', ':q!')

-- quit vim
   vim.keymap.set('n', 'W', ':q<cr>')

-- quit tab other
-- vim.keymap.set('n', 'xx', ':tabo<cr>')

-- background job
-- vim.keymap.set('n', '<c-z>', '<c-z>')

-- save
   vim.keymap.set('n', 'a', ':call Save()<cr>')

-- load re slf
-- vim.keymap.set('n', 'xx', ':call Load_re()')

-- load re init vim
   vim.keymap.set('n', ':v', ':source ~/wrk/prj-pri/dotfiles/nvim/scrpt/dflt/init.vim')

-- 
-- opn
-- 

-- opn tab file
   vim.keymap.set('n', ':o', ':Opn ')

-- opn latest
-- vim.keymap.set('n', 'xx', '`0')

-- opn file srch  ( fzf )
   vim.keymap.set('n', '<leader>l', ':call Fzf_file()<cr>')

-- opn file hstry ( fzf )
   vim.keymap.set('n', '<leader>h', ':FzfFileHstry<cr>')

-- 
-- opn etc
-- 

-- opn fish cnf
-- vim.keymap.set('n', 'gf', ':call Opn_fish_cnf()<cr>')

-- opn init vim
   vim.keymap.set('n', 'gh', ':call Opn_init_vim()<cr>')
   vim.keymap.set('n', 'gl', ':call Opn_init_vim_l()<cr>')

-- opn tmp file
-- vim.keymap.set('n', 'xx', ':call Opn_tmp_file()<cr>')

-- opn grep work
-- vim.keymap.set('n', 'xx', ':call Opn_grep_wk()<cr>')

-- opn memo
-- vim.keymap.set('n', 'xx', ':call Opn_memo()<cr>')

-- opn man
-- vim.keymap.set('n', 'xx', ':OpnMan ')

-- opn app
   vim.keymap.set('n', 'go', ':call Opn_app_by_cursor_path()<cr>')

-- opn app slf
-- vim.keymap.set('n', 'xx', ':call Opn_app_buf_file()<cr>')

-- opn dir slf
   vim.keymap.set('n', 'gd', ':call Opn_buf_file_dir()<cr>')

-- opn brwsr
-- vim.keymap.set('n', 'xx', ':call Opn_brwsr()<cr>')

-- opn ggl srch
   vim.keymap.set('n', 'ggl', ':call Opn_ggl_srch("")<cr>')

-- 
-- cursor mv
-- 

-- cursor mv drct
   vim.keymap.set('n', '<Right>', 'l')
   vim.keymap.set('n', '<Left>' , 'h')
   vim.keymap.set('n', '<Up>'   , 'k')
   vim.keymap.set('n', '<Down>' , 'j')

-- cursor mv line
   vim.keymap.set('n', 'k', ':call Cursor__mv_u()<cr>')
   vim.keymap.set('n', 'j', ':call Cursor__mv_d()<cr>')

-- cursor mv line mlt
   vim.keymap.set('n', '<c-k>', ':call Cursor__mv_mlt_u()<cr>')
   vim.keymap.set('n', '<c-j>', ':call Cursor__mv_mlt_d()<cr>')

-- cursor mv line top | ins line
   vim.keymap.set('n', 'y', ':call Cursor__mv_line_top_or_new_line()<cr>')

-- cursor mv line top
   vim.keymap.set('n', '<c-a>', '0')

-- cursor mv line end
   vim.keymap.set('n', '<c-y>', function()
     return vim.fn.Is_cursor_col__line_end() and
       ':call Cursor__ins_markdown_cr()<cr>' or
       ':call Cursor__mv_line_end()<cr>'
   end, {expr = true})

-- cursor mv char - forward
   vim.keymap.set('n', 'l', 'l')

-- cursor mv char - back
   vim.keymap.set('n', '<c-o>', 'h')

-- cursor mv word - forward
   vim.keymap.set('n', 'f', ':call Cursor__mv_word_f()<cr>')

-- cursor mv word - back
   vim.keymap.set('n', 'o', ':call Cursor__mv_word_b()<cr>')

-- cursor mv word - back pre
-- vim.keymap.set('n', 'xx', ':call Cursor__mv_word_b_pre()<cr>')

-- cursor mv word dlm _ forward
   vim.keymap.set('n', '_', 'f_l')

-- cursor mv word dlm _ back
   vim.keymap.set('n', '<c-_>', 'hT_')
   vim.keymap.set('n', '\\', 'T_h')
   vim.keymap.set('n', '<bar>', 'T_h')
-- vim.keymap.set('n', '<c-\\>', 'T_h')

-- cursor mv word dlm ( camel or _ )  -  forward
   vim.keymap.set('n', 'F', ':call Cursor__mv_word_dlm_f()<cr>')

-- cursor mv fnc name
   vim.keymap.set('n', '<c-f>', ':call Cursor__mv_fnc_name()<cr>')

-- cursor mv bracket pair
   vim.keymap.set('n', '<c-l>', '%')

-- cursor mv bracket out back
-- vim.keymap.set('n', 'xx', '[{')

-- cursor mv bracket fnc back
-- vim.keymap.set('n', 'xx', '[m')

-- cursor mv indnt auto
-- vim.keymap.set('n', 'xx', ':call Cursor__mv_indnt_auto()<cr>')

-- cursor mv file edge bgn
   vim.keymap.set('n', 'gk', ':call Cursor__mv_file_edge_bgn()<cr>')

-- cursor mv file edge end
   vim.keymap.set('n', 'gj', ':call Cursor__mv_file_edge_end()<cr>')

-- cursor mv edit latest
-- vim.keymap.set('n', 'xx', '`.')

-- cursor mv jmp
   vim.keymap.set('n', 'rk', ':call Cursor__mv_v_jmp("k")<cr>')
   vim.keymap.set('n', 'rj', ':call Cursor__mv_v_jmp("j")<cr>')

   vim.keymap.set('n', 'r<space>k', ':call Cursor__mv_v_jmp_char("k", "f")<cr>')
   vim.keymap.set('n', 'r<space>j', ':call Cursor__mv_v_jmp_char("j", "f")<cr>')

-- scroll
   vim.keymap.set('n', 'K'     , '<c-y>')
   vim.keymap.set('n', 'J'     , '<c-e>')
   vim.keymap.set('n', '<up>'  , '<c-y>')
   vim.keymap.set('n', '<down>', '<c-e>')

-- scroll cursor line upper
-- vim.keymap.set('n', 'xx', 'zt')

-- scroll cursor line middle
-- vim.keymap.set('n', 'xx', 'zz')

-- 
-- slct / slctd / ynk / paste
-- 

-- slct
-- vim.keymap.set('n', 'I', 'v')

-- slctd __ word
   vim.keymap.set('n', 'i', ':call Slctd_str__word()<cr>')

-- slctd __ word by under score

-- todo dev ??
-- vim.keymap.set('n', '<c-_>', ':call Slctd__word_by_under_score()<cr>')
-- " nnoremap <c-_> f_l
-- " hT_  ???

-- slctd __ char current - word end
   vim.keymap.set('n', 'I', 've')

-- slct visual box
   vim.keymap.set('n', 'v', '<c-v>')

-- slct all
-- vim.keymap.set('n', 'xx', ':call Ynk__line_all()<cr>')

-- slct re
   vim.keymap.set('n', 'rr', ':call Slct_re()<cr>')

-- ynk clr
   vim.keymap.set('n', '<c-c>', ':call Ynk__clr()<cr>')

-- ynk line
   vim.keymap.set('n', 'c', ':call Ynk__line()<cr>')

-- ynk char
-- vim.keymap.set('n', 'xx', '"ayl')

-- ynk slf path
   vim.keymap.set('n', 'gs', ':call Ynk__buf_file_path()<cr>')

-- paste
   vim.keymap.set('n', 'p', ':call Cursor__ins_ynk()<cr>')

-- paste clp
   vim.keymap.set('n', 'P', ':call Cursor__ins_clp()<cr>')

-- paste rgstr history ( fzf )
   vim.keymap.set('n', '<leader>r', ':FzfRgstr<cr>')

-- undo
   vim.keymap.set('n', 'h'    , 'u'    )

-- redo
   vim.keymap.set('n', '<c-h>', '<c-r>')

-- undo history clr
   vim.keymap.set('n', ':h', ':call Undo__clr()')
   vim.keymap.set('n', 'H' , ':call Undo__clr()')

-- repeat
-- vim.keymap.set('n', 'xx', '.')

-- macro rec start / end
   vim.keymap.set('n', '`', 'q')
   -- and press a
   -- dev anchor
   --   expr fn.reg_recording()
-- macro ply
   vim.keymap.set('n', '@', '1@a')

-- 
-- edit
-- 

-- mode ch ins
   vim.keymap.set('n', '<space>', 'i')

-- mode ch ins rpl
-- vim.keymap.set('n', 'xx', 'R')

-- ins cr
   vim.keymap.set('n', 'm', ':call Cursor__ins_cr()<cr>')

-- ins space
   vim.keymap.set('n', 'L', ':call Cursor__ins_space(v:false)<cr>')

-- ins equal
   vim.keymap.set('n', '2', 'i=<esc>')

-- ins period
   vim.keymap.set('n', '.', 'i.<esc>')

-- ins comma
   vim.keymap.set('n', ',', 'i, <esc>l')

-- ins comma $, nxt line
-- vim.keymap.set('n', 'xx', 'A,<esc>j')

-- ins hyphen
   vim.keymap.set('n', '0', ':call Cursor__ins_hyphen()<cr>')

-- ins quote
   vim.keymap.set('n', '<c-s>', ':call Cursor__ins_quote()<cr>')

-- ins date
   vim.keymap.set('n', '*', ':call Cursor__ins_da()<cr>')

-- ins date time
   vim.keymap.set('n', ';', ':call Cursor__ins_dt()<cr>')

-- ins day of week
-- vim.keymap.set('n', 'xx', ':call Cursor__ins_week()<cr>')

-- ins slf path
-- vim.keymap.set('n', 'xx', ':call Cursor__ins_line_buf_file_path()<cr>')

-- ins anchor
   vim.keymap.set('n', 'A', ':call Cursor__ins_line_anchor()<cr>')

-- ins markdown code
   vim.keymap.set('n', '<c-u>', ':call Cursor__ins_markdown_code()<cr>')

-- ins markdown itm
   vim.keymap.set('n', 'O', function()
     return vim.fn.Is_file_type__('markdown') and
       ':call Cursor__ins_markdown_itm()<cr>' or
       ':call Cursor_line_indnt__shft_r()<cr>'
   end, {expr = true})

-- ins dots ( or crnt )
   vim.keymap.set('n', 'ru', ':call Cursor_line_end__dots_adjst()<cr>')

-- ins line emp
-- " ref nnoremap y

-- ins comment mlt
   vim.keymap.set('n', '$', ':call Cursor__ins_cmnt_mlt()<cr>')

-- ins comment 1
   vim.keymap.set('n', '!', function()
     return vim.fn.Is_file_type__('markdown') and
       ':call Cursor__ins_markdown_h()<cr>' or
       ':call Cursor__ins_cmnt_1("^")<cr>'
   end, {expr = true})

   vim.keymap.set('n', '1', function()
     return vim.fn.Is_file_type__('markdown') and
       ':call Cursor__ins_markdown_h()<cr>' or
       ':call Cursor__ins_cmnt_1("^")<cr>'
   end, {expr = true})

-- ins __ line indnt space
   vim.keymap.set('n', 'V', ':call Cursor_d__ins_line_space()<cr>')

-- cahr rpl, under score
-- vim.keymap.set('n', '<bar>', ':call Cursor_char__rpl_underscore()<cr>')

-- tgl markdown chk
-- vim.keymap.set('n', 'xx', ':call Char_markdown_chk__tgl()<cr>')

-- del char
   vim.keymap.set('n', 's', ':call Cursor_c_char__del()<cr>')

-- del char ynk
-- vim.keymap.set('n', 'xx', ':call Cursor_c_char__del_ynk()<cr>')

-- line del
   vim.keymap.set('n', 'd', ':call Cursor_line__del()<cr>')

-- line forward del
   vim.keymap.set('n', '<c-d>', 'D')

-- word back    del
-- vim.keymap.set('n', 'xx', 'hvbd')

-- word forward del
-- vim.keymap.set('n', 'xx', function()
--   return vim.fn.Is_cursor_col__line_end() and
--     '<esc>' or
--     '"zdw'
-- end, {expr = true})

-- vim.keymap.set('n', 'xx', function()
--   return vim.fn.Is_cursor_col__line_end() and
--     '<esc>' or
--     '"zde'
-- end, {expr = true})

-- del cr ( line join )
   vim.keymap.set('n', '<c-m>'  , 'J')
   vim.keymap.set('n', '<enter>', 'J')

-- line mv up
-- vim.keymap.set('n', 'xx', '"addk"aP')

-- line dpl  -- todo fnc cre
   vim.keymap.set('n', 'D', '"zyy"zP')

-- repeat memory
-- vim.keymap.set('n', 'xx', 'qy')
-- vim.keymap.set('n', 'xx', '@y')

-- char tgl 01 ( ?? / num icl  )
   vim.keymap.set('n', 'u', ':call N_char__tgl_swtch01()<cr>')

-- char tgl 02 ( type ch / num dcl )
   vim.keymap.set('n', 'U', ':call N_char__tgl_swtch02()<cr>')

-- indnt shft
   vim.keymap.set('n', 'ri', ':call Cursor_line_indnt__shft_l()<cr>')
   vim.keymap.set('n', 'ro', ':call Cursor_line_indnt__shft_r()<cr>')

-- indnt add
-- vim.keymap.set('n', 'xx', ':call Cursor_line_indnt__add(2)<cr>')

-- indnt crct
   vim.keymap.set('n', 're', ':call Cursor_line_indnt__crct()<cr>')

-- cursor l char col __ crct
   vim.keymap.set('n', 'q', ':call Cursor_f_str__crct_by_line_u()<cr>')
   vim.keymap.set('n', 'Q', ':call Cursor_f_str__crct_by_line_d()<cr>')

-- 
-- srch
-- 

-- srch hl init
   vim.keymap.set('n', 'S', '/<cr>N')
-- vim.keymap.set('n', 'xx', ':call Srch_init()<cr>')

-- srch char in line - forward
-- vim.keymap.set('n', 'xx', 'f')

-- srch char in line repeat
-- vim.keymap.set('n', 'xx', ';')

-- srch by cmd
   vim.keymap.set('n', '<leader>k', '/')

-- srch by cmd word
   vim.keymap.set('n', '<leader>K', '/\\<\\><left><left>')

-- srch word or
-- vim.keymap.set('n', 'xx', 'Xxx')

-- srch forward
   vim.keymap.set('n', 'n', ':call Cursor__mv_srch("f")<cr>')

-- srch back
   vim.keymap.set('n', '<c-n>', ':call Cursor__mv_srch("b")<cr>')

-- srch, cursor mv nxt char
-- vim.keymap.set('n', 'xx', ':call Srch_7_cursor__mv_nxt('f')<cr>')

-- srch str set
   vim.keymap.set('n', 'e', ':call Srch_str__cursor_word()<cr>')

-- srch str set ( word 1 )
   vim.keymap.set('n', 'E', ':call Srch_str__word1_tgl()<cr>')

-- srch char bracket forward
-- vim.keymap.set('n', 'xx', ':call Srch_char_bracket('f')<cr>')

-- srch markdown h
   vim.keymap.set('n', 'M', ':call Srch_str__markdown_h()<cr>')

-- srch str history ( fzf )
   vim.keymap.set('n', '<leader>n', ':FzfSrchHstry<cr>')
   vim.keymap.set('n', '<leader>f', ':FzfSrchHstry<cr>')

-- srch str set prv ( tgl )
   vim.keymap.set('n', 'N', ':call Srch_str__prv_tgl()<cr>')

-- srch rpl one > ynk nxt ( only srch )
   vim.keymap.set('n', '<c-p>', ':call Srch_slct("f")<cr>')

-- srch ?=ts
-- vim.keymap.set('n', 'xx', '/?ts=<cr>')

-- rpl ( cmd )
   vim.keymap.set('n', ':s', ':%s///g')
-- vim.keymap.set('n', ':s', ':Rpl ')

-- fzf rg
   vim.keymap.set('n', '<leader>o', ':call Fzf_rg(v:null)<cr>')

-- fzf rg fltr ext
   vim.keymap.set('n', '<leader>O', ':FzfRgExt js')

-- fzf rg with run
-- vim.keymap.set('n', '<leader>O', ':FzfRgWithRun <cr>')

-- fzf buf
   vim.keymap.set('n', '<leader>i', ':call N_fzf_buf()<cr>')

-- fzf jmplst
   vim.keymap.set('n', '<leader>e', ':FzfJmplst<cr>')

-- fzf pth lst
-- vim.keymap.set('n', '<leader>xx', ':FzfTagjmpByFile <cr>')

-- tag jmp tab new
   vim.keymap.set('n', 't', ':call Tag_jmp_by_cursor_line()<cr>')

-- 
-- cmd
-- 

-- cmd history ( fzf )
   vim.keymap.set('n', '<leader>j', ':FzfCmdHstry<cr>')

-- sys cmd
   vim.keymap.set('n', ':!', ':!')
   vim.keymap.set('n', ':1', ':!')

-- ins sys cmd ( read )
   vim.keymap.set('n', ':r', ':InsSysCmd')

-- pth
   vim.keymap.set('n', ':p', ':Pth <cr>')

-- cd slf
-- vim.keymap.set('n', ':d', ':call Dir__buf_file_dir()')

-- cd parent
   vim.keymap.set('n', ':k', ':K')

-- fzf cd
   vim.keymap.set('n', '<leader>y', ':call Fzf_dir()<cr>')

-- fzf cd ( dir jmp )
   vim.keymap.set('n', '<leader>d', ':call Fzf_dir_jmp()<cr>')

-- fzf doc memo
   vim.keymap.set('n', '<leader>m', ':call Fzf_doc_memo_opn()<cr>')

-- fzf vim fnc call
   vim.keymap.set('n', '<leader>c', ':call Fzf_vim_fnc_call()<cr>')

-- fzf doc tech
   vim.keymap.set('n', '<leader>t', ':call Fzf_doc_tech()<cr>')

-- 
-- tab
-- 

-- tab mv
   vim.keymap.set('n', '<tab>'  , 'gt')
   vim.keymap.set('n', '<s-tab>', 'gT')

-- tab order
   vim.keymap.set('n', '<s-left>' , ':tabm-1<cr>')
   vim.keymap.set('n', '<s-right>', ':tabm+1<cr>')

-- 
-- buf
-- 

-- buf list
-- vim.keymap.set('n', ':xx', ':buffers')

-- buf fltr
   vim.keymap.set('n', ':f', ':%! jq')
-- vim.keymap.set('n', 'xx', ':call Buf__fltr()<cr>') -- use not

-- 
-- win ( buf )
-- 

-- win ( buf ) splt quit
-- vim.keymap.set('n', 'rq', ':call Win_splt__quit()<cr>')

-- win ( buf ) splt h
   vim.keymap.set('n', 'rh', ':call Win__splt_h()<cr>')

-- win ( buf ) splt v
   vim.keymap.set('n', 'rn', ':call Win__splt_v()<cr>')
   vim.keymap.set('n', 'rv', ':call Win__splt_v()<cr>')

-- win ( buf ) nxt
   vim.keymap.set('n', '<c-w>', ':call Win_splt_cursor__mv_nxt()<cr>')

-- win ( buf ) mv r
-- vim.keymap.set('n', 'xx', '<c-w>l')

-- win ( buf ) mv l
-- vim.keymap.set('n', 'xx', '<c-w>h')

-- fnc call
   vim.keymap.set('n', ':c', ':call ')

-- term launch
-- vim.keymap.set('n', 'xx', ':Term ')

-- 
-- setting ( set )
-- 

-- setting  -  line view wrap tgl
   vim.keymap.set('n', ':w', ':set wrap!')

-- setting  -  line num view tgl
   vim.keymap.set('n', ':N', ':set number!')

-- setting  -  line num rel tgl
   vim.keymap.set('n', ':n', ':set relativenumber!')

-- inf

-- inf char
-- vim.keymap.set('n', 'xx', 'ga')

-- numpad shift
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

-- vim.keymap.set('v', '<space>', '<nop>')

-- mode visual nop end

-- mode visual esc
   vim.keymap.set('v', '<tab>', '<esc>')
   vim.keymap.set('v', '<bar>', '<esc>')

   vim.keymap.set('v', '@', '<esc>')
   vim.keymap.set('v', '*', '<esc>')
   vim.keymap.set('v', '/', '<esc>')
   vim.keymap.set('v', '!', '<esc>')
   vim.keymap.set('v', '"', '<esc>')
   vim.keymap.set('v', '#', '<esc>')
   vim.keymap.set('v', '$', '<esc>')
   vim.keymap.set('v', '%', '<esc>')  -- ?
   vim.keymap.set('v', '&', '<esc>')
   vim.keymap.set('v', '_', '<esc>')
   vim.keymap.set('v', '?', '<esc>')
   vim.keymap.set('v', '(', '<esc>')
   vim.keymap.set('v', ';', '<esc>')
   vim.keymap.set('v', '<', '<esc>')
   vim.keymap.set('v', '>', '<esc>')
   vim.keymap.set('v', '=', '<esc>')
   vim.keymap.set('v', '-', '<esc>')
   vim.keymap.set('v', '+', '<esc>')
   vim.keymap.set('v', ',', '<esc>')
   vim.keymap.set('v', '.', '<esc>')
   vim.keymap.set('v', '~', '<esc>')

   vim.keymap.set('v', '\\', '<esc>')

   vim.keymap.set('v', 'a', '<esc>')
   vim.keymap.set('v', 'b', '<esc>')
   vim.keymap.set('v', 'c', '<esc>')
   vim.keymap.set('v', 'd', '<esc>')
   vim.keymap.set('v', 'e', '<esc>')
   vim.keymap.set('v', 'f', '<esc>')
   vim.keymap.set('v', 'g', '<esc>')
   vim.keymap.set('v', 'h', '<esc>')
   vim.keymap.set('v', 'i', '<esc>')
   vim.keymap.set('v', 'l', '<esc>')
   vim.keymap.set('v', 'm', '<esc>')
   vim.keymap.set('v', 'n', '<esc>')
   vim.keymap.set('v', 'o', '<esc>')
   vim.keymap.set('v', 'p', '<esc>')
   vim.keymap.set('v', 'q', '<esc>')
   vim.keymap.set('v', 'r', '<esc>')
   vim.keymap.set('v', 's', '<esc>')
   vim.keymap.set('v', 't', '<esc>')
   vim.keymap.set('v', 'u', '<esc>')
   vim.keymap.set('v', 'v', '<esc>')
   vim.keymap.set('v', 'w', '<esc>')
   vim.keymap.set('v', 'x', '<esc>')
   vim.keymap.set('v', 'y', '<esc>')

   vim.keymap.set('v', 'A', '<esc>')
   vim.keymap.set('v', 'B', '<esc>')
   vim.keymap.set('v', 'C', '<esc>')
   vim.keymap.set('v', 'D', '<esc>')
   vim.keymap.set('v', 'E', '<esc>')
   vim.keymap.set('v', 'F', '<esc>')
   vim.keymap.set('v', 'H', '<esc>')
   vim.keymap.set('v', 'I', '<esc>')
   vim.keymap.set('v', 'J', '<esc>')
   vim.keymap.set('v', 'K', '<esc>')
   vim.keymap.set('v', 'L', '<esc>')
   vim.keymap.set('v', 'M', '<esc>')
   vim.keymap.set('v', 'N', '<esc>')
   vim.keymap.set('v', 'O', '<esc>')
   vim.keymap.set('v', 'P', '<esc>')
   vim.keymap.set('v', 'Q', '<esc>')
   vim.keymap.set('v', 'R', '<esc>')
   vim.keymap.set('v', 'S', '<esc>')
   vim.keymap.set('v', 'T', '<esc>')
   vim.keymap.set('v', 'U', '<esc>')
   vim.keymap.set('v', 'V', '<esc>')
   vim.keymap.set('v', 'W', '<esc>')
   vim.keymap.set('v', 'X', '<esc>')
   vim.keymap.set('v', 'Y', '<esc>')

   vim.keymap.set('v', '<c-_>', '<esc>')

   vim.keymap.set('v', '<c-\\>', '<esc>')

   vim.keymap.set('v', '<c-a>', '<esc>')
   vim.keymap.set('v', '<c-b>', '<esc>')
   vim.keymap.set('v', '<c-c>', '<esc>')
   vim.keymap.set('v', '<c-d>', '<esc>')
   vim.keymap.set('v', '<c-e>', '<esc>')
   vim.keymap.set('v', '<c-f>', '<esc>')
   vim.keymap.set('v', '<c-h>', '<esc>')
   vim.keymap.set('v', '<c-i>', '<esc>')
   vim.keymap.set('v', '<c-l>', '<esc>')
   vim.keymap.set('v', '<c-m>', '<esc>')
   vim.keymap.set('v', '<c-n>', '<esc>')
   vim.keymap.set('v', '<c-o>', '<esc>')
   vim.keymap.set('v', '<c-p>', '<esc>')
   vim.keymap.set('v', '<c-q>', '<esc>')
   vim.keymap.set('v', '<c-r>', '<esc>')
   vim.keymap.set('v', '<c-s>', '<esc>')
   vim.keymap.set('v', '<c-u>', '<esc>')
   vim.keymap.set('v', '<c-v>', '<esc>')
   vim.keymap.set('v', '<c-w>', '<esc>')
   vim.keymap.set('v', '<c-x>', '<esc>')
   vim.keymap.set('v', '<c-y>', '<esc>')

   vim.keymap.set('v', 'gb', '<esc>')
   vim.keymap.set('v', 'gg', '<esc>')
   vim.keymap.set('v', 'gh', '<esc>')
   vim.keymap.set('v', 'gi', '<esc>')
   vim.keymap.set('v', 'gj', '<esc>')
   vim.keymap.set('v', 'gk', '<esc>')
   vim.keymap.set('v', 'go', '<esc>')
   vim.keymap.set('v', 'gp', '<esc>')
   vim.keymap.set('v', 'gs', '<esc>')
   vim.keymap.set('v', 'gt', '<esc>')
   vim.keymap.set('v', 'gy', '<esc>')
   
   vim.keymap.set('v', ':a', '<esc>')
   vim.keymap.set('v', ':f', '<esc>')
   --                    :
   vim.keymap.set('v', ':m', '<esc>')
   --                    :
   vim.keymap.set('v', ':t', '<esc>')
   --                    :
   vim.keymap.set('v', ':z', '<esc>')

   -- leader esc

   vim.keymap.set('v', '<leader>:', '<esc>')
   vim.keymap.set('v', '<leader>l', '<esc>')
   vim.keymap.set('v', '<leader>u', '<esc>')
   vim.keymap.set('v', '<leader>y', '<esc>')

-- mode visual esc end

-- ojroques/nvim-osc52
   vim.keymap.set('v', 'C', require('osc52').copy_visual)

-- mode ch line
   vim.keymap.set('v', 'i', 'V')

-- mode ch visual box
   vim.keymap.set('v', 'v', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd_box_width__1()<cr>' or
       '<c-v>'
   end, {expr = true})

-- file srch ( fzf )
-- vim.keymap.set('v', '<leader>xx', '"zy:FzfFile <c-r>z')

-- 
-- cursor mv
-- 

-- cursor mv slctd edge tgl
   vim.keymap.set('v', 'y', ':call Cursor__mv_slctd_edge_tgl()<cr>')

-- cursor mv slctd edge tgl, v box line same
   vim.keymap.set('v', 'O', 'O')

-- cursor mv char forward
   vim.keymap.set('v', 'l', 'l')

-- cursor mv char back
   vim.keymap.set('v', '<c-o>', 'h')

-- cursor mv word - back
-- vim.keymap.set('v', 'xx', 'b')
-- vim.keymap.set('v', 'xx', 'bh')
-- vim.keymap.set('v', 'xx', 'Bh')

-- cursor mv line end
   vim.keymap.set('v', '<c-y>', ':call Slctd_cursor__mv_line_end()<cr>')

-- slctd __ reduce dlm _ r
   vim.keymap.set('v', '_', 'of_lo')
-- vim.keymap.set('v', 'h', 'of_lo')

-- slctd __ reduce dlm _ l
-- vim.keymap.set('v', 'h', 'F_h')
   vim.keymap.set('v', 'h', ':call Slctd_str__reduce_dlm_l("_")<cr>')
-- vim.keymap.set('v', 'H'    , 'F_h')
-- vim.keymap.set('v', '<c-_>', 'F_h')

-- cursor mv space - forward ( word pre )
-- vim.keymap.set('v', 'xx', 'wh')

-- cursor mv line
   vim.keymap.set('v', '<c-j>', '10j')
   vim.keymap.set('v', '<c-k>', '10k')

-- cursor mv jmp
   vim.keymap.set('v', 'rk', ':call Slctd_cursor__mv_v_jmp("k")<cr>')
   vim.keymap.set('v', 'rj', ':call Slctd_cursor__mv_v_jmp("j")<cr>')

-- cursor mv bracket pair
   vim.keymap.set('v', '<c-l>', '%')

-- cursor mv bracket out back
-- vim.keymap.set('v', 'xx', '[{')

-- cursor mv bracket fnc back
-- vim.keymap.set('v', 'xx', '[m')

-- cursor mv file edge back    ( file bgn )
   vim.keymap.set('v', 'gk', ':call Slctd_cursor__mv_file_edge("k")<cr>')

-- cursor mv file edge forward ( file end   )
   vim.keymap.set('v', 'gj', ':call Slctd_cursor__mv_file_edge("j")<cr>')

-- 
-- slct / ynk / paste
-- 

-- slctd expnd
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd()')

-- slctd expnd srch
   vim.keymap.set('v', 'N', ':call Slctd_str__expnd_srch()<cr>')

-- slctd expnd word forward
   vim.keymap.set('v', 'f', ':call Slctd_str__expnd_word_f()<cr>')

-- slctd expnd quote
   vim.keymap.set('v', '<tab>', ':call Slctd_str__expnd_quote_swtch()<cr>')
   vim.keymap.set('v', '<c-i>', ':call Slctd_str__expnd_quote_swtch()<cr>')

-- slctd expnd quote on
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd_quote_on_swtch()<cr>')

-- slctd expnd quote in
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd_quote_in_swtch()<cr>')

-- slctd expnd bracket forward
-- vim.keymap.set('v', 'xx', ':call Slctd_str__expnd_bracket_f()<cr>')

-- slct all
   vim.keymap.set('v', 'a', ':call Slctd_str__all()<cr>')

-- ynk slctd
   vim.keymap.set('v', 'o', ':call Ynk__slctd()<cr>')

-- ynk slctd add
-- vim.keymap.set('v', 'xx', ':call Ynk__add_slctd()<cr>')

-- clp slctd
-- vim.keymap.set('v', 'xx', '"+y')

-- paste
-- " todo refactoring
   vim.keymap.set('v', 'p', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd_box_edge_l__ynk_line_1()<cr>' or
       ':call Slctd_str__ynk()<cr>'
   end, {expr = true})

-- paste clp
-- vim.keymap.set('v', 'xx', ':call Slctd_str__clp()<cr>')

-- paste visual box
-- vim.keymap.set('v', 'xx', 'I<c-r>0<esc>')

-- 
-- edit
-- 

-- ins | cut & ins
   vim.keymap.set('v', '<space>', function()
     return vim.fn.Is_slctd_mode__box() and
       'I' or
       'c'
   end, {expr = true})

-- cut & ins
-- vim.keymap.set('v', '<leader><space>', '"zc')

-- ins $
   vim.keymap.set('v', 'Y', function()
     return vim.fn.Is_slctd_mode__box() and
       '$A' or
       '<c-v>$A'
   end, {expr = true})

-- ins space
   vim.keymap.set('v', 'L', function()
     return vim.fn.Is_slctd_mode__box() and
       'I <esc>gv' or
       '>gv'
   end, {expr = true})

-- line __ ins comment 1
   vim.keymap.set('v', '!', ':call V_ins_cmnt_1()<cr>')
   vim.keymap.set('v', '1', ':call V_ins_cmnt_1()<cr>')

-- line mlt __ ins comment
   vim.keymap.set('v', '&', ':call V_ins_cmnt_mlt()<cr>')
-- vim.keymap.set('v', '$', ':call V_ins_cmnt_mlt()<cr>')

-- line end __ ins comma
   vim.keymap.set('v', ',', ':call Curosr_line_end__ins(",")<cr>')

-- pad space
   vim.keymap.set('v', 'S', ':call Slctd__pad_space()<cr>')

-- pad -
   vim.keymap.set('v', '-', ':call Slctd__pad("-")<cr>')

-- pad |
   vim.keymap.set('v', '<bar>', ':call Slctd__pad_bar()<cr>')

-- slctd str space __ under score
   vim.keymap.set('v', 'q', ':call Slctd_str_space__underscore()<cr>')

-- line __ join per line
   vim.keymap.set('v', 'J', ':call Slctd_line__join_per_line(3)')

-- del str > ynk
   vim.keymap.set('v', 'd', function()
     return vim.fn.Is_slctd_mode__box() and
       '"ad:let @+ = @a<cr>gv' or
       '"ad:let @+ = @a<cr>'
   end, {expr = true})

-- vim.keymap.set('v', 'xx', ':call V_slctd__del()<cr>')

-- del str > ynk not
   vim.keymap.set('v', 's', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd__del()<cr>' or
       '"zx'
   end, {expr = true})

-- line mlt forward del
   vim.keymap.set('v', '<c-d>', 'D')

-- slctd line __ del line top space
-- vim.keymap.set('v', 'xx', ':call Slctd_line_top_space__del()<cr>')

-- slctd line __ del end space
   vim.keymap.set('v', 'm', ':call Slctd_line_end_space__del()<cr>')

-- slctd box __ del cursor f space
   vim.keymap.set('v', 'K', ':call Slctd_box_cursor_r_space__crct()<cr>')

-- slctd str edge out quote __ tgl
   vim.keymap.set('v', 'w', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd_box_width__1()<cr>' or
       ':call Slctd_str_edge_out_char__tgl()<cr>'
   end, {expr = true})

-- slctd str edge bracket __ tgl
-- vim.keymap.set('v', 'xx', ':call Slctd_str_edge_out_bracket__tgl()<cr>')

-- slctd str edge out __ tgl shft
   vim.keymap.set('v', 'W', ':call Slctd_str_edge_out__tgl_shft()<cr>')

-- slctd str edge out __ ins space
-- vim.keymap.set('v', '<c-s>', ':call Slctd_str_edge_out__ins(" ")<cr>')

-- slctd str edge out __ ins markdown strikethrough
   vim.keymap.set('v', '~', ':call Slctd_str_edge_out__ins_markdown_strikethrough()<cr>')

-- slctd str edge out __ ins markdown strikethrough
   vim.keymap.set('v', 'b', ':call Slctd_str_edge_out__ins_markdown_bold()<cr>')

-- slctd box str mv back
-- vim.keymap.set('v', 'xx', ':call Slctd_box_str__mv("l")<cr>')

-- slctd box str mv forward
-- vim.keymap.set('v', 'xx', ':call Slctd_box_str__mv("r")<cr>')

-- slctd box space __ del
   vim.keymap.set('v', 'D', ':call Slctd_box_space__del()<cr>')

-- slctd box mv back
   vim.keymap.set('v', '<c-w>', ':call Slctd_box__mv("l")<cr>')

-- slctd box mv forward
   vim.keymap.set('v', '<c-e>', ':call Slctd_box__mv("r")<cr>')

-- num icl
   vim.keymap.set('v', '+', '<c-a>gv')

-- num dcl
-- vim.keymap.set('v', '-', '<c-x>gv')

-- num seq
   vim.keymap.set('v', '*', 'r0gvg<c-a>gv')
   --                        ^^^^^^^^^^^^> r0 gv g<c-a> gv

-- indnt shft
--   slctd indnt __ shft l, r  -  todo dev,
-- vim.keymap.set('v', 'ri', ':call Slctd_indnt__shft_l()<cr>')
-- vim.keymap.set('v', 'ro', ':call Slctd_indnt__shft_r()<cr>')
   vim.keymap.set('v', 'ri', '<gv')
   vim.keymap.set('v', 'ro', '>gv')

-- indnt crct
   vim.keymap.set('v', ';', '=gv')

-- indnt tab   > space
   vim.keymap.set('v', ':e', ':call Slctd_line_indnt__space(2)')

-- indnt space > tab
-- vim.keymap.set('v', 'xx', ':call Slctd_line_indnt__tab(2)<cr>')

-- tidy tbl
   vim.keymap.set('v', ':t', ':call Slctd_line__crct_tbl()')

-- line end ovr, pad __ space
-- vim.keymap.set('v', 'xx', ':call Slctd_line_end__pad_space()')

-- upper / lower tgl
   vim.keymap.set('v', 'u', '~gv')

-- upper force
   vim.keymap.set('v', 'U', 'Ugv')

-- lower force
-- vim.keymap.set('v', 'xx', 'ugv')

-- str mb
   vim.keymap.set('v', ':m', ':call Slctd_line_mb__cnv()')

-- 
-- srch
-- 

-- srch cmd
   vim.keymap.set('v', '<leader>k', '"zy/<c-r>z')
-- vim.keymap.set('v', '<leader>i', '"zy/<c-r>z')

-- srch forward ( srch rpl skip )
   vim.keymap.set('v', '<c-n>', ':call Slctd_srch_7_slctd__srch_nxt("f")<cr>')

-- srch back
-- vim.keymap.set('v', 'xx', ':call Slctd_srch_7_slctd__srch_nxt('b')<cr>')

-- srch str set
   vim.keymap.set('v', 'n', ':call Slctd_srch__swtch()<cr>')
   vim.keymap.set('v', 'e', function()
     return vim.fn.Is_slctd_mode__box() and
       '<esc>' or
       ':call Srch_str__slctd_str()<cr>'
   end, {expr = true})

-- srch rpl one > ynk, nxt
   vim.keymap.set('v', '<c-p>', ':call Slctd__rpl_7_srch_nxt()<cr>')

-- rpl ( cmd )
   vim.keymap.set('v', ':s', function()
     return vim.fn.Is_slctd_mode__box() and
       ':VBoxRpl ' or
       ':s///g'
       -- ':sort'
       -- ':Rpl '
   end, {expr = true})

-- rpl cr ( add cr )
   vim.keymap.set('v', '<c-m>', ':call Slctd_line_srch_str__rpl_cr()<cr>')

-- v box edge char shft in
   vim.keymap.set('v', '<c-h>', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd_box_edge_r_char__shft_in()<cr>' or
       ''
   end, {expr = true})

   vim.keymap.set('v', '<c-s>', function()
     return vim.fn.Is_slctd_mode__box() and
       ':call Slctd_box_edge_r_char__shft_in()<cr>' or
       ':call Slctd_str_edge_out__ins(" ")<cr>'
   end, {expr = true})

-- fzf buf
   vim.keymap.set('v', '<leader>i', ':call V_fzf_buf()<cr>')

-- fzf rg
   vim.keymap.set('v', '<leader>o', '"zy:call Fzf_rg("<c-r>z")<cr>')

-- fzf rg word1
   vim.keymap.set('v', '<leader>O', '"zy:call Fzf_rg_word1("<c-r>z")<cr>')

-- tag jmp
-- vim.keymap.set('v', 't', ':call Tag_jmp_by_slctd_line()<cr>')

-- opn app
   vim.keymap.set('v', 'go', ':call Slctd_line_7_opn_app()<cr>')

-- opn brwsr
-- vim.keymap.set('v', 'gx', '<plug>(openbrowser-smart-search)')

-- opn ggl srch
   vim.keymap.set('v', 'ggl', ':call Slctd_str_7_opn_ggl_srch()<cr>')

-- opn youtube video_id
   vim.keymap.set('v', 'gy', ':call Slctd_str_7_opn_yt()<cr>')

-- trns
   vim.keymap.set('v', 'r', ':call Slctd_trns()<cr>')

-- 
-- cmd
-- 

-- cmd history ( fzf )
-- vim.keymap.set('v', '<leader>xx', ':FzfCmdHstry<cr>')

-- 
-- mode insert
-- 

-- mode insert esc / nop

   vim.keymap.set('i', '<leader>'  , '<esc>')
   vim.keymap.set('i', '<esc>'     , '<esc>')
   vim.keymap.set('i', '<esc><esc>', '<esc>')
   
   vim.keymap.set('i', '<tab>'    , '<nop>')
   vim.keymap.set('i', '<s-tab>'  , '<nop>')
   vim.keymap.set('i', '<c-tab>'  , '<nop>')
   vim.keymap.set('i', '<c-space>', '<nop>')
   vim.keymap.set('i', '<c-space>', '<nop>')  -- ?? todo research
   vim.keymap.set('i', '<c-space>', '<nop>')
   
   vim.keymap.set('i', '<c-_>', '<nop>')  -- non ?
   vim.keymap.set('i', '<c-^>', '<nop>')
   vim.keymap.set('i', '<c-->', '<nop>')
   vim.keymap.set('i', '<c-@>', '<nop>')  -- non
   vim.keymap.set('i', '<c-,>', '<nop>')  -- non
   vim.keymap.set('i', '<c-.>', '<nop>')  -- non
   vim.keymap.set('i', '<c-:>', '<nop>')  -- non
   vim.keymap.set('i', '<c-;>', '<nop>')  -- non

   vim.keymap.set('i', '<c-\\>', '<nop>')

   vim.keymap.set('i', '<c-a>', '<nop>')
   vim.keymap.set('i', '<c-b>', '<nop>')
   vim.keymap.set('i', '<c-f>', '<nop>')
   vim.keymap.set('i', '<c-g>', '<nop>')
   vim.keymap.set('i', '<c-i>', '<nop>')
   vim.keymap.set('i', '<c-k>', '<nop>')
   vim.keymap.set('i', '<c-n>', '<nop>')
   vim.keymap.set('i', '<c-o>', '<nop>')
   vim.keymap.set('i', '<c-p>', '<nop>')
   vim.keymap.set('i', '<c-q>', '<nop>')
   vim.keymap.set('i', '<c-r>', '<nop>')
   vim.keymap.set('i', '<c-s>', '<nop>')
   vim.keymap.set('i', '<c-t>', '<nop>')
   vim.keymap.set('i', '<c-u>', '<nop>')
   vim.keymap.set('i', '<c-y>', '<nop>')
   
   vim.keymap.set('i', '<leader>f', '<nop>')
   vim.keymap.set('i', '<leader>i', '<nop>')

-- esc / nop end

-- quit, esc
   vim.keymap.set('i', '<esc>', function()
     local ret
     if     vim.fn.pumvisible() == 1 then
       ret = '<c-e>'
     elseif vim.fn.Is_cursor_col__line_top0() then
       ret = '<esc>'
     else
       ret = '<esc>l'
     end
     return ret
   end, {expr = true})

   vim.keymap.set('i', '<c-c>', function()
     local ret
     if     vim.fn.pumvisible() == 1 then
       ret = '<c-e>'
     elseif vim.fn.Is_cursor_col__line_top0() then
       ret = '<esc>'
     else
       ret = '<esc>l'
     end
     return ret
   end, {expr = true})

-- cursor mv in line top
-- vim.keymap.set('i', '<c-a>', '<c-o>^')
-- vim.keymap.set('i', '<c-a>', '<c-o>0')

-- dev anchor  continue

-- cursor mv in line end
   vim.keymap.set('i', '<c-e>', '<c-o>$')

-- cursor mv char forward
   vim.keymap.set('i', '<c-l>', '<c-o>l')

-- cursor mv char back
   vim.keymap.set('i', '<c-s>', '<c-o>h')
   vim.keymap.set('i', '<c-o>', function()
     return vim.fn.pumvisible() == 1 and
       '<c-y>' or
       '<c-o>h'
   end, {expr = true})

-- cursor mv word forward
-- vim.keymap.set('i', 'xx', '<c-o>e<c-o>l')

-- cursor mv word back
-- vim.keymap.set('i', '<c-o>', function()
--   return vim.fn.pumvisible() == 1 and
--     '<c-y>' or
--     '<c-o>b'
-- end, {expr = true})

-- cursor mv d
-- vim.keymap.set('i', '<c-n>', '<c-o>j')

-- cursor mv u
-- vim.keymap.set('i', '<c-p>', '<c-o>k')

-- ins cr
   vim.keymap.set('i', '<c-m>', '<cr>')

-- ins tab
   vim.keymap.set('i', '<tab>', '<c-v><tab>')

-- ins cmplt default
   vim.keymap.set('i', '<leader>f', '<c-p>')
-- vim.keymap.set('i', '<c-y>', function()
--   return vim.fn.pumvisible() == 1 and
--     '<c-e>' or
--     '<c-n>'
-- end, {expr = true})

-- ins bracket
   vim.keymap.set('i', '<c-u>', function()
     return vim.fn.pumvisible() == 1 and
       '<c-n>' or
       '<c-r>=I_quote()<cr>'
   end, {expr = true})

-- ins quote
   vim.keymap.set('i', '<c-j>', function()
     return vim.fn.pumvisible() == 1 and
       '<c-n>' or
       '<c-r>=I_bracket()<cr>'
   end, {expr = true})

-- ins num
   vim.keymap.set('i', '<c-y>', '<c-r>=I_num()<cr>')
-- vim.keymap.set('i', '<leader>k', '<c-r>=I_num()<cr>')

-- ins symbol
   vim.keymap.set('i', '<c-n>', '<c-r>=I_symbol01()<cr>')
   vim.keymap.set('i', '<c-f>', '<c-r>=I_symbol02()<cr>')
   vim.keymap.set('i', '<c-p>', '<c-r>=I_symbol03()<cr>')

-- ins markdown
-- vim.keymap.set('i', '<c-u>', '<c-r>=I_markdown_lnk()<cr>')

-- ins todo status
-- vim.keymap.set('i', 'xx', '<c-r>=I_todo_status()<cr>')

-- ins week
-- vim.keymap.set('i', 'xx', '<c-r>=I_week()<cr>')

-- ins register
-- vim.keymap.set('i', 'xx', '<c-r>=I_reg()<cr>')

-- ins reserved word lua
-- vim.keymap.set('i', 'xx', '<c-r>=I_reserved_lua()<cr>')

-- ins bracket
-- vim.keymap.set('i', '<', '<><c-o>h')
-- vim.keymap.set('i', '(', '()<c-o>h')
-- vim.keymap.set('i', '{', '{}<c-o>h')
-- vim.keymap.set('i', '[', '[]<c-o>h')
-- vim.keymap.set('i', '"', '""<c-o>h')
-- vim.keymap.set('i', "'", "''<c-o>h")

-- del char forward
   vim.keymap.set('i', '<c-d>', '<c-o>x')

-- del char back
   vim.keymap.set('i', '<c-h>', '<c-h>')

-- del word back
   vim.keymap.set('i', '<c-w>', '<c-w>')

-- del word forword
   vim.keymap.set('i', '<c-k>', function()
     return vim.fn.pumvisible() == 1 and
       '<c-p>' or
       '<c-o>dw'
   end, {expr = true})

-- del line
-- " non

-- paste
-- vim.keymap.set('i', 'xx', '<c-r>0')

-- paste clp
   vim.keymap.set('i', '<c-v>', '<c-r><c-o>+')

-- clr
-- vim.keymap.set('i', '<esc>', function()
--   return vim.fn.pumvisible() == 1 and
--     '<c-e>' or
--     ''
-- end, {expr = true})

-- vim.keymap.set('i', '<c-w>', function()
--   return vim.fn.pumvisible() == 1 and
--     '<c-e>' or
--     '<c-w>'
-- end, {expr = true})

-- numpad shift
   vim.keymap.set('i', '<kInsert>'  , '0')
   vim.keymap.set('i', '<kEnd>'     , '1')
   vim.keymap.set('i', '<kDown>'    , '2')
   vim.keymap.set('i', '<kPageDown>', '3')
   vim.keymap.set('i', '<kLeft>'    , '4')
   vim.keymap.set('i', '<kOrigin>'  , '5')
   vim.keymap.set('i', '<kRight>'   , '6')
   vim.keymap.set('i', '<kHome>'    , '7')
   vim.keymap.set('i', '<kUp>'      , '8')
   vim.keymap.set('i', '<kPageUp>'  , '9')

-- 
-- mode cmd
-- 

-- quit
   vim.keymap.set('c', '<c-q>', '<c-c>')

-- cursor mv line in
   vim.keymap.set('c', '<c-a>', '<c-b>')
   vim.keymap.set('c', '<c-e>', '<c-e>')
-- vim.keymap.set('c', '<c-a>', '<home>')
-- vim.keymap.set('c', '<c-e>', '<end>' )

-- cursor mv char
   vim.keymap.set('c', '<c-s>', '<Left>')
   vim.keymap.set('c', '<c-l>', '<Right>')

-- cursor mv word
   vim.keymap.set('c', '<c-o>', '<s-left>')
   vim.keymap.set('c', '<c-f>', '<s-right>')

-- del char
   vim.keymap.set('c', '<c-h>', '<bs>')
   vim.keymap.set('c', '<c-d>', '<del>')

-- del word forward
-- "cnoremap ?? non ? idea <s-right><c-w>
   vim.keymap.set('c', '<c-k>', '<del>')

-- del word back
   vim.keymap.set('c', '<c-w>', '<c-w>')

-- del in line back
   vim.keymap.set('c', '<c-u>', '<c-u>')

-- paste
   vim.keymap.set('c', '<c-v>', '<c-r>a')

-- history
-- vim.keymap.set('c', '<c-p>', '<Up>'  )
-- vim.keymap.set('c', '<c-n>', '<Down>')

-- cmdline win
   vim.keymap.set('c', '<c-_>', '<c-f>')

-- numpad shift
   vim.keymap.set('c', '<kInsert>'  , '0')
   vim.keymap.set('c', '<kEnd>'     , '1')
   vim.keymap.set('c', '<kDown>'    , '2')
   vim.keymap.set('c', '<kPageDown>', '3')
   vim.keymap.set('c', '<kLeft>'    , '4')
   vim.keymap.set('c', '<kOrigin>'  , '5')
   vim.keymap.set('c', '<kRight>'   , '6')
   vim.keymap.set('c', '<kHome>'    , '7')
   vim.keymap.set('c', '<kUp>'      , '8')
   vim.keymap.set('c', '<kPageUp>'  , '9')

-- 
-- mode term
-- 

-- term > normal
   vim.keymap.set('t', '<c-_>', '<c-\\><c-n>')


