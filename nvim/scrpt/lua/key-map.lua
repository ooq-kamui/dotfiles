
-- leader
vim.g.mapleader = vim.api.nvim_replace_termcodes('<esc>', bl.f, bl.f, bl.t)

keymap__    = vim.keymap.set
keymap__clr = vim.keymap.del


-- mode normal

keymap__('n', '<esc>'    , '<esc>')
keymap__('n', '<space>'  , '<esc>')
keymap__('n', '<s-space>', '<esc>')
keymap__('n', '<cr>'     , '<esc>')
keymap__('n', '<bs>'     , '<esc>')
keymap__('n', '<bar>'    , '<esc>') -- |
keymap__('n', '<enter>'  , '<esc>')
keymap__('n', '<tab>'    , '<esc>')

keymap__('n', '-', '<esc>')
keymap__('n', '+', '<esc>')
keymap__('n', '=', '<esc>')
keymap__('n', '@', '<esc>')
keymap__('n', ';', '<esc>')
keymap__('n', ',', '<esc>')
keymap__('n', '.', '<esc>')
keymap__('n', '*', '<esc>')
keymap__('n', '_', '<esc>')
keymap__('n', '~', '<esc>')
keymap__('n', '^', '<esc>')
keymap__('n', '/', '<esc>')
keymap__('n', '?', '<esc>')
keymap__('n', '!', '<esc>')
keymap__('n', "'", '<esc>')
keymap__('n', '"', '<esc>')
keymap__('n', '`', '<esc>')
keymap__('n', '#', '<esc>')
keymap__('n', '$', '<esc>')
keymap__('n', '%', '<esc>')  -- ?
keymap__('n', '&', '<esc>')
keymap__('n', '(', '<esc>')
keymap__('n', ')', '<esc>')
keymap__('n', '{', '<esc>')
keymap__('n', '}', '<esc>')
keymap__('n', '<', '<esc>')
keymap__('n', '>', '<esc>')
keymap__('n', '[', '<esc>')
keymap__('n', ']', '<esc>')

keymap__('n', '\\', '<esc>')

keymap__('n', '<<', '<esc>')
keymap__('n', '>>', '<esc>')

keymap__('n', '0', '<esc>')
keymap__('n', '2', '<esc>')

keymap__('n', 'a', '<esc>')
keymap__('n', 'b', '<esc>')
keymap__('n', 'c', '<esc>')
keymap__('n', 'd', '<esc>')
keymap__('n', 'e', '<esc>')
keymap__('n', 'f', '<esc>')
keymap__('n', 'g', '<esc>')
keymap__('n', 'h', '<esc>')
keymap__('n', 'i', '<esc>')
keymap__('n', 'j', '<esc>')
keymap__('n', 'k', '<esc>')
keymap__('n', 'l', '<esc>')
keymap__('n', 'm', '<esc>')
keymap__('n', 'n', '<esc>')
keymap__('n', 'o', '<esc>')
keymap__('n', 'p', '<esc>')
keymap__('n', 'q', '<esc>')
keymap__('n', 'r', '<esc>')
keymap__('n', 's', '<esc>')
keymap__('n', 't', '<esc>')
keymap__('n', 'u', '<esc>')
keymap__('n', 'v', '<esc>')
keymap__('n', 'w', '<esc>')
keymap__('n', 'x', '<esc>')
keymap__('n', 'y', '<esc>')
keymap__('n', 'z', '<esc>')

keymap__('n', 'A', '<esc>')
keymap__('n', 'B', '<esc>')
keymap__('n', 'C', '<esc>')
keymap__('n', 'D', '<esc>')
keymap__('n', 'E', '<esc>')
keymap__('n', 'F', '<esc>')
keymap__('n', 'G', '<esc>')
keymap__('n', 'H', '<esc>')
keymap__('n', 'I', '<esc>')
keymap__('n', 'J', '<esc>')
keymap__('n', 'K', '<esc>')
keymap__('n', 'L', '<esc>')
keymap__('n', 'M', '<esc>')
keymap__('n', 'N', '<esc>')
keymap__('n', 'O', '<esc>')
keymap__('n', 'Q', '<esc>')
keymap__('n', 'P', '<esc>')
keymap__('n', 'R', '<esc>')
keymap__('n', 'S', '<esc>')
keymap__('n', 'T', '<esc>')
keymap__('n', 'U', '<esc>')
keymap__('n', 'W', '<esc>')
keymap__('n', 'V', '<esc>')
keymap__('n', 'X', '<esc>')
keymap__('n', 'Y', '<esc>')

keymap__('n', '<c-tab>'  , '<esc>')
keymap__('n', '<c-space>', '<esc>')

keymap__('n', '<c-@>', '<esc>')
keymap__('n', '<c-^>', '<esc>')
keymap__('n', '<c-->', '<esc>') -- non
keymap__('n', '<c-*>', '<esc>') -- non ?
keymap__('n', '<c-:>', '<esc>') -- non
keymap__('n', '<c-;>', '<esc>') -- non
keymap__('n', '<c-,>', '<esc>') -- non ?
keymap__('n', '<c-.>', '<esc>') -- non ?
keymap__('n', '<c-/>', '<esc>') -- non ?
keymap__('n', '<c-_>', '<esc>')
keymap__('n', '<c-[>', '<esc>')
keymap__('n', '<c-]>', '<esc>')

keymap__('n', '<c-\\>', '<esc>')

keymap__('n', '<c-a>', '<esc>')
keymap__('n', '<c-b>', '<esc>')
keymap__('n', '<c-c>', '<esc>')
keymap__('n', '<c-d>', '<esc>')
keymap__('n', '<c-e>', '<esc>')
keymap__('n', '<c-f>', '<esc>')
keymap__('n', '<c-g>', '<esc>')
keymap__('n', '<c-h>', '<esc>')
keymap__('n', '<c-i>', '<esc>') -- tab
keymap__('n', '<c-l>', '<esc>')
keymap__('n', '<c-m>', '<esc>')
keymap__('n', '<c-n>', '<esc>')
keymap__('n', '<c-o>', '<esc>')
keymap__('n', '<c-p>', '<esc>')
keymap__('n', '<c-q>', '<esc>')
keymap__('n', '<c-r>', '<esc>')
keymap__('n', '<c-s>', '<esc>')
keymap__('n', '<c-t>', '<esc>')
keymap__('n', '<c-u>', '<esc>')
keymap__('n', '<c-v>', '<esc>')
keymap__('n', '<c-w>', '<esc>')
keymap__('n', '<c-x>', '<esc>')
keymap__('n', '<c-y>', '<esc>')
keymap__('n', '<c-z>', '<esc>')

keymap__clr('n', '<c-w>d'    )
keymap__clr('n', '<c-w><c-d>')

keymap__('n', 'ga', '<esc>')
keymap__('n', 'gb', '<esc>')
keymap__('n', 'gd', '<esc>')
keymap__('n', 'ge', '<esc>')
keymap__('n', 'gf', '<esc>')
keymap__('n', 'gg', '<esc>')
keymap__('n', 'gh', '<esc>')
keymap__('n', 'gi', '<esc>')
keymap__('n', 'gj', '<esc>')
keymap__('n', 'gk', '<esc>')
keymap__('n', 'gl', '<esc>')
keymap__('n', 'gm', '<esc>')
keymap__('n', 'gn', '<esc>')
keymap__('n', 'go', '<esc>')
keymap__('n', 'gp', '<esc>')
keymap__('n', 'gs', '<esc>')
keymap__('n', 'gt', '<esc>')
keymap__('n', 'gu', '<esc>')
keymap__('n', 'gv', '<esc>')
keymap__('n', 'gw', '<esc>')
keymap__('n', 'gy', '<esc>')

