
v.Fzf = {}

function v.Fzf.by_txt(src_txt, fnc_name)

  local src_ar = v.Txt._to_ar(src_txt)

  v.Fzf.by_ar(src_ar, fnc_name)
end

function v.Fzf.by_ar(src_ar, fnc_name)

  vim.fn['fzf#run'](
    {
      source = src_ar,
      sink   = fnc_name,
      window = '-tabnew',
    }
  )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

-- fzf file

function v.Fzf.file()

  -- local sys_cmd = 'fd --type f'
  local sys_cmd = 'fd --type f --ignore'
  -- v.Log.val(sys_cmd)
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)
  -- v.Log.val(fzf_src_txt)

  local fnc_name = v.Buf.opn
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf.file_by_git_st()

  local sys_cmd = 'git-st-file-lst'
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Buf.opn_by_git_st_file_pth
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf rg

function v.Fzf.rg(ptn_rg, ext, word1_flg, opt) -- alias

  ptn_rg    = ptn_rg     or ''
  ext       = ext        or nil
  word1_flg = word1_flg  or bl.f
  opt       = opt        or nil

  v.Fzf.rg_with_fzfgrep(ptn_rg, ext, word1_flg, opt)
end

function v.Fzf.rg_by_srch_str()

  local srch_str_plain = v.Srch.str_plain()
  local opt = '-F' -- str plain ( ptn not )

  local word1_flg = v.Srch.is_str_vim__word1()

  v.Fzf.rg(srch_str_plain, nil, word1_flg, opt)
end

function v.Fzf.rg_by_slctd_str(word1_flg)

  local str     = v.Slctd.str()
  local str_ptn = v.Str.escape(str, '()')
  v.Fzf.rg(str_ptn, nil, word1_flg)
end

function v.Fzf.rg_with_fzfgrep(ptn_rg, ext, word1, opt)

  ptn_rg = ptn_rg or ''
  ext    = ext    or nil
  word1  = word1  or bl.f
  opt    = opt    or nil

  local rg_cmd = v.Rg.cmd(ptn_rg, ext, word1, opt)
  -- v.Log.val(rg_cmd)

  vim.fn['fzf#vim#grep'](
    rg_cmd,
    1,
    vim.fn['fzf#vim#with_preview'](
      {
        options = '--exact --delimiter : --nth 3..',
      },
      'up:70%:hidden',
      'ctrl-u'
    ),
    1
  )

  -- hlp
  --   fzf#vim#grep(
  --     command,
  --     [has_column bool],
  --     [spec dict],
  --     [fullscreen bool]
  --   )
end

-- fzf rg ext

function v.Fzf.rg_ext(ext)

  local ext = ext
  v.Fzf.rg(nil, ext)
end

-- fzf rg with run

v.Fzf.cnst = {}
v.Fzf.cnst.line_cnt_max = 30000

-- fzf tag jmp by file

