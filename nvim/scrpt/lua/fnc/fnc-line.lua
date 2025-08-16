
-- line

v.Line = {}

function v.Line.num_file_edge_bgn()

  return vim.fn.line('^')
end

function v.Line.num_file_edge_end() -- alias

  return vim.fn.line('$')
end

function v.Line.str_by_line_num(line_num) -- alias

  return vim.fn.getline(line_num)
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

  -- local line_str     = vim.fn.getline(line_num)
  local line_str     = v.Line.str_by_line_num(line_num)

  local line_str_len = v.Str.len(line_str)
  local space_len    = fil_end_col - line_str_len

  if space_len <= 0 then
    return
  end

  local space_str = v.Str.space(space_len)
  line_str = line_str .. space_str
  vim.fn.setline(line_num, line_str)
end

function v.Line.__del_by_line_num(line_num)

  vim.fn.deletebufline('%', line_num)
end

function v.Line.__dpl()

  v.Cmd.nml('"zyy"zP')
end

-- line num

function v.Line.num_by_Line_info(line_info)

  local line_info = vim.fn.trim(line_info, ' ', 1)
  local line_num  = vim.fn.split(line_info, '\\s\\+')[1]
  u.Log.val(line_num)

  return line_num
end

-- line cnd