keymap__('n', 'ra', '<esc>')
--                   :
keymap__('n', 're', '<esc>')
keymap__('n', 'rf', '<esc>')
--                   :
keymap__('n', 'rh', '<esc>')
keymap__('n', 'ri', '<esc>')
keymap__('n', 'rj', '<esc>')
keymap__('n', 'rk', '<esc>')
keymap__('n', 'rl', '<esc>')
--                   :
keymap__('n', 'rn', '<esc>')
keymap__('n', 'ro', '<esc>')
keymap__('n', 'rp', '<esc>')
keymap__('n', 'rq', '<esc>')
keymap__('n', 'rr', '<esc>')
--                   :
keymap__('n', 'ru', '<esc>')
keymap__('n', 'rv', '<esc>')
--                   :
keymap__('n', 'ry', '<esc>')
keymap__('n', 'rz', '<esc>')

keymap__('n', 'r:', '<esc>')

keymap__('n', 'xx', '<esc>')

keymap__('n', ':a', ':a')
keymap__('n', ':b', ':b')
keymap__('n', ':c', ':c')
keymap__('n', ':d', ':d')
keymap__('n', ':e', ':e')
keymap__('n', ':f', ':f')
keymap__('n', ':g', ':g')
keymap__('n', ':h', ':h')
keymap__('n', ':i', ':i')
keymap__('n', ':j', ':j')
keymap__('n', ':k', ':k')
keymap__('n', ':l', ':l')
keymap__('n', ':m', ':m')
keymap__('n', ':n', ':n')
keymap__('n', ':o', ':o')
keymap__('n', ':p', ':p')
keymap__('n', ':q', ':q')
keymap__('n', ':r', ':r')
keymap__('n', ':s', ':s')
keymap__('n', ':t', ':t')
keymap__('n', ':u', ':u')
keymap__('n', ':v', ':v')
keymap__('n', ':w', ':w')
keymap__('n', ':x', ':x')
keymap__('n', ':y', ':y')
keymap__('n', ':z', ':z')

keymap__('n', '<leader>:', '<esc>')
keymap__('n', '<leader>a', '<esc>')
keymap__('n', '<leader>b', '<esc>')
keymap__('n', '<leader>c', '<esc>')
keymap__('n', '<leader>d', '<esc>')
keymap__('n', '<leader>e', '<esc>')
keymap__('n', '<leader>f', '<esc>')
keymap__('n', '<leader>g', '<esc>')
keymap__('n', '<leader>h', '<esc>')
keymap__('n', '<leader>i', '<esc>')
keymap__('n', '<leader>j', '<esc>')
keymap__('n', '<leader>k', '<esc>')
keymap__('n', '<leader>l', '<esc>')
keymap__('n', '<leader>m', '<esc>')
keymap__('n', '<leader>n', '<esc>')
keymap__('n', '<leader>o', '<esc>')
keymap__('n', '<leader>p', '<esc>')
keymap__('n', '<leader>q', '<esc>')
keymap__('n', '<leader>r', '<esc>')
keymap__('n', '<leader>s', '<esc>')
keymap__('n', '<leader>t', '<esc>')
keymap__('n', '<leader>u', '<esc>')
keymap__('n', '<leader>v', '<esc>')
keymap__('n', '<leader>w', '<esc>')
keymap__('n', '<leader>x', '<esc>')
keymap__('n', '<leader>y', '<esc>')
keymap__('n', '<leader>z', '<esc>')

--                           :
keymap__('n', '<leader>D', '<esc>')
--                           :
keymap__('n', '<leader>I', '<esc>')
--                           :
keymap__('n', '<leader>K', '<esc>')
keymap__('n', '<leader>L', '<esc>')
keymap__('n', '<leader>M', '<esc>')
--                           :
keymap__('n', '<leader>O', '<esc>')
--                           :
keymap__('n', '<leader>R', '<esc>')
--                           :

-- log
keymap__('n', ':l', ':message <cr>')

-- quit buffer
keymap__('n', 'w',  v.Buf.__quit_swtch)

-- quit buffer force
keymap__('n', ':q', ':q!')

-- quit vim
keymap__('n', 'W', ':q<cr>')

-- quit tab other
-- keymap__('n', 'xx', ':tabo<cr>')

-- background job
-- keymap__('n', '<c-z>', '<c-z>')

-- save
keymap__('n', 'a', v.Buf.save)

-- load re slf
-- keymap__('n', ':r', ':lua v.Buf.opn_re()')

-- load re init vim  --  do not by lua ?
-- keymap__('n', 'xx', ':source ~/wrk/prj-pri/dotfiles/nvim/scrpt/init.vim')

-- opn

-- opn file
-- keymap__('n', ':o', ':Opn ')

-- opn file by oil
keymap__('n', ':o', ':Oil . ')

-- opn tab prv
keymap__('n', 'gi', v.Buf.opn_tab_prv)

-- opn file srch  ( fzf )
keymap__('n', '<leader>l', v.Fzf.file)

-- opn file hstry ( fzf )
keymap__('n', '<leader>L', ':FzfFileHstry<cr>')

-- opn file rcnt ( ltst )
keymap__('n', 'H', v.Buf.quit.rcnt_opn_re)
-- keymap__('n', 'S', v.Buf.quit.rcnt_opn_re)

-- opn etc

-- opn fish cnf
-- keymap__('n', 'xx', v.Buf.opn_fish_cnf)

-- opn nvim init
-- keymap__('n', 'gh', v.Buf.opn_nvim_init)

-- opn tmp file
-- keymap__('n', 'xx', v.Buf.opn_tmp_file)

-- opn memo
keymap__('n', 'gm', v.Buf.opn_memo)

-- opn man
-- keymap__('n', 'xx', ':OpnMan ')

-- opn re sjis
keymap__('n', ':S', ':Sjis ')

-- file encode ( encoding )
keymap__('n', ':e', ':set encoding?')

-- sys cmd opn

-- sys cmd opn app
keymap__('n', 'go', v.Sys.opn_app_by_cursor_path)

-- sys cmd opn app slf
-- keymap__('n', 'xx', v.Sys.opn_buf_file)

-- sys cmd opn dir slf
keymap__('n', 'gd', v.Sys.opn_buf_file_dir)

-- sys cmd opn brwsr
-- keymap__('n', 'xx', v.Sys.opn_brwsr)

-- sys cmd opn ggl srch
keymap__('n', 'ggl', ':lua v.Sys.opn_ggl_srch("")<cr>')

-- cursor mv

-- cursor mv drct
keymap__('n', '<Right>', 'l')
keymap__('n', '<Left>' , 'h')
keymap__('n', '<Up>'   , 'k')
keymap__('n', '<Down>' , 'j')

-- cursor mv line
keymap__('n', 'k', v.Cursor.__mv_u)
keymap__('n', 'j', v.Cursor.__mv_d)

-- cursor mv line mlt
keymap__('n', '<c-k>', v.Cursor.__mv_mlt_u)
keymap__('n', '<c-j>', v.Cursor.__mv_mlt_d)

-- cursor mv line top | ins line
keymap__('n', 'y', v.Cursor.__mv_line_top_or_new_line)

-- cursor mv line top
-- keymap__('n', '<c-a>', v.Cursor.__mv_line_top0)

-- cursor mv line end
keymap__('n', '<c-y>', function()
  if v.Cursor.is_col__line_end() then
    return ':lua v.Cursor.__ins_markdown_cr()<cr>'
    -- return v.Cursor.__ins_markdown_cr
  else
    return ':lua v.Cursor.__mv_line_end()<cr>'
    -- return v.Cursor.__mv_line_end
  end
end, {expr = bl.t})

