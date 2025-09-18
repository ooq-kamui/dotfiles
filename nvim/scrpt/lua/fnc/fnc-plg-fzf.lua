
v.Fzf = {}

function v.Fzf.by_txt(...)

  local arg = {...}

  local src_txt  = arg[1] or nil
  local fnc_name = arg[2] or nil

  local src_ar = v.Txt._to_ar(src_txt)

  v.Fzf.by_ar(src_ar, fnc_name)
end

function v.Fzf.by_ar(...)

  local arg = {...}

  local src_ar   = arg[1] or nil
  local fnc_name = arg[2] or nil

  -- if vf.len(src_ar) > g.fzf_line_cnt_max then
  --   print("fzf src_ar, end")
  --   return
  -- end

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

-- fzf rg

function v.Fzf.rg(ptn, ext, word1) -- alias

  ptn   = ptn   or ''
  ext   = ext   or nil
  word1 = word1 or c.f

  v.Fzf.rg_with_grep(ptn, ext, word1)
end

function v.Fzf.rg_with_grep(ptn, ext, word1)

  -- local arg = {...}

  if not ( v.Is_env__('mac') or v.Is_env__('linux') or v.Is_env__('win64') ) then
    return
  end

  -- local ptn   = arg[1] or ''
  -- -- local ptn   = arg[1] or g.rg_some_line_ptn
  -- local ext   = arg[2] or nil
  -- local word1 = arg[3] or c.f

  ptn   = ptn   or ''
  -- ptn   = ptn   or g.rg_some_line_ptn
  ext   = ext   or nil
  word1 = word1 or c.f

  local rg_cmd = v.Rg.cmd(ptn, ext, word1, nil)
  -- v.Log.val(rg_cmd)

  vim.fn['fzf#vim#grep'](
    rg_cmd,
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
  --     [spec dict],
  --     [fullscreen bool]
  --   )
  -- 
  --   old
  --     fzf#vim#grep(
  --       command,
  --       [has_column bool],
  --       [spec dict],
  --       [fullscreen bool]
  --     )
end

-- fzf rg ext

function v.Fzf.rg_ext(ext)

  local ext = ext
  v.Fzf.rg(nil, ext)
end

-- rg word1
function v.Fzf.rg_word1(ptn)

  v.Fzf.rg(ptn, nil, c.t)
end

-- fzf rg by run

g.fzf_line_cnt_max = 30000

function v.Fzf.rg_with_run(...)

  local arg = {...}

  local ptn = arg[1] or nil

  local rg_rslt_cnt, fzf_src_ar

  if ptn == nil then

    rg_rslt_cnt = v.Rg.all_cnt()

    if rg_rslt_cnt > g.fzf_line_cnt_max then
      print("rg_rslt_cnt, end")
      return
    end

    fzf_src_ar = v.Rg.all_rslt_ar()

  else
    rg_rslt_cnt = v.Rg.ptn_cnt(ptn, nil)

    if rg_rslt_cnt > g.fzf_line_cnt_max then
      print("rg_rslt_cnt, end")
      return
    end

    fzf_src_ar = v.Rg.ptn_rslt_ar(ptn, nil)
  end

  vim.fn['fzf#run'](
    {
      source = fzf_src_ar,
      sink   = v.Buf.opn_by_path,
      window = '-tabnew',
    }
  )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

-- fzf tag jmp by file