function v.Fzf.tag_jmp_by_file(...)

  local arg = {...}

  local file_path = ( #arg >= 1 ) and arg[1] or 'doc/memo.md'

  local fzf_src_txt = v.File.txt(file_path)
  local fnc_name    = v.Buf.opn_by_path
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.Fzf.buf(str)

  str = str or ''

  local escape_char = '.*~'
  str = v.Str.escape(str, escape_char)

  v.Cmd.cmd('FzfBufCrnt ' .. str)
end

function v.Fzf.buf_by_srch_str()

  local srch_str_plain = v.Srch.str_plain()
  v.Fzf.buf(srch_str_plain)
end

function v.Fzf.buf_by_slctd_str()

  local slctd_str = v.Slctd.str()
  v.Fzf.buf(slctd_str)
end

-- fzf rgstr

function v.Fzf.rgstr()

  local rgstr_info_txt = v.Cmd.exc(':reg')
  local rgstr_info_ar  = v.Txt._to_ar(rgstr_info_txt)
  v.Tbl.del(rgstr_info_ar, 1)

  -- exclude num
  local tmp_ar = {}
  local rgstr
  for idx, rgstr_info in pairs(rgstr_info_ar) do

    rgstr = v.Rgstr.info_rgstr(rgstr_info)
    if string.find(rgstr, '[0-9]+') then
     --  continue
    else
      v.Tbl.add(tmp_ar, rgstr_info)
    end
  end
  rgstr_info_ar = tmp_ar

  vim.fn['fzf#run'](
    {
      source = rgstr_info_ar,
      sink   = v.Rgstr.ynk__by_rgstr_info,
      window = '-tabnew',
    }
  )
  --      'sink'  : Cursor.__ins_rgstr_by_rgstr_info
end

-- fzf jmplst ( edit line )

function v.Fzf.jmplst()

  vim.fn['fzf#run'](
    {
      source  = v.Jmplst.line_info_lst(),
      sink    = v.Cursor.__mv_by_jmplst_line_info_lst,
      window  = '-tabnew',
      options = {'--reverse'},
    }
  )
  --     'options': ['--no-sort'],
end

-- fzf dir

function v.Fzf.dir()

  local sys_cmd = 'fd --type d'
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Dir.__
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf.dir_jmp()

  local sys_cmd = 'dir_jmp_lst_with_zoxide'
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Dir.__
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf fnc call

function v.Fzf.fnc_call()

  local sys_cmd = 'rg --no-heading --no-filename --no-line-number "^function " --replace= ' .. v.Dir.c.nvim_lua_fnc_dir
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Cmd.cmdline__fnc_call
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf doc-tech

v.Fzf.doc_tech_md_dir = 'wrk/prj-pri/doc-tech/docs/md'

function v.Fzf.doc_tech()

  local ptn_rg = v.Rg.ptn.line_emp
  local opt = ' -v'
  opt = opt .. ' --no-heading'
  opt = opt .. ' --line-number'
  local sys_cmd_rg = "rg" .. opt .. " '" .. ptn_rg .. "' ~/" .. v.Fzf.doc_tech_md_dir
  -- v.Log.val(sys_cmd)

  local sys_cmd_sed = 'sed "s|^.*' .. v.Fzf.doc_tech_md_dir .. '/||g"'

  local sys_cmd = sys_cmd_rg .. ' | ' .. sys_cmd_sed

  local fzf_src_txt = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Fzf.doc_tech_tag_jmp
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf.doc_tech_tag_jmp(str)

  local str = v.Dir.c.home_dir .. '/' .. v.Fzf.doc_tech_md_dir .. '/' .. str
  -- v.Log.val(str)
  v.Buf.opn_by_path(str)
end

-- fzf doc-memo

function v.Fzf.doc_memo_opn() -- use not

  local dir = '~/wrk/prj-pri'

  local memo_file_lst = {
    dir .. '/dotfiles/doc/memo.md'  ,
    dir .. '/doc-tech/doc/memo.md'  ,
    dir .. '/life/doc/memo.md'      ,
    dir .. '/wall-paper/doc/memo.md',
  }

  local fzf_src_ar = memo_file_lst
  local fnc_name   = v.Buf.opn
  v.Fzf.by_ar(fzf_src_ar, fnc_name)
end

function v.Fzf.cheat_sheet()

  local sys_cmd     = 'cat    ' .. v.Dir.c.cheat_sheet_file_path
  local fzf_src_txt = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Rgstr.ynk__
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf.cheat_sheet__opn() -- dev doing

  local sys_cmd     = 'cat -n ' .. v.Dir.c.cheat_sheet_file_path
  local fzf_src_txt = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Buf.opn_cheat_sheet_by_line_num
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- tab drop neo
--   dev doing ..

-- 
-- setting
-- 

v.Fzf.opt_vim_cmd = [[
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
]]
v.Cmd.cmd(v.Fzf.opt_vim_cmd)

-- rg opt

v.Rg.fzf_rg_opt = v.Rg.fzf_rg_opt .. ' -g "!.git/"'

-- cmd usr

vim.api.nvim_create_user_command('FzfRgExt',
  function(opts)
    v.Fzf.rg_ext(unpack(opts.fargs))
  end,
  {nargs = 1, bang = bl.t}
)

vim.api.nvim_create_user_command('FzfTagjmpByFile',
  function(opts)
    v.Fzf.tag_jmp_by_file(unpack(opts.fargs))
  end,
  {nargs = '?'}
)

-- fzf buf crnt
v.Cmd.cmd('command! -bang -nargs=? FzfBufCrnt call fzf#vim#buffer_lines(<q-args>, {"options": ["--no-sort", "--exact"]}, <bang>1)')

-- fzf file
v.Cmd.cmd('command! -bang -nargs=? -complete=dir FzfFile call fzf#vim#files(<q-args>, <bang>1)')

-- fzf file history
v.Cmd.cmd('command! -bang -nargs=* FzfFileHstry call fzf#vim#history(fzf#vim#with_preview(), <bang>1)')

-- fzf cmd history
v.Cmd.cmd('command! -bang -nargs=* FzfCmdHstry call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)')

-- fzf srch history
v.Cmd.cmd('command! -bang -nargs=* FzfSrchHstry call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)')

-- fzf cmd def : mark
-- v.Cmd.cmd([[command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)]])
v.Cmd.cmd([[command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview({'options': '--query "^a | ^b | ^c"'}), <bang>1)]])
-- v.Cmd.cmd([[command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview({'options': '--query "^a "'}), <bang>1)]])
-- v.Cmd.cmd([[command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview({'options': '--query "^[a-z] "'}), <bang>1)]])

