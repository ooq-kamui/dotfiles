-- 
-- fzf fnc
-- 

function v.Fzf_rg(...) -- alias

  local ptn   = ( a:0 >= 1 ) and a:1 or ''
  -- local ptn   = ( a:0 >= 1 ) and a:1 or g_rg_some_line_ptn

  local ext   = ( a:0 >= 2 ) and a:2 or nil
  local word1 = ( a:0 >= 3 ) and a:3 or false

  v.Fzf_rg_with_grep(ptn, ext, word1)
end

function v.Fzf_rg_with_grep(...)

  if not ( Is_env__('mac') or Is_env__('linux') or Is_env__('win64') ) then
    return
  end

  local ptn   = ( a:0 >= 1 ) and a:1 or ''
  -- local ptn   = ( a:0 >= 1 ) and a:1 or g_rg_some_line_ptn

  local ext   = ( a:0 >= 2 ) and a:2 or nil
  local word1 = ( a:0 >= 3 ) and a:3 or false

  local rg_cmd = Rg_cmd(ptn, ext, word1, nil)
  -- echo rg_cmd

  call fzf#vim#grep(
        rg_cmd,
        0,
        fzf#vim#with_preview(
          {'options': '--exact --delimiter : --nth 3..'},
          'up:70%:hidden',
          'ctrl-u'
        ),
        1
      )

  -- ref
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

  local ptn = ( a:0 >= 1 ) and a:1 or nil

  if ptn == nil then

    local rg_rslt_cnt = Rg_all_cnt()

    if rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_all_rslt_ar()

  else
    local rg_rslt_cnt = Rg_ptn_cnt(ptn, nil)

    if rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_ptn_rslt_ar(ptn, nil)
  end

  call fzf#run(
        {
          'source' : fzf_src_ar,
          'sink'   : funcref('Tag_jmp_by_str'),
          'window' : '-tabnew',
        }
      )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

function v.Fzf_by_txt(...)

  local src_txt  = ( a:0 >= 1 ) and a:1 or nil
  local fnc_name = ( a:0 >= 2 ) and a:2 or nil

  local src_ar = Txt_to_ar(src_txt)

  v.Fzf_by_ar(src_ar, fnc_name)
end

function v.Fzf_by_ar(...)

  local src_ar   = ( a:0 >= 1 ) and a:1 or nil
  local fnc_name = ( a:0 >= 2 ) and a:2 or nil

  if len(src_ar) > g_fzf_line_cnt_max then
    echo "fzf src_ar, end"
    return
  end

  call fzf#run(
    {
      'source' : src_ar,
      'sink'   : funcref(fnc_name),
      'window' : '-tabnew',
    }
  )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

-- fzf tag jmp by file

function v.Fzf_tag_jmp_by_file(...)

  local file_path = ( a:0 >= 1 ) and a:1 or 'doc/memo.md'

  local fzf_src_txt = File_txt(file_path)
  local fnc_name    = 'Tag_jmp_by_str'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.N_fzf_buf()
  
  exe 'FzfBufCrnt '
end

function v.V_fzf_buf()

  v.Srch_str__slctd_str()
  exe 'FzfBufCrnt ' .. escape(@z, '.*~')
end

function v.Fzf_rgstr()

  local rgstr_info = execute(':reg')->split("\\n")
  call remove(rgstr_info, 0)
  
  call fzf#run(
    {
      'source': rgstr_info,
      'sink'  : funcref('Ynk__by_rgstr_info'),
      'window': '-tabnew'
    }
  )
  --      'sink'  : funcref('Cursor__ins_rgstr_by_rgstr_info'),
end

-- fzf jmplst

function v.Fzf_jmplst()
  
  call fzf#run(
    {
      'source' : Jmplst_line_info(),
      'sink'   : funcref('Cursor__mv_by_line_info'),
      'window' : '-tabnew',
      'options': ['--reverse'],
    }
  )
  --     'options': ['--no-sort'],
end

-- fzf file

function v.Fzf_file()

  local sys_cmd = 'fd --type f'
  local fzf_src_txt  = Sys_cmd(sys_cmd)

  local fnc_name = 'Opn'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf dir

function v.Fzf_dir()

  local sys_cmd = 'fd --type d'
  local fzf_src_txt  = Sys_cmd(sys_cmd)

  local fnc_name = 'Dir__'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

function v.Fzf_dir_jmp()

  local sys_cmd = 'dir_jmp_lst_with_z'
  -- local sys_cmd = 'dir_jmp_lst_with_zoxide'

  local fzf_src_txt  = Sys_cmd(sys_cmd)

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
  local fzf_src_txt  = Sys_cmd(sys_cmd)

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
  -- echo sys_cmd

  local sys_cmd_sed = 'sed "s|^.*' .. g_doc_tech_dir_rel .. '/||g"'

  local sys_cmd = sys_cmd_rg .. ' | ' .. sys_cmd_sed

  local fzf_src_txt = Sys_cmd(sys_cmd)

  local fnc_name = 'Doc_tech_tag_jmp'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

function v.Doc_tech_tag_jmp(str)

  local str = $HOME .. '/' .. g_doc_tech_dir_rel .. '/' .. str
  -- echo str
  v.Tag_jmp_by_str(str)
end

-- rg

