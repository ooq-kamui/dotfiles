
-- key map

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
vim.keymap.set('n', "'", '<esc>')
vim.keymap.set('n', '"', '<esc>')
vim.keymap.set('n', '`', '<esc>')
vim.keymap.set('n', '#', '<esc>')
vim.keymap.set('n', '$', '<esc>')
vim.keymap.set('n', '%', '<esc>')  -- ?
vim.keymap.set('n', '&', '<esc>')
vim.keymap.set('n', '(', '<esc>')
vim.keymap.set('n', ')', '<esc>')
vim.keymap.set('n', '{', '<esc>')
vim.keymap.set('n', '}', '<esc>')
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
vim.keymap.set('n', 'p', '<esc>')
vim.keymap.set('n', 'q', '<esc>')
vim.keymap.set('n', 'r', '<esc>')
vim.keymap.set('n', 's', '<esc>')
vim.keymap.set('n', 't', '<esc>')
vim.keymap.set('n', 'u', '<esc>')
vim.keymap.set('n', 'v', '<esc>')
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
vim.keymap.set('n', ':n', ':k')
vim.keymap.set('n', ':o', ':k')
vim.keymap.set('n', ':p', ':p')
vim.keymap.set('n', ':q', ':q')
vim.keymap.set('n', ':r', ':r')
vim.keymap.set('n', ':s', ':s')
vim.keymap.set('n', ':t', ':s')
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
vim.keymap.set('n', '<leader>x', '<esc>')
vim.keymap.set('n', '<leader>y', '<esc>')

vim.keymap.set('n', '<leader>L', '<esc>')
vim.keymap.set('n', '<leader>M', '<esc>')
vim.keymap.set('n', '<leader>O', '<esc>')

-- mode normal esc end


-- quit buffer
vim.keymap.set('n', 'w',  v.Buf__quit_swtch)

-- quit buffer force
vim.keymap.set('n', ':q', ':q!')

-- quit vim
vim.keymap.set('n', 'W', ':q<cr>')

-- quit tab other
-- vim.keymap.set('n', 'xx', ':tabo<cr>')

-- background job
-- vim.keymap.set('n', '<c-z>', '<c-z>')

-- save
vim.keymap.set('n', 'a', ':lua v.Buf.save()<cr>')

-- load re slf
-- vim.keymap.set('n', 'xx', ':lua v.Load_re()')

-- load re init vim
-- vim.keymap.set('n', 'xx', ':source ~/wrk/prj-pri/dotfiles/nvim/scrpt/init.vim')

-- opn

-- opn file
-- vim.keymap.set('n', ':o', ':Opn ')
vim.keymap.set('n', ':o', ':Oil . ')

-- opn view ltst
vim.keymap.set('n', 'gu', ':lua v.Buf.opn_view_ltst()<cr>')

-- opn file srch  ( fzf )
vim.keymap.set('n', '<leader>l', ':lua v.Fzf_file()<cr>')

-- opn file hstry ( fzf )
vim.keymap.set('n', '<leader>y', ':FzfFileHstry<cr>')
-- vim.keymap.set('n', '<leader>h', ':FzfFileHstry<cr>')

-- opn etc

-- opn fish cnf
-- vim.keymap.set('n', 'xx', ':lua v.Buf.opn_fish_cnf()<cr>')

-- opn init vim
vim.keymap.set('n', 'gh', ':lua v.Buf.opn_init_vim()<cr>')
vim.keymap.set('n', 'gl', ':lua v.Buf.opn_init_vim_l()<cr>')

-- opn tmp file
-- vim.keymap.set('n', 'xx', ':lua v.Buf.opn_tmp_file()<cr>')

-- opn memo
-- vim.keymap.set('n', 'xx', ':lua v.Buf.opn_memo()<cr>')

-- opn man
-- vim.keymap.set('n', 'xx', ':OpnMan ')

-- sys cmd opn

-- sys cmd opn app
vim.keymap.set('n', 'go', ':lua v.Sys.cmd_opn_app_by_cursor_path()<cr>')

-- sys cmd opn app slf
-- vim.keymap.set('n', 'xx', ':lua v.Sys.cmd_opn_app_buf_file()<cr>')

-- sys cmd opn dir slf
vim.keymap.set('n', 'gd', ':lua v.Sys.cmd_opn_buf_file_dir()<cr>')

-- sys cmd opn brwsr
-- vim.keymap.set('n', 'xx', ':lua v.Sys.cmd_opn_brwsr()<cr>')

-- sys cmd opn ggl srch
vim.keymap.set('n', 'ggl', ':lua v.Sys.cmd_opn_ggl_srch("")<cr>')

-- cursor mv

-- cursor mv drct
vim.keymap.set('n', '<Right>', 'l')
vim.keymap.set('n', '<Left>' , 'h')
vim.keymap.set('n', '<Up>'   , 'k')
vim.keymap.set('n', '<Down>' , 'j')