-- cursor mv char - forward
keymap__('n', 'l', 'l')

-- cursor mv char - back
keymap__('n', '<c-s>', 'h')
-- keymap__('n', '<c-o>', 'h')

-- cursor mv word - forward
keymap__('n', 'f', v.Cursor.__mv_word_f)

-- cursor mv word - back
keymap__('n', 'o', v.Cursor.__mv_word_b)

-- cursor mv word - back pre
-- keymap__('n', 'xx', v.Cursor.__mv_word_b_pre)

-- cursor mv word dlm _ forward
keymap__('n', '_', 'f_')
-- keymap__('n', '_', 'f_l')

-- cursor mv word dlm _ back
keymap__('n', '<c-o>', 'hT_')
keymap__('n', '<c-_>', 'hT_')

-- cursor mv word dlm ( camel or _ )  -  forward
keymap__('n', '<c-f>', v.Cursor.__mv_word_dlm_f)

keymap__('n', 'F', v.Cursor.__mv_line_u_word_col)

-- cursor mv fnc name
-- keymap__('n', 'xx', v.Cursor.__mv_fnc_name)

-- cursor mv bracket pair
keymap__('n', '<c-l>', '%')

-- cursor mv block out
keymap__('n', '<c-w>', v.Cursor.__mv_block_out_swtch)

-- cursor mv fnc out back
-- keymap__('n', 'xx', '[m')

-- cursor mv bracket out back
-- keymap__('n', 'xx', v.Cursor.__mv_bracket_out)

-- cursor mv indnt auto
-- keymap__('n', 'xx', v.Cursor__mv_indnt_auto) -- todo dev

-- cursor mv file edge bgn
keymap__('n', 'gk', v.Cursor.__mv_file_edge_bgn)

-- cursor mv file edge end
keymap__('n', 'gj', v.Cursor.__mv_file_edge_end)

-- cursor mv edit latest
-- keymap__('n', 'xx', '`.')

-- cursor mv jmp
keymap__('n', 'rk', v.Cursor.__mv_v_jmp_u)
keymap__('n', 'rj', v.Cursor.__mv_v_jmp_d)

-- cursor mv jmp - space stop
keymap__('n', 'rrk', v.Cursor.__mv_v_jmp_u_also_space)
keymap__('n', 'rrj', v.Cursor.__mv_v_jmp_d_also_space)

-- cursor mv by line num
keymap__('n', ':g', ':lua v.Cursor.__mv_by_line_num()')

-- scroll
keymap__('n', 'K'     , '<c-y>')
keymap__('n', 'J'     , '<c-e>')
keymap__('n', '<up>'  , '<c-y>')
keymap__('n', '<down>', '<c-e>')

-- scroll cursor line upper
-- keymap__('n', 'xx', 'zt')

-- scroll cursor line middle
-- keymap__('n', 'xx', 'zz')

-- 
-- slct / slctd / ynk / paste
-- 

-- slct
-- keymap__('n', 'I', 'v')

-- slctd __ word
keymap__('n', 'i', v.Slctd.str__word)

-- slctd __ char current - word end
keymap__('n', 'I', 've')

-- slct visual
-- keymap__('n', '<c-v>', 'v')

-- slct visual box
keymap__('n', 'v', '<c-v>')

-- slct all
-- keymap__('n', 'xx', v.Rgstr.ynk__line_all)

-- slct re
keymap__('n', 'R'    , v.Slctd.__ltst)
-- keymap__('n', '<c-r>', v.Slctd.__ltst)

-- ynk clr
keymap__('n', '<c-c>', v.Rgstr.ynk__clr)

-- ynk line
keymap__('n', 'c', v.Rgstr.ynk__cursor_line)

-- ynk char
-- keymap__('n', 'xx', '"ayl')

-- ynk slf path
keymap__('n', 'gs', v.Rgstr.ynk__buf_file_path)

-- ojroques/nvim-osc52
keymap__('n', 'C', ':lua osc52.copy_register("a")<cr>')

-- paste
keymap__('n', 'p', v.Cursor.__ins_ynk)

-- paste box
keymap__('n', 'rp', v.Cursor.__ins_ynk_box)

-- paste clp
keymap__('n', 'P', v.Cursor.__ins_clp)

-- paste rgstr history ( fzf )
keymap__('n', '<leader>c', v.Fzf.rgstr)

-- undo
keymap__('n', 'h'    , 'u'    )

-- redo
keymap__('n', '<c-h>', '<c-r>')

-- undo history clr
-- keymap__('n', ':h', ':lua v.Undo__clr()')
keymap__('n', ':h', ':lua v.Buf.undo__clr()')

-- repeat
-- keymap__('n', 'xx', '.')

-- repeat fnc
keymap__('n', '^', v.Cmd._repeat)

-- macro rec
keymap__('n', '$', v.Mcr.rec, {expr = bl.t})
keymap__('n', '4', v.Mcr.rec, {expr = bl.t})

-- macro ply
keymap__('n', '#', v.Mcr.ply, {expr = bl.t})
keymap__('n', '3', v.Mcr.ply, {expr = bl.t})

-- edit

-- mode ch ins
keymap__('n', '<space>', v.Mode.__ins)
-- keymap__('n', '<space>', 'i')

-- mode ch ins rpl
-- keymap__('n', 'xx', 'R')

-- ins cr
keymap__('n', 'm', v.Cursor.__ins_cr)

-- ins space
-- keymap__('n', 'L', ':lua v.Cursor.__ins_space(bl.f)<cr>')
keymap__('n', 'L', v.Cursor.__ins_space)

-- ins equal
keymap__('n', '2', 'i=<esc>')

-- ins period
keymap__('n', '.', 'i.<esc>')

-- ins comma
keymap__('n', ',', 'i, <esc>l')

-- ins comma $, nxt line
-- keymap__('n', 'xx', 'A,<esc>j')

-- ins hyphen
keymap__('n', '0', v.Cursor.__ins_hyphen)

-- ins quote
-- keymap__('n', 'xx', v.Cursor.__ins_quote)

-- ins date ( da )
keymap__('n', 't'    , v.Cursor.__ins_da)
keymap__('n', '*'    , v.Cursor.__ins_da)

-- ins time ( tm )
keymap__('n', 'T', v.Cursor.__ins_tm)

-- ins date time ( dt )
-- keymap__('n', 'xx', v.Cursor.__ins_dt)

-- ins day of week
-- keymap__('n', 'xx', v.Cursor.__ins_week)

-- ins slf path
-- keymap__('n', 'xx', v.Cursor.__ins_line_buf_file_path)

-- ins anchor
keymap__('n', 'A', v.Cursor.__ins_line_anchor)

-- ins anchor, del
-- keymap__('n', 'xx', v.Cursor.__ins_line_anchor_7_del)

-- ins markdown code
-- keymap__('n', '<c-u>', ':lua v.Cursor.__ins_markdown_code()<cr>')
keymap__('n', '<c-u>', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_code()<cr>'
  else
    -- return '[{'
    return ''
  end
end, {expr = bl.t})

-- dev anchor
-- ins markdown itm
keymap__('n', 'O', function()
  if v.Buf.is_file_type__('markdown') then
    if v.Cursor.is_line__markdown_itm() then
      return ':lua v.Cursor.line_indnt__shft_r()<cr>'
    else
      return ':lua v.Cursor.__ins_markdown_itm()<cr>'
    end
  else
    return ':lua v.Cursor.line_indnt__shft_r()<cr>'
  end
end, {expr = bl.t})

