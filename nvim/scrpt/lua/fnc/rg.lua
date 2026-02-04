
v.Rg = {}

v.Rg.cnst = {}

v.Rg.cnst.emp_line_ptn  = '^[ \\t]*$'
v.Rg.cnst.some_line_ptn = '^[^ \\t]+$' -- '[^ \\t]'

function v.Rg.rslt_line_parse_ar(line)

  local dlm = ':'
  local line_parse_ar = v.Str.split(line, dlm)
  --echo line_parse_ar

  local idx = 1
  while idx <= v.Tbl.len(line_parse_ar) do

    line_parse_ar[idx] = v.Str.trim(line_parse_ar[idx])

    idx = idx + 1
  end

  if ( v.Tbl.len(line_parse_ar) > 1 ) and ( not v.Char.is__num(line_parse_ar[2]) ) then
    line_parse_ar[2] = '1'
  end

  return line_parse_ar
end

v.Rg.fzf_rg_opt = ''
  .. ' --color=always'
  .. ' --line-number'
  .. ' --smart-case'
  .. ' --no-multiline'
  .. ' --no-heading'
  .. ' --hidden'

function v.Rg.cmd(ptn, ext, word1, opt)

  ptn = ptn or ''

  local fzf_rg_opt_ext

  if ext == nil then
    fzf_rg_opt_ext = ''
  else
    fzf_rg_opt_ext = ' -g "*.' .. ext .. '"'
  end

  local fzf_rg_opt_word1 = ''

  if word1 == bl.t then
    fzf_rg_opt_word1 = ' -w'
  end

  if opt == nil then
    opt = ''
  else
    opt = ' ' .. opt
  end

  local rg_cmd = 'rg '
          .. v.Rg.fzf_rg_opt
          .. fzf_rg_opt_ext
          .. fzf_rg_opt_word1
          .. opt
          .. ' -- ' .. '"' .. vf.escape(ptn, '().$') .. '"'

  return rg_cmd
end

function v.Rg.rslt_cnt(ptn, opt)

  local opt

  if opt == nil then
    opt = ''
  else
    opt = opt
  end

  local rg_cmd = "rg " .. opt .. " -e '" .. ptn .. "' | count"
  local rg_rslt_cnt = v.Sys.cmd(rg_cmd)
  rg_rslt_cnt = tonumber(rg_rslt_cnt)
  return rg_rslt_cnt
end

function v.Rg.all_cnt()

  local ptn = v.Rg.cnst.emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = v.Rg.rslt_cnt(ptn, opt)
  return rg_rslt_cnt
end

function v.Rg.all_rslt_ar()

  local ptn = v.Rg.cnst.emp_line_ptn
  local opt = '-v'

  local rslt_ar = v.Rg.rslt_ar_by_ptn(ptn, opt)
  return rslt_ar
end

function v.Rg.rslt_ar_by_ptn(ptn, opt)

  local rg_rslt_txt = v.Rg.rslt_txt_by_ptn(ptn, opt)
  local rg_rslt_ar  = v.Str.split(rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg.rslt_txt_by_ptn(ptn, opt)
  
  local rg_cmd = v.Rg.cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = v.Sys.cmd(rg_cmd)
  return r_rslt_txt
end