-- cursor mv line
vim.keymap.set('n', 'k', ':lua v.Cursor.__mv_u()<cr>')
vim.keymap.set('n', 'j', ':lua v.Cursor.__mv_d()<cr>')

-- cursor mv line mlt
vim.keymap.set('n', '<c-k>', ':lua v.Cursor.__mv_mlt_u()<cr>')
vim.keymap.set('n', '<c-j>', ':lua v.Cursor.__mv_mlt_d()<cr>')

-- cursor mv line top | ins line
vim.keymap.set('n', 'y', ':lua v.Cursor.__mv_line_top_or_new_line()<cr>')

-- cursor mv line top
vim.keymap.set('n', '<c-a>', '0')

-- cursor mv line end
vim.keymap.set('n', '<c-y>', function()
  if v.Cursor.is_col__line_end() then
    return ':lua v.Cursor.__ins_markdown_cr()<cr>'
  else
    return ':lua v.Cursor.__mv_line_end()<cr>'
  end
end, {expr = true})

-- cursor mv char - forward
vim.keymap.set('n', 'l', 'l')

-- cursor mv char - back
vim.keymap.set('n', '<c-s>', 'h')
-- vim.keymap.set('n', '<c-o>', 'h')

-- cursor mv word - forward
vim.keymap.set('n', 'f', ':lua v.Cursor.__mv_word_f()<cr>')

-- cursor mv word - back
vim.keymap.set('n', 'o', ':lua v.Cursor.__mv_word_b()<cr>')

-- cursor mv word - back pre
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.__mv_word_b_pre()<cr>')

-- cursor mv word dlm _ forward
vim.keymap.set('n', '_', 'f_')
-- vim.keymap.set('n', '_', 'f_l')

-- cursor mv word dlm _ back
vim.keymap.set('n', '<c-o>', 'hT_')
-- vim.keymap.set('n', '<c-s>', 'hT_')
vim.keymap.set('n', '<c-_>', 'hT_')
vim.keymap.set('n', '\\'   , 'T_h')
vim.keymap.set('n', '<bar>', 'T_h')

-- cursor mv word dlm ( camel or _ )  -  forward
vim.keymap.set('n', '<c-f>', ':lua v.Cursor.__mv_word_dlm_f()<cr>')

-- cursor mv fnc name
vim.keymap.set('n', 'F', ':lua v.Cursor.__mv_fnc_name()<cr>')

-- cursor mv fnc out back
-- vim.keymap.set('n', '<', '[m')

-- cursor mv bracket pair
vim.keymap.set('n', '<c-l>', '%')

-- cursor mv bracket out back
vim.keymap.set('n', '<', '[{')

-- cursor mv indnt auto
-- vim.keymap.set('n', 'xx', ':lua v.Cursor__mv_indnt_auto()<cr>') -- todo dev

-- cursor mv file edge bgn
vim.keymap.set('n', 'gk', ':lua v.Cursor.__mv_file_edge_bgn()<cr>')

-- cursor mv file edge end
vim.keymap.set('n', 'gj', ':lua v.Cursor.__mv_file_edge_end()<cr>')

-- cursor mv edit latest
-- vim.keymap.set('n', 'xx', '`.')

-- cursor mv jmp
vim.keymap.set('n', 'rk', ':lua v.Cursor.__mv_v_jmp("k")<cr>')
vim.keymap.set('n', 'rj', ':lua v.Cursor.__mv_v_jmp("j")<cr>')

vim.keymap.set('n', 'r<space>k', ':lua v.Cursor.__mv_v_jmp_char("k", "f")<cr>')
vim.keymap.set('n', 'r<space>j', ':lua v.Cursor.__mv_v_jmp_char("j", "f")<cr>')

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
vim.keymap.set('n', 'i', ':lua v.Slctd.str__word()<cr>')

-- slctd __ char current - word end
vim.keymap.set('n', 'I', 've')

-- slct visual
vim.keymap.set('n', '<c-v>', 'v')

-- slct visual box
vim.keymap.set('n', 'v', '<c-v>')

-- slct all
-- vim.keymap.set('n', 'xx', ':lua v.Rgstr.ynk__line_all()<cr>')

-- slct re
vim.keymap.set('n', 'rr', ':lua v.Slctd.__ltst()<cr>')

-- ynk clr
vim.keymap.set('n', '<c-c>', ':lua v.Rgstr.ynk__clr()<cr>')

-- ynk line
vim.keymap.set('n', 'c', ':lua v.Rgstr.ynk__cursor_line()<cr>')

-- ynk char
-- vim.keymap.set('n', 'xx', '"ayl')

-- ynk slf path
vim.keymap.set('n', 'gs', ':lua v.Rgstr.ynk__buf_file_path()<cr>')

-- ojroques/nvim-osc52
vim.keymap.set('n', 'C', ':lua osc52.copy_register("a")<cr>')

-- paste
vim.keymap.set('n', 'p', ':lua v.Cursor.__ins_ynk()<cr>')

