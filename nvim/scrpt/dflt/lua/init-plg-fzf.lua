-- 
-- fzf
-- 

-- 
-- var
-- 

g_fzf_preview_window = {
  'down:40%:hidden',
  'ctrl-/',
}
g_fzf_action = {}
g_fzf_action['ctrl-o'] = 'tab drop'

--  'ctrl-o' = 'enter',
--  'ctrl-i' = 'item slct mtl',
--  'ctrl-s' = 'backward-char',

g_fzf_colors = {}
g_fzf_colors['hl' ] = {'fg', 'Statement'}
g_fzf_colors['hl+'] = {'fg', 'Statement'}

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
-- g_fzf_buffers_jump = 1
-- fzf#vim#complete#buffer_line([spec])

-- fzf var def ( in plugin ) end

if v.Is_env__('mac') or v.Is_env__('linux') or v.Is_env__('win64') then

  if v.Is_env__('win64') then
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  else
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  end
end

-- 
-- fnc
-- 

function v.Fzf_rg(...) -- alias

  local arg = {...}

  local ptn   = arg[1] or ''
  -- local ptn   = arg[1] or g_rg_some_line_ptn

  local ext   = arg[2] or nil
  local word1 = arg[3] or false

  v.Fzf_rg_with_grep(ptn, ext, word1)
end