-- ins dots ( or crnt )
keymap__('n', 'ru', v.Cursor.line_end__dots_adjst)

-- ins line emp
-- " ref nnoremap y

-- ins comment mlt
-- keymap__('n', 'xx', v.Cursor.__ins_cmnt_mlt)

-- ins comment 1
keymap__('n', '!', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = bl.t})

keymap__('n', '1', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = bl.t})

keymap__('n', '"', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = bl.t})

-- ins __ line indnt space
keymap__('n', 'V', v.Cursor.d__ins_line_space)

-- cahr rpl, under score
-- keymap__('n', 'xx', v.Cursor.char__rpl_underscore)

-- tgl markdown chk
-- keymap__('n', 'xx', v.Char_markdown_chk__tgl)

-- del char
keymap__('n', 's', v.Cursor.c_char__del)

-- del char ynk
-- keymap__('n', 'xx', v.Cursor.c_char__del_ynk)

-- line del
keymap__('n', 'd', v.Cursor.line__del)

-- line forward del
keymap__('n', '<c-d>', v.Cursor.f_str__del)
-- keymap__('n', '<c-d>', 'D')

-- word back    del
-- keymap__('n', 'xx', 'hvbd')

-- word forward del
-- keymap__('n', 'xx', function()
--   if v.Cursor.is_col__line_end() then
--     return '<esc>'
--   else
--     return '"zdw'
--   end
-- end, {expr = bl.t})

-- keymap__('n', 'xx', function()
--   if v.Cursor.is_col__line_end() then
--     return '<esc>'
--   else
--     return '"zde'
--   end
-- end, {expr = bl.t})

-- del cr ( line join )
keymap__('n', '<c-m>'  , 'J')
keymap__('n', '<enter>', 'J')

-- line mv up
-- keymap__('n', 'xx', '"addk"aP')

-- line dpl
keymap__('n', 'D', v.Line.__dpl)

-- char tgl 01 ( ?? / num icl  )
keymap__('n', 'u', v.Char.__tgl_swtch01)

-- char tgl 02 ( type ch / num dcl )
keymap__('n', 'U', v.Char.__tgl_swtch02)

-- indnt shft
keymap__('n', 'ri', v.Cursor.line_indnt__shft_l)
keymap__('n', 'ro', v.Cursor.line_indnt__shft_r)

-- indnt add
-- keymap__('n', 'xx', ':lua v.Cursor.line_indnt__add(2)<cr>')

-- indnt crct
keymap__('n', 're', v.Cursor.line_indnt__crct)

-- cursor f str __ crct ( algn )
-- keymap__('n', 'x', ':lua v.Cursor.f_str__space_crct_with_word("u")<cr>')
-- keymap__('n', 'x', ':lua v.Cursor.f_str__space_crct_with_word("d")<cr>')

-- cursor f str __ crct ( algn ) fzy
keymap__('n', 'q', ':lua v.Cursor.f_str__space_crct_with_fzy("u")<cr>')
keymap__('n', 'Q', ':lua v.Cursor.f_str__space_crct_with_fzy("d")<cr>')

-- 
-- srch
-- 

-- srch hl init
-- keymap__('n', 'xx', '/<cr>N')
-- keymap__('n', 'xx', v.Srch.__init)

-- srch char in line - forward
-- keymap__('n', 'xx', 'f')

-- srch char in line repeat
-- keymap__('n', 'xx', ';')

-- srch by cmd forward
keymap__('n', '<leader>k'    , 'mz/')

-- srch by cmd back
keymap__('n', '<leader><c-k>', 'mz?')

-- srch by cmd word1
keymap__('n', '<leader>K', [[/\<\><left><left>]])
-- keymap__('n', '<leader>K', '/\\<\\><left><left>')

-- srch word or
-- keymap__('n', 'xx', 'Xxx')

-- srch forward
keymap__('n', 'n'    , ':lua v.Cursor.__mv_by_srch_str("f")<cr>')

-- srch back
keymap__('n', '<c-n>', ':lua v.Cursor.__mv_by_srch_str("b")<cr>')

-- srch str set
keymap__('n', 'e', v.Srch.str__cursor_word)

-- srch str set ( word 1 )
keymap__('n', 'E', v.Srch.str__word1_tgl)

-- srch char bracket forward
-- keymap__('n', 'xx', ':lua v.Srch.char_bracket('f')<cr>')

-- srch markdown h
keymap__('n', 'M', v.Srch.str__h_swtch)

-- srch markdown itm
keymap__('n', ':i', v.Srch.str__markdown_itm)

-- srch str history ( fzf )
keymap__('n', '<leader>f', ':FzfSrchHstry<cr>')

-- srch str set prv ( tgl )
keymap__('n', 'N', v.Srch.str__prv_tgl)

-- srch rpl one > ynk nxt ( only srch )
keymap__('n', '<c-p>', ':lua v.Srch.slct("f")<cr>')

-- rpl ( cmd )
keymap__('n', ':s', ':%s/<c-r>//xxx/g')
-- keymap__('n', ':s', ':Rpl ')

-- fzf rg
keymap__('n', '<leader>o'    , v.Fzf.rg)

-- fzf rg srch str
keymap__('n', '<leader><c-o>', v.Fzf.rg_by_srch_str)

-- fzf rg srch str word1
keymap__('n', '<leader>O'    , v.Fzf.rg_word1_by_srch_str)

-- fzf rg fltr ext
keymap__('n', ':F', ':FzfRgExt js')

-- fzf rg with run
-- keymap__('n', '<leader>xx', ':FzfRgWithRun <cr>')

-- fzf buf
keymap__('n', '<leader>i', ':lua v.Fzf.buf()<cr>')
keymap__('n', '<leader>I', ':lua v.Fzf.buf()<cr>')

-- fzf buf work1  -- dev
-- keymap__('n', '<leader>I', ':lua v.Fzf.buf()<cr>')

-- fzf jmplst
keymap__('n', '<leader>e', v.Fzf.jmplst)

-- fzf pth lst
-- keymap__('n', '<leader>xx', ':FzfTagjmpByFile <cr>')

-- tag jmp tab new
keymap__('n', 'xx', v.Buf.opn_by_cursor_line_pth)

-- cmd

-- cmd history ( fzf )
keymap__('n', '<leader>r', ':FzfCmdHstry<cr>')
keymap__('n', '<leader>h', ':FzfCmdHstry<cr>')
keymap__('n', '<leader>:', ':FzfCmdHstry<cr>')

-- sys cmd
keymap__('n', ':!', ':!')
keymap__('n', ':1', ':!')

-- ins sys cmd ( read )
-- keymap__('n', 'xx', ':InsSysCmd ')

-- pth
keymap__('n', ':p', ':Pth <cr>')

-- cd slf
keymap__('n', ':d', ':lua v.Dir.__buf_file_dir()')

-- cd __ nvim launch
keymap__('n', ':D', ':lua v.Dir.__nvim_launch()')

-- cd parent
keymap__('n', ':k', ':K')

-- fzf etc

-- fzf cd
keymap__('n', '<leader>d', v.Fzf.dir)

-- fzf cd ( dir jmp , zoxide )
keymap__('n', '<leader>D', v.Fzf.dir_jmp)

-- fzf fnc call
keymap__('n', '<leader>R', v.Fzf.fnc_call)

-- fzf doc tech
keymap__('n', '<leader>t', v.Fzf.doc_tech)

-- fzf doc memo
-- keymap__('n', '<leader>xx', v.Fzf.doc_memo_opn)

-- fzf git status
keymap__('n', '<leader>u', v.Fzf.file_by_git_st)

-- tab