-- paste box
vim.keymap.set('n', 'rp', ':lua v.Cursor.__ins_ynk_box()<cr>')

-- paste clp
vim.keymap.set('n', 'P', ':lua v.Cursor.__ins_clp()<cr>')

-- paste rgstr history ( fzf )
vim.keymap.set('n', '<leader>v', ':FzfRgstr<cr>')
-- vim.keymap.set('n', '<leader>r', ':FzfRgstr<cr>')

-- undo
vim.keymap.set('n', 'h'    , 'u'    )

-- redo
vim.keymap.set('n', '<c-h>', '<c-r>')

-- undo history clr
vim.keymap.set('n', ':h', ':lua v.Undo__clr()')
vim.keymap.set('n', 'H' , ':lua v.Undo__clr()')

-- repeat
-- vim.keymap.set('n', 'xx', '.')

-- repeat fnc
vim.keymap.set('n', '^', ':lua v.Repeat_fnc()<cr>')
vim.keymap.set('n', '-', ':lua v.Repeat_fnc()<cr>')
vim.keymap.set('n', '/', ':lua v.Repeat_fnc()<cr>')

-- macro rec
-- vim.keymap.set('n', '`', 'q')
vim.keymap.set('n', '`', function()
  if vim.fn.reg_recording() == '' then
    return 'qa'
  else
    return 'q'
  end
end, {expr = true})

-- macro ply
-- vim.keymap.set('n', '@', '1@a')
vim.keymap.set('n', '@', function()
  if vim.fn.reg_recording() == '' then
    return '1@a'
  else
    return 'q'
  end
end, {expr = true})

-- 
-- edit
-- 

-- mode ch ins
vim.keymap.set('n', '<space>', 'i')

-- mode ch ins rpl
-- vim.keymap.set('n', 'xx', 'R')

-- ins cr
vim.keymap.set('n', 'm', ':lua v.Cursor.__ins_cr()<cr>')

-- ins space
vim.keymap.set('n', 'L', ':lua v.Cursor.__ins_space(false)<cr>')

-- ins equal
vim.keymap.set('n', '2', 'i=<esc>')

-- ins period
vim.keymap.set('n', '.', 'i.<esc>')

-- ins comma
vim.keymap.set('n', ',', 'i, <esc>l')

-- ins comma $, nxt line
-- vim.keymap.set('n', 'xx', 'A,<esc>j')

-- ins hyphen
vim.keymap.set('n', '0', ':lua v.Cursor.__ins_hyphen()<cr>')

-- ins quote
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.__ins_quote()<cr>')

-- ins date
vim.keymap.set('n', '*', ':lua v.Cursor.__ins_da()<cr>')

-- ins time
vim.keymap.set('n', 'Y', ':lua v.Cursor.__ins_tm()<cr>')

-- ins date time
-- vim.keymap.set('n', 'x', ':lua v.Cursor.__ins_dt()<cr>')

-- ins day of week
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.__ins_week()<cr>')

-- ins slf path
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.__ins_line_buf_file_path()<cr>')

-- ins anchor
vim.keymap.set('n', 'A', ':lua v.Cursor.__ins_line_anchor()<cr>')

-- ins markdown code
vim.keymap.set('n', '<c-u>', ':lua v.Cursor.__ins_markdown_code()<cr>')

-- ins markdown itm
vim.keymap.set('n', 'O', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_itm()<cr>'
  else
    return ':lua v.Cursor.line_indnt__shft_r()<cr>'
  end
end, {expr = true})

-- ins dots ( or crnt )
vim.keymap.set('n', 'ru', ':lua v.Cursor.line_end__dots_adjst()<cr>')

-- ins line emp
-- " ref nnoremap y

-- ins comment mlt
vim.keymap.set('n', '$', ':lua v.Cursor.__ins_cmnt_mlt()<cr>')

-- ins comment 1
vim.keymap.set('n', '!', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = true})

vim.keymap.set('n', '1', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = true})

vim.keymap.set('n', '"', function()
  if v.Buf.is_file_type__('markdown') then
    return ':lua v.Cursor.__ins_markdown_h()<cr>'
  else
    return ':lua v.Cursor.__ins_cmnt_1("^")<cr>'
  end
end, {expr = true})

-- ins __ line indnt space
vim.keymap.set('n', 'V', ':lua v.Cursor.d__ins_line_space()<cr>')

-- cahr rpl, under score
-- vim.keymap.set('n', '<bar>', ':lua v.Cursor.char__rpl_underscore()<cr>')

-- tgl markdown chk
-- vim.keymap.set('n', 'xx', ':lua v.Char_markdown_chk__tgl()<cr>')

-- del char
vim.keymap.set('n', 's', ':lua v.Cursor.c_char__del()<cr>')

-- del char ynk
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.c_char__del_ynk()<cr>')

-- line del
vim.keymap.set('n', 'd', ':lua v.Cursor.line__del()<cr>')

-- line forward del
vim.keymap.set('n', '<c-d>', 'D')

