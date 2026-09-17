
v.Jmplst = {}

function v.Jmplst.lst()

  local jmplst_tmp = vf.getjumplist()[1]

  local buf_num_key_prefix = 'key_'
  local jmplst = {}
  local _buf_num_key

  for idx, _jmplst_tmp in pairs(jmplst_tmp) do

    _buf_num_key = buf_num_key_prefix .. _jmplst_tmp['bufnr']

    if jmplst[_buf_num_key] == nil then
      jmplst[_buf_num_key] = {}
    end

    v.Tbl.add(jmplst[_buf_num_key], _jmplst_tmp)
  end

  for idx, _buf_num_key in pairs(vf.keys(jmplst)) do

    v.Tbl.srt(jmplst[_buf_num_key], v.Jmplst.cmp)
  end

  local buf_num_key = buf_num_key_prefix .. v.Buf.num()
  local r_jmplst    = v.Tbl.get_by_key(jmplst, buf_num_key, {})
  return r_jmplst
end

function v.Jmplst.line_info_lst()

  local jmplst_lst = v.Jmplst.lst()

  local line_info_lst = {}

  local line_num
  for idx, _jmplst in pairs(jmplst_lst) do

    line_num  = _jmplst['lnum']

    line_info = line_num .. ' ' .. v.Line.str_by_line_num(line_num)

    v.Tbl.add(line_info_lst, line_info)
  end

  return line_info_lst
end

function v.Jmplst.cmp(jmplst1, jmplst2)

  local ret

  return jmplst1['lnum'] <  jmplst2['lnum']
end