-- tab mv
keymap__('n', '<c-i>'  , 'gt')
keymap__('n', '<tab>'  , 'gt')
keymap__('n', '<s-tab>', 'gT')

-- tab order
keymap__('n', '<s-left>' , ':tabm-1<cr>')
keymap__('n', '<s-right>', ':tabm+1<cr>')

-- buf

-- buf list
-- keymap__('n', ':xx', ':buffers')

-- buf fltr
keymap__('n', ':f', ':%! jq')  -- jq : sample

-- buf fltr jq
keymap__('n', ':fj', ':lua v.Buf.__fltr_jq()')

-- buf fltr ruff
keymap__('n', ':fr', ':lua v.Sys.ruff_by_slf()')
-- keymap__('n', ':fr', ':lua v.Buf.__fltr_ruff()')

-- win ( buf )

-- win ( buf ) splt quit
-- keymap__('n', 'rq', v.Win.splt__quit)

-- win ( buf ) splt h
keymap__('n', 'rh', v.Win.__splt_h)

-- win ( buf ) splt v
keymap__('n', 'r:', v.Win.__splt_v)
keymap__('n', 'ry', v.Win.__splt_v)
-- keymap__('n', 'rv', v.Win.__splt_v)

-- win ( buf ) size w __ +
keymap__('n', '{', '<c-w>>')

-- win ( buf ) nxt
keymap__('n', 'rl', v.Win.splt_cursor__mv_nxt)
keymap__('n', 'rn', v.Win.splt_cursor__mv_nxt)

-- win ( buf ) mv r
-- keymap__('n', 'xx', '<c-w>l')

-- win ( buf ) mv l
-- keymap__('n', 'xx', '<c-w>h')

-- fnc call
-- keymap__('n', ':c', ':call ')

-- term launch
-- keymap__('n', 'xx', ':Term ')

-- mark
keymap__('n', 'x', 'mz')

-- mark  -  cursor mv
keymap__('n', 'rm', '``')
-- keymap__('n', 'rm', '`z')

keymap__('n', '<leader>m', ':FzfMark<cr>')

-- 
-- setting ( set )
-- 

-- setting  -  line view wrap tgl
keymap__('n', ':w', ':set wrap!')

-- setting  -  line num view tgl
keymap__('n', ':N', ':set number!')

-- setting  -  line num rel tgl
-- keymap__('n', ':n', ':set relativenumber!')

keymap__('n', ':n', ':normal! ')

-- inf

-- inf char
-- keymap__('n', 'xx', 'ga')

-- numpad shift
keymap__('n', '<kInsert>'  , '0')
keymap__('n', '<kEnd>'     , '1')
keymap__('n', '<kDown>'    , '2')
keymap__('n', '<kPageDown>', '3')
keymap__('n', '<kLeft>'    , '4')
keymap__('n', '<kOrigin>'  , '5')
keymap__('n', '<kRight>'   , '6')
keymap__('n', '<kHome>'    , '7')
keymap__('n', '<kUp>'      , '8')
keymap__('n', '<kPageUp>'  , '9')

-- tst

keymap__('n', ':z', v.Tst.tst)


-- mode visual

-- mode visual nop

-- keymap__('x', '<space>', '<nop>')

-- mode visual esc
keymap__('x', '<tab>', '<esc>')
keymap__('x', '<bar>', '<esc>')

keymap__('x', '@', '<esc>')
keymap__('x', '*', '<esc>')
keymap__('x', '/', '<esc>')
keymap__('x', '!', '<esc>')
keymap__('x', '"', '<esc>')
keymap__('x', '#', '<esc>')
keymap__('x', '$', '<esc>')
keymap__('x', '%', '<esc>')  -- ?
keymap__('x', '&', '<esc>')
keymap__('x', '_', '<esc>')
keymap__('x', '?', '<esc>')
keymap__('x', '(', '<esc>')
keymap__('x', ';', '<esc>')
keymap__('x', '<', '<esc>')
keymap__('x', '>', '<esc>')
keymap__('x', '=', '<esc>')
keymap__('x', '-', '<esc>')
keymap__('x', '+', '<esc>')
keymap__('x', ',', '<esc>')
keymap__('x', '.', '<esc>')
keymap__('x', '~', '<esc>')

keymap__('x', '\\', '<esc>')

keymap__('x', 'a', '<esc>')
keymap__('x', 'b', '<esc>')
keymap__('x', 'c', '<esc>')
keymap__('x', 'd', '<esc>')
keymap__('x', 'e', '<esc>')
keymap__('x', 'f', '<esc>')
keymap__('x', 'g', '<esc>')
keymap__('x', 'h', '<esc>')
keymap__('x', 'i', '<esc>')
keymap__('x', 'l', '<esc>')
keymap__('x', 'm', '<esc>')
keymap__('x', 'n', '<esc>')
keymap__('x', 'o', '<esc>')
keymap__('x', 'p', '<esc>')
keymap__('x', 'q', '<esc>')
keymap__('x', 'r', '<esc>')
keymap__('x', 's', '<esc>')
keymap__('x', 't', '<esc>')
keymap__('x', 'u', '<esc>')
keymap__('x', 'v', '<esc>')
keymap__('x', 'w', '<esc>')
keymap__('x', 'x', '<esc>')
keymap__('x', 'y', '<esc>')

keymap__('x', 'A', '<esc>')
keymap__('x', 'B', '<esc>')
keymap__('x', 'C', '<esc>')
keymap__('x', 'D', '<esc>')
keymap__('x', 'E', '<esc>')
keymap__('x', 'F', '<esc>')
keymap__('x', 'H', '<esc>')
keymap__('x', 'I', '<esc>')
keymap__('x', 'J', '<esc>')
keymap__('x', 'K', '<esc>')
keymap__('x', 'L', '<esc>')
keymap__('x', 'M', '<esc>')
keymap__('x', 'N', '<esc>')
keymap__('x', 'O', '<esc>')
keymap__('x', 'P', '<esc>')
keymap__('x', 'Q', '<esc>')
keymap__('x', 'R', '<esc>')
keymap__('x', 'S', '<esc>')
keymap__('x', 'T', '<esc>')
keymap__('x', 'U', '<esc>')
keymap__('x', 'V', '<esc>')
keymap__('x', 'W', '<esc>')
keymap__('x', 'X', '<esc>')
keymap__('x', 'Y', '<esc>')

keymap__('x', '<c-_>', '<esc>')

keymap__('x', '<c-\\>', '<esc>')

keymap__('x', '<c-a>', '<esc>')
keymap__('x', '<c-b>', '<esc>')
keymap__('x', '<c-c>', '<esc>')
keymap__('x', '<c-d>', '<esc>')
keymap__('x', '<c-e>', '<esc>')
keymap__('x', '<c-f>', '<esc>')
keymap__('x', '<c-h>', '<esc>')
keymap__('x', '<c-i>', '<esc>')
keymap__('x', '<c-l>', '<esc>')
keymap__('x', '<c-m>', '<esc>')
keymap__('x', '<c-n>', '<esc>')
keymap__('x', '<c-o>', '<esc>')
keymap__('x', '<c-p>', '<esc>')
keymap__('x', '<c-q>', '<esc>')
keymap__('x', '<c-r>', '<esc>')
keymap__('x', '<c-s>', '<esc>')
keymap__('x', '<c-u>', '<esc>')
keymap__('x', '<c-v>', '<esc>')
keymap__('x', '<c-w>', '<esc>')
keymap__('x', '<c-x>', '<esc>')
keymap__('x', '<c-y>', '<esc>')