-- word back    del
-- vim.keymap.set('n', 'xx', 'hvbd')

-- word forward del
-- vim.keymap.set('n', 'xx', function()
--   if v.Cursor.is_col__line_end() then
--     return '<esc>'
--   else
--     return '"zdw'
--   end
-- end, {expr = true})

-- vim.keymap.set('n', 'xx', function()
--   if v.Cursor.is_col__line_end() then
--     return '<esc>'
--   else
--     return '"zde'
--   end
-- end, {expr = true})

-- del cr ( line join )
vim.keymap.set('n', '<c-m>'  , 'J')
vim.keymap.set('n', '<enter>', 'J')

-- line mv up
-- vim.keymap.set('n', 'xx', '"addk"aP')

-- line dpl  -- todo fnc cre
-- vim.keymap.set('n', 'D', '"zyy"zP')
vim.keymap.set('n', 'D', ':lua v.Line.__dpl()<cr>')

-- char tgl 01 ( ?? / num icl  )
vim.keymap.set('n', 'u', ':lua v.Char.__tgl_swtch01()<cr>')

-- char tgl 02 ( type ch / num dcl )
vim.keymap.set('n', 'U', ':lua v.Char.__tgl_swtch02()<cr>')

-- indnt shft
vim.keymap.set('n', 'ri', ':lua v.Cursor.line_indnt__shft_l()<cr>')
vim.keymap.set('n', 'ro', ':lua v.Cursor.line_indnt__shft_r()<cr>')

-- indnt add
-- vim.keymap.set('n', 'xx', ':lua v.Cursor.line_indnt__add(2)<cr>')

-- indnt crct
vim.keymap.set('n', 're', ':lua v.Cursor.line_indnt__crct()<cr>')

-- cursor l char col __ crct
vim.keymap.set('n', 'q', ':lua v.Cursor.f_str__crct_by_line_u()<cr>')
vim.keymap.set('n', 'Q', ':lua v.Cursor.f_str__crct_by_line_d()<cr>')

-- 
-- srch
-- 

-- srch hl init
vim.keymap.set('n', 'S', '/<cr>N')
-- vim.keymap.set('n', 'xx', ':lua v.Srch_init()<cr>')

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
vim.keymap.set('n', 'n'    , ':lua v.Cursor.__mv_srch("f")<cr>')

-- srch back
vim.keymap.set('n', '<c-n>', ':lua v.Cursor.__mv_srch("b")<cr>')

-- srch str set
vim.keymap.set('n', 'e', ':lua v.Srch.str__cursor_word()<cr>')

-- srch str set ( word 1 )
vim.keymap.set('n', 'E', ':lua v.Srch.str__word1_tgl()<cr>')

-- srch char bracket forward
-- vim.keymap.set('n', 'xx', ':lua v.Srch.char_bracket('f')<cr>')

-- srch markdown h
vim.keymap.set('n', 'M', ':lua v.Srch.str__h_swtch();v.Cursor.__mv_srch("f")<cr>')

-- srch markdown itm
vim.keymap.set('n', ':i', ':lua v.Srch.str__markdown_itm()<cr>')

-- srch str history ( fzf )
vim.keymap.set('n', '<leader>f', ':FzfSrchHstry<cr>')

-- srch str set prv ( tgl )
vim.keymap.set('n', 'N', ':lua v.Srch.str__prv_tgl()<cr>')

-- srch rpl one > ynk nxt ( only srch )
vim.keymap.set('n', '<c-p>', ':lua v.Srch.slct("f")<cr>')

-- srch ?=ts
-- vim.keymap.set('n', 'xx', '/?ts=<cr>')

-- rpl ( cmd )
vim.keymap.set('n', ':s', ':%s/<c-r>//xxx/g')
-- vim.keymap.set('n', ':s', ':%s///g')
-- vim.keymap.set('n', ':s', ':Rpl ')

-- fzf rg
vim.keymap.set('n', '<leader>o', ':lua v.Fzf_rg(nil)<cr>')

-- fzf rg fltr ext
vim.keymap.set('n', '<leader>O', ':FzfRgExt js')

-- fzf rg with run
-- vim.keymap.set('n', '<leader>O', ':FzfRgWithRun <cr>')

-- fzf buf
vim.keymap.set('n', '<leader>i', ':lua v.N_fzf_buf()<cr>')

-- fzf jmplst
vim.keymap.set('n', '<leader>e', ':FzfJmplst<cr>')

-- fzf pth lst
-- vim.keymap.set('n', '<leader>xx', ':FzfTagjmpByFile <cr>')

-- tag jmp tab new
vim.keymap.set('n', 't', ':lua v.Buf.opn_by_cursor_line()<cr>')

-- 
-- cmd
-- 

-- cmd history ( fzf )
vim.keymap.set('n', '<leader>r', ':FzfCmdHstry<cr>')
-- vim.keymap.set('n', '<leader>j', ':FzfCmdHstry<cr>')

