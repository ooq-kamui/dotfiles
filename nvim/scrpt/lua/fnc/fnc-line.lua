
-- line

v.Line = {}

function v.Line.num_file_edge_bgn()

  return vf.line('^')
end

function v.Line.num_file_edge_end() -- alias

  return vf.line('$')
end

function v.Line.str_by_line_num(line_num) -- alias

  return vf.getline(line_num)
end

-- line xx __ ins

g.line_top_space_ptn = '^[ \\t]*'
-- g.line_end_space_ptn = '[ \\t]\\+$'
g.line_end_space_ptn = '[ \\t]*$'

function v.Line.end_space__del(line_num)

  local ptn_tmp = v.Rgstr.get('/')

  local rpl_cmd = line_num .. 's/' .. g.line_end_space_ptn .. '//g'
  -- print(rpl_cmd)

  v.Cmd.cmd(rpl_cmd)

  v.Srch.str__ptn(ptn_tmp)
end

function v.Line.end__pad_space(line_num, fil_end_col)

  -- local line_str     = vf.getline(line_num)
  local line_str     = v.Line.str_by_line_num(line_num)

  local line_str_len = v.Str.len(line_str)
  local space_len    = fil_end_col - line_str_len

  if space_len <= 0 then
    return
  end

  local space_str = v.Str.space(space_len)
  line_str = line_str .. space_str
  vf.setline(line_num, line_str)
end

function v.Line.__del_by_line_num(line_num)

  vf.deletebufline('%', line_num)
end

function v.Line.__dpl()

  v.Cmd.nml('"zyy"zP')
end

-- line num

function v.Line.num_by_Line_info(line_info)

  local line_info = vf.trim(line_info, ' ', 1)
  local line_num  = vf.split(line_info, '\\s\\+')[1]
  u.Log.val(line_num)

  return line_num
end

-- line cnd


-- line col

function v.Line.col_num_by_ruler_num(line_num, p_ruler_num)

  local line_str = v.Line.str_by_line_num(line_num)

  local line_str_len_char = v.Str.len_char(line_str)

  local t_ruler_num = p_ruler_num - 1
  local _ruler_num

  for char_idx = 1, line_str_len_char do

    str = v.Str.sub_by_char_idx(line_str, 1, char_idx)
    -- print(str)

    _ruler_num = v.Str.ruler_num(str)
    -- print(_ruler_num, '>', t_ruler_num)

    if _ruler_num >= t_ruler_num then
      break
    end
  end

  -- print('end')
  -- print(str)
  local t_col_num = v.Str.len_byte(str) + 1
  return t_col_num
end