keymap__('x', 'gb', '<esc>')
keymap__('x', 'gg', '<esc>')
keymap__('x', 'gh', '<esc>')
keymap__('x', 'gi', '<esc>')
keymap__('x', 'gj', '<esc>')
keymap__('x', 'gk', '<esc>')
keymap__('x', 'go', '<esc>')
keymap__('x', 'gp', '<esc>')
keymap__('x', 'gs', '<esc>')
keymap__('x', 'gt', '<esc>')
keymap__('x', 'gy', '<esc>')
   
keymap__('x', ':a', '<esc>')
--             :
keymap__('x', ':f', '<esc>')
--             :
keymap__('x', ':m', '<esc>')
--             :
keymap__('x', ':r', '<esc>')
--             :
keymap__('x', ':t', '<esc>')
--             :
keymap__('x', ':z', '<esc>')

-- leader esc

keymap__('x', '<leader>:', '<esc>')

keymap__('x', '<leader>a', '<esc>')
--                     :
keymap__('x', '<leader>i', '<esc>')
--                     :
keymap__('x', '<leader>k', '<esc>')
keymap__('x', '<leader>l', '<esc>')
--                     :
keymap__('x', '<leader>u', '<esc>')
--                     :
keymap__('x', '<leader>y', '<esc>')
keymap__('x', '<leader>z', '<esc>')
keymap__('x', '<leader>A', '<esc>')
--                     :
keymap__('x', '<leader>I', '<esc>')
--                     :
keymap__('x', '<leader>Z', '<esc>')


-- mode ch line
keymap__('x', 'i', v.Slctd.mode__tgl)

-- mode ch visual box
keymap__('x', 'v', v.Slctd.mode_state__swtch)

-- file srch ( fzf )
-- keymap__('x', '<leader>xx', '"zy:FzfFile <c-r>z')

-- cursor mv

-- cursor mv slctd edge tgl
keymap__('x', 'y', v.Slctd.cursor__mv_edge_tgl)

-- cursor mv slctd edge tgl, v box line same
keymap__('x', '.', 'O')

-- cursor mv char forward
keymap__('x', 'l', 'l')

-- cursor mv char back
keymap__('x', '<c-s>', 'h')
keymap__('x', '<c-o>', 'h')

-- cursor mv word back
-- keymap__('x', 'xx', 'b')
-- keymap__('x', 'xx', 'bh')
-- keymap__('x', 'xx', 'Bh')

-- cursor mv line end
keymap__('x', '<c-y>', v.Slctd.cursor__mv_line_end)

-- slctd str r __ reduce dlm
keymap__('x', 'h'    , ':lua v.Slctd.str__reduce_dlm_r("_")<cr>')

-- slctd str l __ reduce dlm
keymap__('x', '<c-h>', ':lua v.Slctd.str__reduce_dlm_l("_")<cr>')

-- cursor mv space forward ( word pre )
-- keymap__('x', 'xx', 'wh')

-- cursor mv line
keymap__('x', '<c-j>', '10j')
keymap__('x', '<c-k>', '10k')

-- cursor mv jmp
keymap__('x', 'rk', ':lua v.Slctd.cursor__mv_v_jmp("k")<cr>')
keymap__('x', 'rj', ':lua v.Slctd.cursor__mv_v_jmp("j")<cr>')

-- cursor mv bracket pair
keymap__('x', '<c-l>', '%')

-- cursor mv bracket out back
-- keymap__('x', 'xx', '[{')

-- cursor mv bracket fnc back
-- keymap__('x', 'xx', '[m')

-- cursor mv file edge back    ( file bgn )
keymap__('x', 'gk', ':lua v.Slctd.cursor__mv_file_edge("k")<cr>')

-- cursor mv file edge forward ( file end )
keymap__('x', 'gj', ':lua v.Slctd.cursor__mv_file_edge("j")<cr>')

-- slct / ynk / paste

-- slctd expnd
-- keymap__('x', 'xx', v.Slctd.str__expnd)

-- slctd expnd srch
keymap__('x', 'N', ':lua v.Srch.str__slctd_str()<cr>')
-- keymap__('x', 'N', v.Slctd.str__expnd_srch)

-- slctd expnd forward swtch
keymap__('x', 'f', ':lua v.Slctd.str__expnd_f_swtch()<cr>')

-- slctd expnd word forward
keymap__('x', '<c-f>', ':lua v.Slctd.str__expnd_word_f()<cr>')

-- slctd expnd char pair
keymap__('x', '<c-i>', v.Slctd.str__expnd_char_pair)
keymap__('x', '<tab>', v.Slctd.str__expnd_char_pair) -- tab : del not

-- slctd expnd bracket forward
-- keymap__('x', 'xx', v.Slctd.str__expnd_bracket_swtch)

-- slct all
keymap__('x', 'a' , ':lua v.Slctd.str__all()<cr>')
-- keymap__('x', 'gg', v.Slctd.str__all)

-- ynk slctd
keymap__('x', 'o', v.Rgstr.ynk__slctd)

-- ynk slctd add
-- keymap__('x', 'xx', v.Rgstr.ynk__add_slctd)

-- clp slctd
-- keymap__('x', 'xx', '"+y')

-- paste
-- todo refactoring ?
keymap__('x', 'p', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_l__ynk_line_1()<cr>'
  else
    return ':lua v.Slctd.str__ynk()<cr>'
  end
end, {expr = bl.t})

-- paste clp
-- keymap__('x', 'xx', v.Slctd.str__clp)

-- paste visual box
-- keymap__('x', 'xx', 'I<c-r>0<esc>')

-- edit

-- ins | cut & ins
keymap__('x', '<space>', function()
  if v.Mode.is__box() then
    return 'I'
  else
    return 'c'
  end
end, {expr = bl.t})

-- cut & ins
-- keymap__('x', '<leader><space>', '"zc')

-- ins line $
keymap__('x', 'Y', ':lua v.Slctd.line_end__ins_input()<cr>')

-- ins space
keymap__('x', 'L', function()

  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_l__ins_space()<cr>'
  else
    return ':lua v.Slctd.line_indnt__shft_r()<cr>'
  end
end, {expr = bl.t})

-- line __ ins comment 1
keymap__('x', '!', ':lua v.Slctd.line__ins_cmnt_1()<cr>')
keymap__('x', '1', ':lua v.Slctd.line__ins_cmnt_1()<cr>')

-- line end __ ins comma
keymap__('x', ',', ':lua v.Slctd.line_end__ins(",")<cr>')

-- fil space
keymap__('x', 'S'    , v.Slctd.__fil_space)

-- fil -
keymap__('x', '-'    , ':lua v.Slctd.__fil("-")<cr>')

-- fil |
keymap__('x', '<bar>', v.Slctd.__fil_bar)

-- slctd str space __ under score
keymap__('x', '_', v.Slctd.str_space__underscore)

-- line __ join per line
keymap__('x', 'J', ':lua v.Slctd.line__join_per_line(3)')

-- del str > ynk
keymap__('x', 'd', function()
  if v.Mode.is__box() then
    return '"ad:let @+ = @a<cr>gv'
  else
    return '"ad:let @+ = @a<cr>'
  end
end, {expr = bl.t})

-- keymap__('x', 'xx', v.Slctd.v__del)

-- del str > ynk not
keymap__('x', 's', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.__del()<cr>'
  else
    return '"zx'
  end
end, {expr = bl.t})

-- slctd line __ del line top space
-- keymap__('x', 'xx', v.Slctd.line_top_space__del)

-- slctd line __ del end space
keymap__('x', 'm', ':lua v.Slctd.line_end_space__del()<cr>')

-- slctd box

-- slctd box __ forward del
-- keymap__('x', '<c-d>', 'D')