function v.Rg_rslt_line_parse(line)

  local dlm = ':'
  local ret = split(line, dlm)
  --echo ret

  local idx = 0
  while idx < len(ret) do

    ret[idx] = trim(ret[idx])

    idx = idx + 1
  end

  if ( len(ret) > 1 ) and ( not Is_char__num(ret[1]) ) then
    ret[1] = '1'
  end

  return ret
end

g_fzf_rg_opt = ''
  .. ' --color=always'
  .. ' --line-number'
  .. ' --smart-case'
  .. ' --no-multiline'
  .. ' --no-heading'
  .. ' --hidden'

function v.Rg_cmd(ptn, ext, word1, opt)

  if ptn == nil then
    local ptn = ''
  else
    local ptn = ptn
  end

  if ext == nil then
    local fzf_rg_opt_ext = ''
  else
    local fzf_rg_opt_ext = ' -g "*.' .. ext .. '"'
  end

  if word1 == true then
    local fzf_rg_opt_word1 = ' -w'
  else
    local fzf_rg_opt_word1 = ''
  end

  if opt == nil then
    local opt = ''
  else
    local opt = ' ' .. opt
  end

  local rg_cmd = 'rg '
       .. g_fzf_rg_opt
       .. fzf_rg_opt_ext
       .. fzf_rg_opt_word1
       .. opt
       .. ' -- ' .. '"' .. escape(ptn, '().$') .. '"'

  return rg_cmd
end

g_rg_emp_line_ptn  = '^[ \\t]*$'
g_rg_some_line_ptn = '^[^ \\t]+$'
-- g_rg_some_line_ptn = '[^ \\t]'

function v.Rg_ptn_cnt(ptn, opt)

  if opt == nil then
    local opt = ''
  else
    local opt = opt
  end

  local rg_cmd = "rg " .. opt .. " -e '" .. ptn .. "' | count"
  local rg_rslt_cnt = Sys_cmd(rg_cmd)
  return rg_rslt_cnt
end

function v.Rg_all_cnt()

  local ptn = g_rg_emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = Rg_ptn_cnt(ptn, opt)
  return rg_rslt_cnt
end

function v.Rg_all_rslt_ar()

  local ptn = g_rg_emp_line_ptn
  local opt = '-v'

  local rslt_ar = Rg_ptn_rslt_ar(ptn, opt)
  return rslt_ar
end

function v.Rg_ptn_rslt_ar(ptn, opt)

  local rg_rslt_txt = Rg_ptn_rslt_txt(ptn, opt)
  local rg_rslt_ar  = split(rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg_ptn_rslt_txt(ptn, opt)
  
  local rg_cmd = Rg_cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = Sys_cmd(rg_cmd)
  return r_rslt_txt
end

function v.Cursor__ins_rgstr_by_rgstr_info(rgstr_info)
  
  local rgstr = Rgstr_info_rgstr(rgstr_info)
  v.Normal('"' .. rgstr .. rgstr .. 'P')
end

function v.Rgstr_info_rgstr(rgstr_info)

  local rgstr = strcharpart(rgstr_info, 6, 1)
  return rgstr
end

function v.Jmplst()

  local jmplst_tmp = getjumplist()[0]
  --echo jmplst_tmp

  local buf_num_key_prefix = 'key_'
  local jmplst = {}
  for _jmplst_tmp in jmplst_tmp

    local _buf_num_key = buf_num_key_prefix .. _jmplst_tmp['bufnr']

    if not has_key(jmplst, _buf_num_key) then
      jmplst[_buf_num_key] = {}
    end

    call add(jmplst[_buf_num_key], _jmplst_tmp)
  endfor

  for _buf_num_key in keys(jmplst)

    call sort(jmplst[_buf_num_key], 'Jmplst_cmp')
  endfor

  local buf_num_key = buf_num_key_prefix .. Buf_num()
  local r_jmplst    = get(jmplst, buf_num_key, {})
  --echo r_jmplst

  return r_jmplst
end

function v.Jmplst_line_info()

  local jmplst = Jmplst()

  local jmplst_line_info = {}
  for _jmplst in jmplst

    local line_num  = _jmplst['lnum']
    local line_info = line_num .. ' ' .. getline(line_num)
    call add(jmplst_line_info, line_info)
  endfor
  --echo jmplst_line_info

  return jmplst_line_info
end

function v.Jmplst_cmp(jmplst1, jmplst2)

  local ret

  if     jmplst1['lnum'] >  jmplst2['lnum'] then
    ret =  1
  elseif jmplst1['lnum'] == jmplst2['lnum'] then
    ret =  0
  else
    ret = -1
  end

  return ret
end


-- fzf init

g_fzf_preview_window = {'down:40%:hidden', 'ctrl-/'}
g_fzf_action = {
  'ctrl-o' = 'tab drop',
}

--  'ctrl-o' = 'enter',
--  'ctrl-i' = 'item slct mtl',
--  'ctrl-s' = 'backward-char',

g_fzf_colors = {
  'hl'     = {'fg', 'Statement'  },
  'hl+'    = {'fg', 'Statement'  },
}

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
--g_fzf_buffers_jump = 1
--fzf#vim#complete#buffer_line([spec])

-- fzf var def ( in plugin ) end

if Is_env__('mac') or Is_env__('linux') or Is_env__('win64') then

  if Is_env__('win64') then
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  else
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  end
end