-- sys cmd
vim.keymap.set('n', ':!', ':!')
vim.keymap.set('n', ':1', ':!')

-- ins sys cmd ( read )
-- vim.keymap.set('n', ':r', ':InsSysCmd ')

-- pth
vim.keymap.set('n', ':p', ':Pth <cr>')

-- cd slf
vim.keymap.set('n', ':d', ':lua v.Dir.__buf_file_dir()')
-- dev anchor
-- vim.keymap.set('n', ':d', ':lua v.Dir.__nvim_start()')

-- cd parent
vim.keymap.set('n', ':k', ':K')

-- fzf cd
vim.keymap.set('n', '<leader>d', ':lua v.Fzf_dir()<cr>')

-- fzf cd ( dir jmp )
vim.keymap.set('n', '<leader>x', ':lua v.Fzf_dir_jmp()<cr>')
-- vim.keymap.set('n', '<leader>y', ':lua v.Fzf_dir_jmp()<cr>')

-- fzf doc memo
vim.keymap.set('n', '<leader>m', ':lua v.Fzf_doc_memo_opn()<cr>')

-- fzf vim fnc call
vim.keymap.set('n', '<leader>c', ':lua v.Fzf_vim_fnc_call()<cr>')

-- fzf doc tech
vim.keymap.set('n', '<leader>t', ':lua v.Fzf_doc_tech()<cr>')

-- 
-- tab
-- 

-- tab mv
vim.keymap.set('n', '<tab>'  , 'gt')
vim.keymap.set('n', '<s-tab>', 'gT')

-- tab order
vim.keymap.set('n', '<s-left>' , ':tabm-1<cr>')
vim.keymap.set('n', '<s-right>', ':tabm+1<cr>')

-- buf

-- buf list
-- vim.keymap.set('n', ':xx', ':buffers')

-- buf fltr
vim.keymap.set('n', ':f', ':%! jq')
-- vim.keymap.set('n', 'xx', ':lua v.Buf__fltr()<cr>') -- use not

-- win ( buf )

-- win ( buf ) splt quit
-- vim.keymap.set('n', 'rq', ':lua v.Win_splt__quit()<cr>')

-- win ( buf ) splt h
vim.keymap.set('n', 'rh', ':lua v.Win__splt_h()<cr>')

-- win ( buf ) splt v
vim.keymap.set('n', 'rn', ':lua v.Win__splt_v()<cr>')
vim.keymap.set('n', 'rv', ':lua v.Win__splt_v()<cr>')

-- win ( buf ) size w __ +
vim.keymap.set('n', '{', '<c-w>>')

-- win ( buf ) nxt
vim.keymap.set('n', '<c-w>', ':lua v.Win_splt_cursor__mv_nxt()<cr>')

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
   -- vim.keymap.set('n', ':n', ':set relativenumber!')
vim.keymap.set('n', ':n', ':normal! ')

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

-- mode ch line
vim.keymap.set('v', 'i', ':lua v.Slctd.mode__tgl()<cr>')

-- mode ch visual box
vim.keymap.set('v', 'v', ':lua v.Slctd.state__swtch()<cr>')

-- file srch ( fzf )
-- vim.keymap.set('v', '<leader>xx', '"zy:FzfFile <c-r>z')

-- cursor mv

-- cursor mv slctd edge tgl
vim.keymap.set('v', 'y', ':lua v.Cursor.__mv_slctd_edge_tgl()<cr>')

-- cursor mv slctd edge tgl, v box line same
vim.keymap.set('v', 'O', 'O')

-- cursor mv char forward
vim.keymap.set('v', 'l', 'l')

-- cursor mv char back
vim.keymap.set('v', '<c-o>', 'h')

-- cursor mv word back
-- vim.keymap.set('v', 'xx', 'b')
-- vim.keymap.set('v', 'xx', 'bh')
-- vim.keymap.set('v', 'xx', 'Bh')

-- cursor mv line end
vim.keymap.set('v', '<c-y>', ':lua v.Slctd.cursor__mv_line_end()<cr>')

-- slctd str r __ reduce dlm
vim.keymap.set('v', 'h', ':lua v.Slctd.str_r__reduce_dlm("_")<cr>')
-- vim.keymap.set('v', '<c-h>', 'of_lo')
-- vim.keymap.set('v', '_'    , 'of_lo')

-- slctd str l __ reduce dlm
vim.keymap.set('v', '<c-h>'    , ':lua v.Slctd.str_l__reduce_dlm("_")<cr>')
-- vim.keymap.set('v', '<c-_>', 'F_h')
-- vim.keymap.set('v', 'h', 'F_h')
-- vim.keymap.set('v', 'H'    , 'F_h')

-- cursor mv space forward ( word pre )
-- vim.keymap.set('v', 'xx', 'wh')

-- cursor mv line
vim.keymap.set('v', '<c-j>', '10j')
vim.keymap.set('v', '<c-k>', '10k')