-- slctd box __ del cursor f space
keymap__('x', 'K', ':lua v.Slctd.box_cursor_r_space__crct()<cr>')

-- slctd str edge out quote __ tgl
keymap__('x', 'w', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_width__1()<cr>'
  else
    return ':lua v.Slctd.str_edge_out_char__tgl()<cr>'
  end
end, {expr = bl.t})

-- slctd str edge bracket __ tgl
-- keymap__('x', 'xx', v.Slctd.str_edge_out_bracket__tgl)

-- slctd str edge out __ tgl shft
keymap__('x', 'W', v.Slctd.str_edge_out_char__type_ch)

-- slctd str edge out __ ins space
keymap__('x', 'I'    , v.Slctd.str_edge_out__ins_space)
-- keymap__('x', 'H'    , v.Slctd.str_edge_out__ins_space)
-- keymap__('x', 'O'    , v.Slctd.str_edge_out__ins_space)

-- slctd str edge out __ ins markdown strikethrough
keymap__('x', '~', v.Slctd.str_edge_out__ins_markdown_strikethrough)

-- slctd str edge out __ ins markdown strikethrough
keymap__('x', 'b', v.Slctd.str_edge_out__ins_markdown_bold)

-- slctd box str mv back
-- keymap__('x', 'xx', ':lua v.Slctd.box_str__mv("l")<cr>')

-- slctd box str mv forward
-- keymap__('x', 'xx', ':lua v.Slctd.box_str__mv("r")<cr>')

-- slctd box space __ del
keymap__('x', 'D', v.Slctd.box_space__del)

-- slctd box mv back
keymap__('x', '<c-w>', ':lua v.Slctd.box__mv("l")<cr>')

-- slctd box mv forward
keymap__('x', '<c-e>', ':lua v.Slctd.box__mv("r")<cr>')

-- num icl
keymap__('x', '+', '<c-a>gv')

-- num dcl
-- keymap__('x', '-', '<c-x>gv')

-- num seq
keymap__('x', '*', 'r0gvg<c-a>gv')
--                        ^^^^^^^^^^^^> r0 gv g<c-a> gv

-- indnt shft
keymap__('x', 'ri', v.Slctd.line_indnt__shft_l)
keymap__('x', 'ro', v.Slctd.line_indnt__shft_r)

-- indnt crct
-- keymap__('x', ';', '=gv')

-- indnt tab   > space
keymap__('x', ':e', ':lua v.Slctd.line_indnt__space(2)')

-- indnt space > tab
-- keymap__('x', 'xx', ':lua v.Slctd.line_indnt__tab(2)<cr>')

-- tidy tbl
keymap__('x', ':t', ':lua v.Slctd.line__crct_tbl()<cr>')

-- line end ovr, pad __ space
-- keymap__('x', 'xx', v.Slctd.line_end__pad_space)

-- upper / lower tgl
keymap__('x', 'u', '~gv')

-- upper force
keymap__('x', 'U', 'Ugv')

-- lower force
-- keymap__('x', 'xx', 'ugv')

-- str mb
keymap__('x', ':mb', v.Slctd.line_mb__cnv)

-- srch

-- srch cmd
-- keymap__('x', '<leader>k', '"zy/<c-r>z')
keymap__('x', '<leader>k', '/')

-- srch str set
keymap__('x', 'e', function()
  if v.Mode.is__box() then
    return '<esc>'
  else
    return ':lua v.Srch.str__slctd_str()<cr>'
  end
end, {expr = bl.t})

-- srch swtch
keymap__('x', 'n', ':lua v.Slctd.srch__swtch()<cr>')
-- keymap__('x', 'n', v.Slctd.srch__swtch)

-- srch forward ( srch rpl skip )
-- keymap__('x', '<c-n>', ':lua v.Srch.srch_7_slctd__srch_nxt("f")<cr>')
keymap__('x', '<c-n>', ':lua v.Srch.srch_7_slctd__srch_nxt("b")<cr>')

-- srch back
-- keymap__('x', 'xx', ':lua v.Srch.srch_7_slctd__srch_nxt('b')<cr>')

-- srch rpl one > ynk, nxt
keymap__('x', '<c-p>', v.Slctd.__rpl_7_srch_nxt)

-- srch h swtch
keymap__('x', 'M', v.Srch.str__h_swtch)
-- keymap__('x', 'M', v.Slctd.str__expnd_h)

-- rpl ( cmd )
keymap__('x', ':s', function()
  if v.Mode.is__box() then
    return ':s/\\%V<c-r>//xxx/g'
  else
    return ':s/<c-r>//xxx/g'
  end
end, {expr = bl.t})

-- rpl srch_str to cr
keymap__('x', '<c-m>', ':lua v.Slctd.line_srch_str__rpl_cr()<cr>')

-- v box edge char shft in
keymap__('x', '<c-h>', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_r_char__shft_in()<cr>'
  else
    return ':lua v.Slctd.str__reduce_dlm_l("_")<cr>'
  end
end, {expr = bl.t})

keymap__('x', '<c-u>', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_r_char__shft_in()<cr>'
  else
    return ':lua v.Slctd_str_edge_out__ins(" ")<cr>'
  end
end, {expr = bl.t})

-- fzf buf
keymap__('x', '<leader>i', v.Fzf.buf_by_slctd_str)
keymap__('x', '<leader>i', v.Fzf.buf_by_slctd_str) -- word1

-- fzf rg
keymap__('x', '<leader>o', function ()
  local str = v.Slctd.str()
  v.Fzf.rg(str)
end)

-- fzf rg word1
keymap__('x', '<leader>O', function ()
  local str = v.Slctd.str()
  v.Fzf.rg_word1(str)
end)

-- tag jmp
-- keymap__('x', 't', v.Buf.opn_by_slctd_line)

-- sys cmd by slctd line
keymap__('x', ':r', v.Sys.sh_by_slctd_line)

-- sys cmd math by slctd line

keymap__('x', ':ma', v.Sys.math_by_slctd_line)

-- sys cmd opn

-- sys cmd opn app
keymap__('x', 'go', v.Sys.opn_app_by_slctd_line)

-- sys cmd opn ggl srch
keymap__('x', 'ggl', v.Sys.opn_ggl_srch_by_slctd_str)

-- sys cmd opn youtube video_id
keymap__('x', 'gy', v.Sys.opn_yt_by_slctd_str)

-- trns
keymap__('x', 'r', v.Sys.trns_by_slctd_str)

-- cmd

-- cmd history ( fzf )
-- keymap__('x', '<leader>xx', ':FzfCmdHstry<cr>')

-- tst
keymap__('x', ':z', ':lua v.Tst.tst()<cr>')


-- mode insert

-- mode insert esc / nop

keymap__('i', '<leader>'  , '<esc>')
keymap__('i', '<esc>'     , '<esc>')
keymap__('i', '<esc><esc>', '<esc>')
   
keymap__('i', '<tab>'    , '<nop>')
keymap__('i', '<s-tab>'  , '<nop>')
keymap__('i', '<c-tab>'  , '<nop>')
keymap__('i', '<c-space>', '<nop>')
keymap__('i', '<c-space>', '<nop>')  -- ?? todo research
keymap__('i', '<c-space>', '<nop>')
   
keymap__('i', '<c-_>', '<nop>')  -- non ?
keymap__('i', '<c-^>', '<nop>')
keymap__('i', '<c-->', '<nop>')
keymap__('i', '<c-@>', '<nop>')  -- non
keymap__('i', '<c-,>', '<nop>')  -- non
keymap__('i', '<c-.>', '<nop>')  -- non
keymap__('i', '<c-:>', '<nop>')  -- non
keymap__('i', '<c-;>', '<nop>')  -- non