function v.Fzf.tag_jmp_by_file(...)

  local arg = {...}

  local file_path = ( #arg >= 1 ) and arg[1] or 'doc/memo.md'

  local fzf_src_txt = v.File_txt(file_path)
  local fnc_name    = v.Buf.opn_by_path
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.Fzf.buf()
  
  vim.cmd('FzfBufCrnt ')
end

function v.Fzf.buf_by_slctd_str()

  v.Srch.str__slctd_str()
  vim.cmd('FzfBufCrnt ' .. vf.escape(vf.getreg('z'), '.*~'))
end

-- fzf rgstr

function v.Fzf.rgstr()

  local rgstr_info_str = vf.execute(':reg')
  local rgstr_info_ar = vf.split(rgstr_info_str, '\\n')
  v.Tbl.del(rgstr_info_ar, 1)
  -- v.Log.tbl(rgstr_info_ar)

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
      source  = v.Jmplst.line_info(),
      sink    = v.Cursor.__mv_by_line_info,
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

  local sys_cmd = 'rg --no-heading --no-filename --no-line-number "^function " --replace= ' .. g.nvim_lua_fnc_dir
  local fzf_src_txt  = v.Sys.cmd(sys_cmd)

  local fnc_name = v.Cmd.cmdline__fnc_call
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

-- fzf doc-tech

g.doc_tech_md_dir = 'wrk/prj-pri/doc-tech/docs/md'

function v.Fzf.doc_tech()

  local ptn = g.rg_emp_line_ptn
  local opt  = ' -v'
  opt = opt .. ' --no-heading'
  -- opt = opt .. ' --line-number'
  local sys_cmd_rg = "rg" .. opt .. " '" .. ptn .. "' ~/" .. g.doc_tech_md_dir
  -- print(sys_cmd)

  local sys_cmd_sed = 'sed "s|^.*' .. g.doc_tech_md_dir .. '/||g"'

  local sys_cmd = sys_cmd_rg .. ' | ' .. sys_cmd_sed

  local fzf_src_txt = v.Sys.cmd(sys_cmd)

  -- local fnc_name = 'Doc_tech_tag_jmp'
  local fnc_name = v.Doc_tech_tag_jmp
  v.Fzf.by_txt(fzf_src_txt, fnc_name)
end

function v.Doc_tech_tag_jmp(str)

  local str = g.home_dir .. '/' .. g.doc_tech_md_dir .. '/' .. str
  -- print(str)
  v.Buf.opn_by_path(str)
end

-- fzf doc-memo

function v.Fzf.doc_memo_opn()

  local dir = '~'

  local memo_file_lst = {
    dir .. '/wrk/prj-pri/dotfiles/doc/memo.md'  ,
    dir .. '/wrk/prj-pri/doc-tech/doc/memo.md'  ,
    dir .. '/wrk/prj-pri/life/doc/memo.md'      ,
    dir .. '/wrk/prj-pri/wall-paper/doc/memo.md',
  }

  local fzf_src_ar = memo_file_lst
  -- local fnc_name    = 'Opn'
  local fnc_name    = v.Buf.opn
  v.Fzf.by_ar(fzf_src_ar, fnc_name)
end

-- setting

vim_cmd = [[
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
vim.cmd(vim_cmd)

-- vim.g.fzf_preview_window = {
--   'down:40%:hidden',
--   'ctrl-/',
-- }
-- vim.g.fzf_action = {}
-- vim.g.fzf_action['ctrl-o'] = 'tab drop'

--  'ctrl-o' = 'enter',
--  'ctrl-i' = 'item slct mtl',
--  'ctrl-s' = 'backward-char',

-- vim.g.fzf_colors = {}
-- vim.g.fzf_colors['hl' ] = {'fg', 'Statement'}
-- vim.g.fzf_colors['hl+'] = {'fg', 'Statement'}

--   'bg+'     = {'bg', 'CursorLine' },
--   'bg+'     = {'bg', 'Normal'     },

--   'info'    = {'fg', 'Comment'    },
--   'border'  = {'fg', 'Ignore'     },
--   'prompt'  = {'fg', 'Function'   },
--   'pointer' = {'fg', 'Statement'  },
--   'marker'  = {'fg', 'Conditional'},

--   'info'    = {'Comment'},
--   'border'  = {'Comment'},
--   'prompt'  = {'Comment'},
--   'pointer' = {'Comment'},
--   'marker'  = {'Comment'},

-- use ??
-- g.fzf_buffers_jump = 1
-- fzf#vim#complete#buffer_line([spec])

-- fzf var def ( in plugin ) end

if v.Is_env__('mac') or v.Is_env__('linux') or v.Is_env__('win64') then

  if v.Is_env__('win64') then
    g.fzf_rg_opt = g.fzf_rg_opt .. ' -g "!.git/"'
  else
    g.fzf_rg_opt = g.fzf_rg_opt .. ' -g "!.git/"'
  end
end

-- cmd usr

vim.api.nvim_create_user_command('FzfRgExt',
  function(opts)
    v.Fzf.rg_ext(table.unpack(opts.fargs))
  end,
  {nargs = 1, bang = c.t}
)

vim.api.nvim_create_user_command('FzfRgWithRun',
  function(opts)
    v.Fzf.rg_with_run(table.unpack(opts.fargs))
  end,
  {nargs = '?'}
)

vim.api.nvim_create_user_command('FzfTagjmpByFile',
  function(opts)
    v.Fzf.tag_jmp_by_file(table.unpack(opts.fargs))
  end,
  {nargs = '?'}
)

-- fzf buf crnt
vim.cmd('command! -bang -nargs=? FzfBufCrnt call fzf#vim#buffer_lines(<q-args>, {"options": ["--no-sort", "--exact"]}, <bang>1)')

-- fzf file
vim.cmd('command! -bang -nargs=? -complete=dir FzfFile call fzf#vim#files(<q-args>, <bang>1)')

-- fzf file history
vim.cmd('command! -bang -nargs=* FzfFileHstry call fzf#vim#history(fzf#vim#with_preview(), <bang>1)')

-- fzf cmd history
vim.cmd('command! -bang -nargs=* FzfCmdHstry call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)')

-- fzf srch history
vim.cmd('command! -bang -nargs=* FzfSrchHstry call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)')

-- fzf cmd def : mark
vim.cmd('command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)')