-- cursor mv jmp
vim.keymap.set('v', 'rk', ':lua v.Slctd.cursor__mv_v_jmp("k")<cr>')
vim.keymap.set('v', 'rj', ':lua v.Slctd.cursor__mv_v_jmp("j")<cr>')

-- cursor mv bracket pair
vim.keymap.set('v', '<c-l>', '%')

-- cursor mv bracket out back
-- vim.keymap.set('v', 'xx', '[{')

-- cursor mv bracket fnc back
-- vim.keymap.set('v', 'xx', '[m')

-- cursor mv file edge back    ( file bgn )
vim.keymap.set('v', 'gk', ':lua v.Slctd.cursor__mv_file_edge("k")<cr>')

-- cursor mv file edge forward ( file end )
vim.keymap.set('v', 'gj', ':lua v.Slctd.cursor__mv_file_edge("j")<cr>')

-- slct / ynk / paste

-- slctd expnd
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str__expnd()')

-- slctd expnd srch
vim.keymap.set('v', 'N', ':lua v.Slctd.str__expnd_srch()<cr>')

-- slctd expnd word forward
vim.keymap.set('v', 'f', ':lua v.Slctd.str__expnd_f()<cr>')

-- slctd expnd quote
vim.keymap.set('v', '<tab>', ':lua v.Slctd.str__expnd_quote_swtch()<cr>')
vim.keymap.set('v', '<c-i>', ':lua v.Slctd.str__expnd_quote_swtch()<cr>')

-- slctd expnd quote on
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str__expnd_quote_on_swtch()<cr>')

-- slctd expnd quote in
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str__expnd_quote_in_swtch()<cr>')

-- slctd expnd bracket forward
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str__expnd_bracket_f()<cr>')

-- slct all
vim.keymap.set('v', 'a', ':lua v.Slctd.str__all()<cr>')

-- ynk slctd
vim.keymap.set('v', 'o', ':lua v.Rgstr.ynk__slctd()<cr>')

-- ynk slctd add
-- vim.keymap.set('v', 'xx', ':lua v.Rgstr.ynk__add_slctd()<cr>')

-- clp slctd
-- vim.keymap.set('v', 'xx', '"+y')

-- paste
-- " todo refactoring
vim.keymap.set('v', 'p', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_l__ynk_line_1()<cr>'
  else
    return ':lua v.Slctd.str__ynk()<cr>'
  end
end, {expr = true})

-- paste clp
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str__clp()<cr>')

-- paste visual box
-- vim.keymap.set('v', 'xx', 'I<c-r>0<esc>')

-- edit

-- ins | cut & ins
vim.keymap.set('v', '<space>', function()
  if v.Mode.is__box() then
    return 'I'
  else
    return 'c'
  end
end, {expr = true})

-- cut & ins
-- vim.keymap.set('v', '<leader><space>', '"zc')

-- ins $
vim.keymap.set('v', 'Y', function()
  if v.Mode.is__box() then
    return '$A'
  else
    return '<c-v>$A'
  end
end, {expr = true})

-- ins space
vim.keymap.set('v', 'L', function()

  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_l__ins_space()<cr>'
  else
    return ':lua v.Slctd.line_indnt__shft_r()<cr>'
  end
end, {expr = true})

-- line __ ins comment 1
vim.keymap.set('v', '!', ':lua v.Slctd.line__ins_cmnt_1()<cr>')
vim.keymap.set('v', '1', ':lua v.Slctd.line__ins_cmnt_1()<cr>')
vim.keymap.set('v', '"', ':lua v.Slctd.line__ins_cmnt_1()<cr>')

-- line end __ ins comma
vim.keymap.set('v', ',', ':lua v.Slctd.line_end__ins(",")<cr>')

-- pad space
vim.keymap.set('v', 'S', ':lua v.Slctd.__pad_space()<cr>')

-- pad -
vim.keymap.set('v', '-', ':lua v.Slctd.__pad("-")<cr>')

-- pad |
vim.keymap.set('v', '<bar>', ':lua v.Slctd.__pad_bar()<cr>')

-- slctd str space __ under score
vim.keymap.set('v', 'q', ':lua v.Slctd.str_space__underscore()<cr>')

-- line __ join per line
vim.keymap.set('v', 'J', ':lua v.Slctd.line__join_per_line(3)')

-- del str > ynk
vim.keymap.set('v', 'd', function()
  if v.Mode.is__box() then
    return '"ad:let @+ = @a<cr>gv'
  else
    return '"ad:let @+ = @a<cr>'
  end
end, {expr = true})

-- vim.keymap.set('v', 'xx', ':lua v.Slctd.v__del()<cr>')

-- del str > ynk not
vim.keymap.set('v', 's', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.__del()<cr>'
  else
    return '"zx'
  end
end, {expr = true})

-- line mlt forward del
vim.keymap.set('v', '<c-d>', 'D')

-- slctd line __ del line top space
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.line_top_space__del()<cr>')

