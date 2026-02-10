
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

-- line set

function v.Line.__by_line_num(line_num, line_str)

  vf.setline(line_num, line_str)
end


-- line xx __ ins

g.line_top_space_ptn = '^[ \\t]*'
-- g.line_end_space_ptn = '[ \\t]\\+$'
g.line_end_space_ptn = '[ \\t]*$'

function v.Line.end_space__del(line_num)

  local ptn_tmp = v.Srch.str()

  local rpl_cmd = line_num .. 's/' .. g.line_end_space_ptn .. '//g'
  -- v.Log.val(rpl_cmd)

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
  v.Line.__by_line_num(line_num, line_str)
end

function v.Line.__del_by_line_num(line_num)

  vf.deletebufline('%', line_num)
end

function v.Line.__dpl()

  v.Cmd.nml('"zyy"zP')
end

-- line num

function v.Line.num_by_Line_info(line_info)

  local line_info = v.Str.trim(line_info, ' ', 1)
  local line_num  = v.Str.split(line_info, '\\s\\+')[1]

  line_num = v.Str.to_num(line_num)
  -- v.Log.val(line_num)

  return line_num
end

function v.Line.word_col_idx_lst(line_num)

  local line_str         = v.Line.str_by_line_num(line_num)
  local word_col_idx_lst = v.Str.word_col_idx_lst(line_str)
  return word_col_idx_lst
end

function v.Line.word_col_idx(line_num, col_idx_min)

  local word_col_idx_lst = v.Line.word_col_idx_lst(line_num)

  local word_col_idx
  for _idx, _word_col_idx in pairs(word_col_idx_lst) do
  
    if col_idx_min < _word_col_idx then
      word_col_idx = _word_col_idx
      break
    end
  end
  return word_col_idx
end

-- dev anchor
function v.Line.word_ruler_idx_lst(line_num)

  local line_str         = v.Line.str_by_line_num(line_num)
  local word_ruler_idx_lst = v.Str.word_ruler_idx_lst(line_str)
  return word_ruler_idx_lst
end

-- dev anchor
function v.Line.word_ruler_idx(line_num, ruler_idx_min)

  local word_ruler_idx_lst = v.Line.word_ruler_idx_lst(line_num)






  return v.Line.word_col_idx(line_num, ruler_idx_min)
end

function v.Line.ruler_idx_by_col_idx(line_num, col_idx) -- refactoring: col > byte

  local line_str = v.Line.str_by_line_num(line_num)

  local ruler_idx = v.Str.ruler_idx_by_byte_idx(line_str, col_idx)

  return ruler_idx
end

function v.Line.char_col_idx_lst(line_num, char)

  local line_str         = v.Line.str_by_line_num(line_num)
  local char_col_idx_lst = v.Str.char_col_idx_lst(line_str, char)
  return char_col_idx_lst
end

function v.Line.char_col_idx(line_num, char, col_idx_min)

  local char_col_idx_lst = v.Line.char_col_idx_lst(line_num, char)

  local char_col_idx
  for _idx, _char_col_idx in pairs(char_col_idx_lst) do
  
    if col_idx_min < _char_col_idx then
      char_col_idx = _char_col_idx
      break
    end
  end
  return char_col_idx
end

-- line cnd

-- ...