keymap__('i', '<c-\\>', '<nop>')

keymap__('i', '<c-a>', '<nop>')
keymap__('i', '<c-b>', '<nop>')
keymap__('i', '<c-f>', '<nop>')
keymap__('i', '<c-g>', '<nop>')
keymap__('i', '<c-i>', '<nop>')
keymap__('i', '<c-k>', '<nop>')
keymap__('i', '<c-n>', '<nop>')
keymap__('i', '<c-o>', '<nop>')
keymap__('i', '<c-p>', '<nop>')
keymap__('i', '<c-q>', '<nop>')
keymap__('i', '<c-r>', '<nop>')
keymap__('i', '<c-s>', '<nop>')
keymap__('i', '<c-t>', '<nop>')
keymap__('i', '<c-u>', '<nop>')
keymap__('i', '<c-y>', '<nop>')
   
keymap__('i', '<leader>f', '<nop>')
keymap__('i', '<leader>i', '<nop>')

-- esc / nop end

-- quit, esc
keymap__('i', '<esc>', function()
  if     v.Mode.is__ins_menu() then
    return '<c-e>'
  elseif v.Cursor.is_col__line_top0() then
    return '<esc>'
  else
    return '<esc>l'
  end
end, {expr = bl.t})

keymap__('i', '<c-c>', function()
  if     v.Mode.is__ins_menu() then
    return '<c-e>'
  elseif v.Cursor.is_col__line_top0() then
    return '<esc>'
  else
    return '<esc>l'
  end
end, {expr = bl.t})

-- cursor mv in line top
-- keymap__('i', '<c-a>', '<c-o>^')
-- keymap__('i', '<c-a>', '<c-o>0')

-- dev anchor  continue

-- cursor mv in line end
keymap__('i', '<c-e>', '<c-o>$')

-- cursor mv char forward
keymap__('i', '<c-l>', '<c-o>l')

-- cursor mv char back
keymap__('i', '<c-s>', '<c-o>h')
keymap__('i', '<c-o>', function()
  if v.Mode.is__ins_menu() then
    return '<c-y>'
  else
    return '<c-o>h'
  end
end, {expr = bl.t})

-- cursor mv word forward
-- keymap__('i', 'xx', '<c-o>e<c-o>l')

-- cursor mv word back
-- keymap__('i', '<c-o>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-y>'
--   else
--     return '<c-o>b'
--   end
-- end, {expr = bl.t})

-- cursor mv d
-- keymap__('i', '<c-n>', '<c-o>j')

-- cursor mv u
-- keymap__('i', '<c-p>', '<c-o>k')

-- ins cr
keymap__('i', '<c-m>', '<cr>')

-- ins tab
keymap__('i', '<tab>', '<c-v><tab>')

-- ins cmplt default
keymap__('i', '<leader>f', '<c-p>')
keymap__('i', '<c-a>'    , '<c-p>')

-- keymap__('i', '<c-y>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return '<c-n>'
--   end
-- end, {expr = bl.t})

-- ins bracket
keymap__('i', '<c-u>', function()
  if v.Mode.is__ins_menu() then
    return '<c-n>'
  else
    return '<c-r>=v:lua.v.Ins.quote()<cr>'
  end
end, {expr = bl.t})

-- ins quote
keymap__('i', '<c-j>', function()
  if v.Mode.is__ins_menu() then
    return '<c-n>'
  else
    return '<c-r>=v:lua.v.Ins.bracket()<cr>'
  end
end, {expr = bl.t})

-- ins num
keymap__('i', '<c-y>', '<c-r>=v:lua.v.Ins.num()<cr>')

-- ins symbol
keymap__('i', '<c-n>', '<c-r>=v:lua.v.Ins.symbol01()<cr>')
keymap__('i', '<c-f>', '<c-r>=v:lua.v.Ins.symbol02()<cr>')
keymap__('i', '<c-p>', '<c-r>=v:lua.v.Ins.symbol03()<cr>')

-- ins markdown
-- keymap__('i', '<c-u>', '<c-r>=v:lua.v.Ins.markdown_lnk()<cr>')

-- ins week
-- keymap__('i', 'xx', '<c-r>=v:lua.v.Ins.week()<cr>')

-- ins register
-- keymap__('i', 'xx', '<c-r>=v:lua.v.Ins.reg()<cr>')

-- del char forward
keymap__('i', '<c-d>', '<c-o>x')

-- del char back
keymap__('i', '<c-h>', '<c-h>')

-- del word back
keymap__('i', '<c-w>', '<c-w>')

-- del word forword
keymap__('i', '<c-k>', function()
  if v.Mode.is__ins_menu() then
    return '<c-p>'
  else
    return '<c-o>dw'
  end
end, {expr = bl.t})

-- del line
-- " non

-- paste
-- keymap__('i', 'xx', '<c-r>0')

-- paste clp
keymap__('i', '<c-v>', '<c-r><c-o>+')

-- clr
-- keymap__('i', '<esc>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return ''
--   end
-- end, {expr = bl.t})

-- keymap__('i', '<c-w>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return '<c-w>'
--   end
-- end, {expr = bl.t})

-- numpad shift
keymap__('i', '<kInsert>'  , '0')
keymap__('i', '<kEnd>'     , '1')
keymap__('i', '<kDown>'    , '2')
keymap__('i', '<kPageDown>', '3')
keymap__('i', '<kLeft>'    , '4')
keymap__('i', '<kOrigin>'  , '5')
keymap__('i', '<kRight>'   , '6')
keymap__('i', '<kHome>'    , '7')
keymap__('i', '<kUp>'      , '8')
keymap__('i', '<kPageUp>'  , '9')


-- mode cmd

-- quit
keymap__('c', '<c-q>', '<c-c>')

-- cursor mv line in
keymap__('c', '<c-a>', '<c-b>')
keymap__('c', '<c-e>', '<c-e>')
-- keymap__('c', '<c-a>', '<home>')
-- keymap__('c', '<c-e>', '<end>' )

-- cursor mv char
keymap__('c', '<c-s>', '<Left>')
keymap__('c', '<c-l>', '<Right>')

-- cursor mv word
keymap__('c', '<c-o>', '<s-left>')
keymap__('c', '<c-f>', '<s-right>')

-- del char
keymap__('c', '<c-h>', '<bs>')
keymap__('c', '<c-d>', '<del>')

-- del word forward
-- "cnoremap ?? non ? idea <s-right><c-w>
keymap__('c', '<c-k>', '<del>')

-- del word back
keymap__('c', '<c-w>', '<c-w>')

-- del in line back
keymap__('c', '<c-u>', '<c-u>')

-- paste
keymap__('c', '<c-v>', '<c-r>a')

-- history
-- keymap__('c', '<c-p>', '<Up>'  )
-- keymap__('c', '<c-n>', '<Down>')

-- cmdline win
keymap__('c', '<c-_>', '<c-f>')

-- numpad shift
keymap__('c', '<kInsert>'  , '0')
keymap__('c', '<kEnd>'     , '1')
keymap__('c', '<kDown>'    , '2')
keymap__('c', '<kPageDown>', '3')
keymap__('c', '<kLeft>'    , '4')
keymap__('c', '<kOrigin>'  , '5')
keymap__('c', '<kRight>'   , '6')
keymap__('c', '<kHome>'    , '7')
keymap__('c', '<kUp>'      , '8')
keymap__('c', '<kPageUp>'  , '9')


-- mode term

-- term > normal
keymap__('t', '<c-_>', '<c-\\><c-n>')