-- slctd line __ del end space
vim.keymap.set('v', 'm', ':lua v.Slctd.line_end_space__del()<cr>')

-- slctd box

-- slctd box __ del cursor f space
vim.keymap.set('v', 'K', ':lua v.Slctd.box_cursor_r_space__crct()<cr>')

-- slctd str edge out quote __ tgl
vim.keymap.set('v', 'w', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_width__1()<cr>'
  else
    return ':lua v.Slctd.str_edge_out_char__tgl()<cr>'
  end
end, {expr = true})

-- slctd str edge bracket __ tgl
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.str_edge_out_bracket__tgl()<cr>')

-- slctd str edge out __ tgl shft
vim.keymap.set('v', 'W', ':lua v.Slctd.str_edge_out__tgl_shft()<cr>')

-- slctd str edge out __ ins space
-- vim.keymap.set('v', '<c-s>', ':lua v.Slctd_str_edge_out__ins(" ")<cr>')

-- slctd str edge out __ ins markdown strikethrough
vim.keymap.set('v', '~', ':lua v.Slctd.str_edge_out__ins_markdown_strikethrough()<cr>')

-- slctd str edge out __ ins markdown strikethrough
vim.keymap.set('v', 'b', ':lua v.Slctd.str_edge_out__ins_markdown_bold()<cr>')

-- slctd box str mv back
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.box_str__mv("l")<cr>')

-- slctd box str mv forward
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.box_str__mv("r")<cr>')

-- slctd box space __ del
vim.keymap.set('v', 'D', ':lua v.Slctd.box_space__del()<cr>')

-- slctd box mv back
vim.keymap.set('v', '<c-w>', ':lua v.Slctd.box__mv("l")<cr>')

-- slctd box mv forward
vim.keymap.set('v', '<c-e>', ':lua v.Slctd.box__mv("r")<cr>')

-- num icl
vim.keymap.set('v', '+', '<c-a>gv')

-- num dcl
-- vim.keymap.set('v', '-', '<c-x>gv')

-- num seq
vim.keymap.set('v', '*', 'r0gvg<c-a>gv')
--                        ^^^^^^^^^^^^> r0 gv g<c-a> gv

-- indnt shft
vim.keymap.set('v', 'ri', ':lua v.Slctd.line_indnt__shft_l()<cr>')
vim.keymap.set('v', 'ro', ':lua v.Slctd.line_indnt__shft_r()<cr>')

-- indnt crct
vim.keymap.set('v', ';', '=gv')

-- indnt tab   > space
vim.keymap.set('v', ':e', ':lua v.Slctd.line_indnt__space(2)')

-- indnt space > tab
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.line_indnt__tab(2)<cr>')

-- tidy tbl
vim.keymap.set('v', ':t', ':lua v.Slctd.line__crct_tbl()')

-- line end ovr, pad __ space
-- vim.keymap.set('v', 'xx', ':lua v.Slctd.line_end__pad_space()')

-- upper / lower tgl
vim.keymap.set('v', 'u', '~gv')

-- upper force
vim.keymap.set('v', 'U', 'Ugv')

-- lower force
-- vim.keymap.set('v', 'xx', 'ugv')

-- str mb
vim.keymap.set('v', ':m', ':lua v.Slctd.line_mb__cnv()')

-- 
-- srch
-- 

-- srch cmd
vim.keymap.set('v', '<leader>k', '"zy/<c-r>z')
-- vim.keymap.set('v', '<leader>i', '"zy/<c-r>z')

-- srch forward ( srch rpl skip )
vim.keymap.set('v', '<c-n>', ':lua v.Srch.srch_7_slctd__srch_nxt("f")<cr>')

-- srch back
-- vim.keymap.set('v', 'xx', ':lua v.Srch.srch_7_slctd__srch_nxt('b')<cr>')

-- srch str set
vim.keymap.set('v', 'n', ':lua v.Slctd.srch__swtch()<cr>')
vim.keymap.set('v', 'e', function()
  if v.Mode.is__box() then
    return '<esc>'
  else
    return ':lua v.Srch.str__slctd_str()<cr>'
  end
end, {expr = true})

-- srch rpl one > ynk, nxt
vim.keymap.set('v', '<c-p>', ':lua v.Slctd.__rpl_7_srch_nxt()<cr>')

-- srch markdown h
-- vim.keymap.set('v', 'M', ':lua v.Srch.str__h_swtch()<cr>')

-- rpl ( cmd )
vim.keymap.set('v', ':s', function()
  if v.Mode.is__box() then
    return ':VBoxRpl '
  else
    return ':s///g'
  end

  -- ':sort'
  -- ':Rpl '

end, {expr = true})

-- rpl cr ( add cr )
vim.keymap.set('v', '<c-m>', ':lua v.Slctd.line_srch_str__rpl_cr()<cr>')

-- v box edge char shft in
vim.keymap.set('v', '<c-h>', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_r_char__shft_in()<cr>'
  else
    return ':lua v.Slctd.str_l__reduce_dlm("_")<cr>'
  end
end, {expr = true})

