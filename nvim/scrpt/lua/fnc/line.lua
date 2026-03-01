
-- line

v.Line = {}

function v.Line.num_file_edge_bgn()

  return vf.line('^')
end

function v.Line.num_file_edge_end() -- alias

  return vf.line('$')
end

function v.Line.str(line_num) -- alias

  return v.Line.str_by_line_num(line_num)
end

function v.Line.str_by_line_num(line_num) -- alias

  return vf.getline(line_num)
end

-- line set

function v.Line.__(line_num, line_str) -- alias

  v.Line.__by_line_num(line_num, line_str)
end

function v.Line.__by_line_num(line_num, line_str)

  vf.setline(line_num, line_str)
end


-- line xx __ ins

g.line_top_space_ptn = '^[ \\t]*'
-- g.line_end_space_ptn = '[ \\t]\\+$'
g.line_end_space_ptn = '[ \\t]*$'

function v.Line.end__ins(line_num, str)

  local line_str = v.Line.str_by_line_num(line_num)
  line_str = line_str .. str
  v.Line.__by_line_num(line_num, line_str)
end

function v.Line.end_space__del(line_num)

  local ptn_tmp = v.Srch.str_vim()

  local rpl_cmd = line_num .. 's/' .. g.line_end_space_ptn .. '//g'
  -- v.Log.val(rpl_cmd)

  v.Cmd.cmd(rpl_cmd)

  v.Srch.str_vim__ptn(ptn_tmp)
end

function v.Line.end__pad_space(line_num, fil_end_ruler_idx)

  local line_str     = v.Line.str_by_line_num(line_num)

  local line_str_len_ruler = v.Str.len_ruler(line_str)
  local space_len_byte     = fil_end_ruler_idx - line_str_len_ruler

  if space_len_byte <= 0 then
    return
  end

  local space_str = v.Str.space(space_len_byte)
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

function v.Line.num_by_jmplst_line_info(jmplst_line_info)

  local jmplst_line_info = v.Str.trim(jmplst_line_info, ' ', 1)
  local line_str_ar = v.Str.split(jmplst_line_info, v.Ptn.vim.space_char)
  local line_num = v.Str.to_num(line_str_ar[1])
  return line_num
end

function v.Line.word_byte_idx_lst(line_num)

  local line_str          = v.Line.str_by_line_num(line_num)
  local word_byte_idx_lst = v.Str.word_byte_idx_lst(line_str)
  return word_byte_idx_lst
end

function v.Line.word_byte_idx(line_num, byte_idx_min)

  local word_byte_idx_lst = v.Line.word_byte_idx_lst(line_num)

  local word_byte_idx
  for _idx, _word_byte_idx in pairs(word_byte_idx_lst) do
  
    if byte_idx_min < _word_byte_idx then
      word_byte_idx = _word_byte_idx
      break
    end
  end
  return word_byte_idx
end

-- dev anchor
function v.Line.word_ruler_idx_lst(line_num)

  local line_str         = v.Line.str_by_line_num(line_num)
  local word_ruler_idx_lst = v.Str.word_ruler_idx_lst(line_str)
  return word_ruler_idx_lst
end

function v.Line.word_ruler_idx(line_num, ruler_idx_min)

  ruler_idx_min = ruler_idx_min or 1

  local word_ruler_idx_lst = v.Line.word_ruler_idx_lst(line_num)

  local word_ruler_idx

  for idx, _word_ruler_idx in pairs(word_ruler_idx_lst) do

    if _word_ruler_idx >= ruler_idx_min then
      word_ruler_idx = _word_ruler_idx
      break
    end
  end

  return word_ruler_idx
end

function v.Line.ruler_idx_by_byte_idx(line_num, byte_idx)

  local line_str  = v.Line.str_by_line_num(line_num)
  local ruler_idx = v.Str.ruler_idx_by_byte_idx(line_str, byte_idx)
  return ruler_idx
end

function v.Line.char_byte_idx_lst(line_num, char)

  local line_str          = v.Line.str_by_line_num(line_num)
  local char_byte_idx_lst = v.Str.char_byte_idx_lst(line_str, char)
  return char_byte_idx_lst
end

function v.Line.char_byte_idx(line_num, char, byte_idx_min)

  local char_byte_idx_lst = v.Line.char_byte_idx_lst(line_num, char)

  local char_byte_idx
  for _idx, _char_byte_idx in pairs(char_byte_idx_lst) do
  
    if byte_idx_min < _char_byte_idx then
      char_byte_idx = _char_byte_idx
      break
    end
  end
  return char_byte_idx
end

-- line cnd

-- ...