function v.Fzf_rg_with_grep(...)

  local arg = {...}

  if not ( v.Is_env__('mac') or v.Is_env__('linux') or v.Is_env__('win64') ) then
    return
  end

  local ptn   = arg[1] or ''
  -- local ptn   = arg[1] or g_rg_some_line_ptn

  local ext   = arg[2] or nil
  local word1 = arg[3] or false

  local rg_cmd = v.Rg_cmd(ptn, ext, word1, nil)
  -- print(rg_cmd)

  vim.fn['fzf#vim#grep'](
        rg_cmd,
        0,
        vim.fn['fzf#vim#with_preview'](
          {options = '--exact --delimiter : --nth 3..'},
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

function v.Fzf_rg_ext(ext)

  local ext = ext
  v.Fzf_rg(nil, ext)
end

-- rg word1
function v.Fzf_rg_word1(ptn)

  v.Fzf_rg(ptn, nil, true)
end

-- fzf rg by run

g_fzf_line_cnt_max = 30000

function v.Fzf_rg_with_run(...)

  local arg = {...}

  local ptn = arg[1] or nil

  local rg_rslt_cnt, fzf_src_ar

  if ptn == nil then

    rg_rslt_cnt = v.Rg_all_cnt()

    if rg_rslt_cnt > g_fzf_line_cnt_max then
      print("rg_rslt_cnt, end")
      return
    end

    fzf_src_ar = v.Rg_all_rslt_ar()

  else
    rg_rslt_cnt = v.Rg_ptn_cnt(ptn, nil)

    if rg_rslt_cnt > g_fzf_line_cnt_max then
      print("rg_rslt_cnt, end")
      return
    end

    fzf_src_ar = v.Rg_ptn_rslt_ar(ptn, nil)
  end

  vim.fn['fzf#run'](
    {
      source = fzf_src_ar,
      -- sink   = f.funcref('Tag_jmp_by_str'),
      sink   = v.Tag_jmp_by_str,
      window = '-tabnew',
    }
  )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

function v.Fzf_by_txt(...)

  local arg = {...}

  local src_txt  = arg[1] or nil
  local fnc_name = arg[2] or nil

  local src_ar = v.Txt_to_ar(src_txt)

  v.Fzf_by_ar(src_ar, fnc_name)
end

function v.Fzf_by_ar(...)

  local arg = {...}

  local src_ar   = arg[1] or nil
  local fnc_name = arg[2] or nil

  if f.len(src_ar) > g_fzf_line_cnt_max then
    print("fzf src_ar, end")
    return
  end

  vim.fn['fzf#run'](
    {
      source = src_ar,
      -- sink   = f.funcref(fnc_name),
      sink   = fnc_name,
      window = '-tabnew',
    }
  )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

-- fzf tag jmp by file

function v.Fzf_tag_jmp_by_file(...)

  local arg = {...}

  local file_path = ( #arg >= 1 ) and arg[1] or 'doc/memo.md'

  local fzf_src_txt = v.File_txt(file_path)
  local fnc_name    = 'Tag_jmp_by_str'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.N_fzf_buf()
  
  vim.cmd('FzfBufCrnt ')
end

function v.V_fzf_buf()

  v.Srch_str__slctd_str()
  vim.cmd('FzfBufCrnt ' .. f.escape(f.getreg('z'), '.*~'))
end

function v.Fzf_rgstr()

  local rgstr_info_str = f.execute(':reg')
  local rgstr_info = f.split(rgstr_info_str, '\\n')
  f.remove(rgstr_info, 0)

  vim.fn['fzf#run'](
    {
      source = rgstr_info,
      -- sink   = f.funcref('Ynk__by_rgstr_info'),
      sink   = v.Ynk__by_rgstr_info,
      window = '-tabnew',
    }
  )
  --      'sink'  : Cursor__ins_rgstr_by_rgstr_info
end

-- fzf jmplst

function v.Fzf_jmplst()

  vim.fn['fzf#run'](
    {
      source  = v.Jmplst_line_info(),
      -- sink    = f.funcref('Cursor__mv_by_line_info'),
      sink    = v.Cursor__mv_by_line_info,
      window  = '-tabnew',
      options = {'--reverse'},
    }
  )
  --     'options': ['--no-sort'],
end

-- fzf file

function v.Fzf_file()

  local sys_cmd = 'fd --type f'
  local fzf_src_txt  = v.Sys_cmd(sys_cmd)

  local fnc_name = 'Opn'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf dir

function v.Fzf_dir()

  local sys_cmd = 'fd --type d'
  local fzf_src_txt  = v.Sys_cmd(sys_cmd)

  local fnc_name = 'Dir__'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf_dir_jmp()

  local sys_cmd = 'dir_jmp_lst_with_z'
  -- local sys_cmd = 'dir_jmp_lst_with_zoxide'

  local fzf_src_txt  = v.Sys_cmd(sys_cmd)

  local fnc_name = 'Dir__'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf_doc_memo_opn()

  local dir = '~'

  local memo_file_list = {
    dir .. '/wrk/prj-pri/dotfiles/doc/memo.md'   ,
    dir .. '/wrk/prj-pri/doc-tech-ds/doc/memo.md',
    dir .. '/wrk/prj-pri/life/doc/memo.md'       ,
    dir .. '/wrk/prj-pri/wall-paper/doc/memo.md' ,
  }

  local fzf_src_ar = memo_file_list
  local fnc_name    = 'Opn'
  v.Fzf_by_ar(fzf_src_ar, fnc_name)
end

function v.Fzf_vim_fnc_call()

  local rg_ptn = '^function v.[\\w]+\\(.*\\)'

  local sys_cmd_rg = "rg " .. "-No '" .. rg_ptn .. "' " .. g_vimrc_file_path

  local sys_cmd_sed = 'sed "s/function v.//g"'

  local sys_cmd = sys_cmd_rg .. ' | ' .. sys_cmd_sed
  local fzf_src_txt  = v.Sys_cmd(sys_cmd)

  local fnc_name = 'Cmdline__'

  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

g_doc_tech_dir_rel = 'wrk/prj-pri/doc-tech-ds/docs/md'

function v.Fzf_doc_tech()

  local ptn = g_rg_emp_line_ptn
  local opt  = ' -v'
  opt = opt .. ' --no-heading'
  -- opt = opt .. ' --line-number'
  local sys_cmd_rg = "rg" .. opt .. " '" .. ptn .. "' ~/" .. g_doc_tech_dir_rel
  -- print(sys_cmd)

  local sys_cmd_sed = 'sed "s|^.*' .. g_doc_tech_dir_rel .. '/||g"'

  local sys_cmd = sys_cmd_rg .. ' | ' .. sys_cmd_sed

  local fzf_src_txt = v.Sys_cmd(sys_cmd)

  local fnc_name = 'Doc_tech_tag_jmp'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

function v.Doc_tech_tag_jmp(str)

  local str = g_home_dir .. '/' .. g_doc_tech_dir_rel .. '/' .. str
  -- print(str)
  v.Tag_jmp_by_str(str)
end

-- 
-- cmd usr
-- 

-- command! -bang -nargs=1 FzfRgExt call Fzf_rg_ext(<f-args>)
   vim.api.nvim_create_user_command('FzfRgExt',
     function(opts)
       v.Fzf_rg_ext(table.unpack(opts.fargs))
     end,
     {nargs = 1, bang = true}
   )

-- command! -nargs=? FzfRgWithRun call Fzf_rg_with_run(<f-args>)
   vim.api.nvim_create_user_command('FzfRgWithRun',
     function(opts)
       v.Fzf_rg_with_run(table.unpack(opts.fargs))
     end,
     {nargs = '?'}
   )

-- command! -nargs=? FzfTagjmpByFile call Fzf_tag_jmp_by_file(<f-args>)
   vim.api.nvim_create_user_command('FzfTagjmpByFile',
     function(opts)
       v.Fzf_tag_jmp_by_file(table.unpack(opts.fargs))
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

-- fzf rgstr
   vim.cmd('command! -bang -nargs=* FzfRgstr call Fzf_rgstr()')

-- fzf jmplst
   vim.cmd('command! -bang -nargs=* FzfJmplst call Fzf_jmplst()')

-- fzf cmd def : mark
   vim.cmd('command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)')