vim.keymap.set('v', '<c-s>', function()
  if v.Mode.is__box() then
    return ':lua v.Slctd.box_edge_r_char__shft_in()<cr>'
  else
    return ':lua v.Slctd_str_edge_out__ins(" ")<cr>'
  end
end, {expr = true})

-- fzf buf
vim.keymap.set('v', '<leader>i', ':lua v.V_fzf_buf()<cr>')

-- fzf rg
vim.keymap.set('v', '<leader>o', '"zy:lua v.Fzf_rg("<c-r>z")<cr>')

-- fzf rg word1
vim.keymap.set('v', '<leader>O', '"zy:lua v.Fzf_rg_word1("<c-r>z")<cr>')

-- tag jmp
-- vim.keymap.set('v', 't', ':lua v.Buf.opn_by_slctd_line()<cr>')

-- sys cmd opn

-- sys cmd opn app
vim.keymap.set('v', 'go', ':lua v.Sys.cmd_opn_app_by_slctd_line()<cr>')

-- sys cmd opn ggl srch
vim.keymap.set('v', 'ggl', ':lua v.Sys.cmd_opn_ggl_srch_by_slctd_str()<cr>')

-- sys cmd opn youtube video_id
vim.keymap.set('v', 'gy', ':lua v.Sys.cmd_opn_yt_by_slctd_str()<cr>')

-- trns
vim.keymap.set('v', 'r', ':lua v.Sys.cmd_trns_by_slctd_str()<cr>')

-- cmd

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
  if     v.Mode.is__ins_menu() then
    return '<c-e>'
  elseif v.Cursor.is_col__line_top0() then
    return '<esc>'
  else
    return '<esc>l'
  end
end, {expr = true})

vim.keymap.set('i', '<c-c>', function()
  if     v.Mode.is__ins_menu() then
    return '<c-e>'
  elseif v.Cursor.is_col__line_top0() then
    return '<esc>'
  else
    return '<esc>l'
  end
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
  if v.Mode.is__ins_menu() then
    return '<c-y>'
  else
    return '<c-o>h'
  end
end, {expr = true})

-- cursor mv word forward
-- vim.keymap.set('i', 'xx', '<c-o>e<c-o>l')

-- cursor mv word back
-- vim.keymap.set('i', '<c-o>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-y>'
--   else
--     return '<c-o>b'
--   end
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
vim.keymap.set('i', '<c-a>'    , '<c-p>')
-- vim.keymap.set('i', '<c-y>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return '<c-n>'
--   end
-- end, {expr = true})

-- ins bracket
vim.keymap.set('i', '<c-u>', function()
  if v.Mode.is__ins_menu() then
    return '<c-n>'
  else
    return '<c-r>=v:lua.v.I_quote()<cr>'
  end
end, {expr = true})

-- ins quote
vim.keymap.set('i', '<c-j>', function()
  if v.Mode.is__ins_menu() then
    return '<c-n>'
  else
    return '<c-r>=v:lua.v.I_bracket()<cr>'
  end
end, {expr = true})

-- ins num
vim.keymap.set('i', '<c-y>', '<c-r>=v:lua.v.I_num()<cr>')

-- ins symbol
vim.keymap.set('i', '<c-n>', '<c-r>=v:lua.v.I_symbol01()<cr>')
vim.keymap.set('i', '<c-f>', '<c-r>=v:lua.v.I_symbol02()<cr>')
vim.keymap.set('i', '<c-p>', '<c-r>=v:lua.v.I_symbol03()<cr>')

-- ins markdown
-- vim.keymap.set('i', '<c-u>', '<c-r>=v:lua.v.I_markdown_lnk()<cr>')

-- ins week
-- vim.keymap.set('i', 'xx', '<c-r>=v:lua.v.I_week()<cr>')

-- ins register
-- vim.keymap.set('i', 'xx', '<c-r>=v:lua.v.I_reg()<cr>')

-- del char forward
vim.keymap.set('i', '<c-d>', '<c-o>x')

-- del char back
vim.keymap.set('i', '<c-h>', '<c-h>')

-- del word back
vim.keymap.set('i', '<c-w>', '<c-w>')

-- del word forword
vim.keymap.set('i', '<c-k>', function()
  if v.Mode.is__ins_menu() then
    return '<c-p>'
  else
    return '<c-o>dw'
  end
end, {expr = true})

-- del line
-- " non

-- paste
-- vim.keymap.set('i', 'xx', '<c-r>0')

-- paste clp
vim.keymap.set('i', '<c-v>', '<c-r><c-o>+')

-- clr
-- vim.keymap.set('i', '<esc>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return ''
--   end
-- end, {expr = true})

-- vim.keymap.set('i', '<c-w>', function()
--   if v.Mode.is__ins_menu() then
--     return '<c-e>'
--   else
--     return '<c-w>'
--   end
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

-- mode cmd

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


