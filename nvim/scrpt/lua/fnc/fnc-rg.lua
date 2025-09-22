
v.Rg = {}

-- dev anchor
function v.Rg.rslt_line_parse(line)

  local dlm = ':'
  local ret = vf.split(line, dlm)
  --echo ret

  local idx = 1
  while idx <= vf.len(ret) do

    ret[idx] = vf.trim(ret[idx])

    idx = idx + 1
  end

  if ( vf.len(ret) > 1 ) and ( not v.Char.is__num(ret[2]) ) then
    ret[2] = '1'
  end

  return ret
end

g.fzf_rg_opt = ''
  .. ' --color=always'
  .. ' --line-number'
  .. ' --smart-case'
  .. ' --no-multiline'
  .. ' --no-heading'
  .. ' --hidden'

function v.Rg.cmd(ptn, ext, word1, opt)

  if ptn == nil then
    ptn = ''
  else
    ptn = ptn
  end

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
          .. g.fzf_rg_opt
          .. fzf_rg_opt_ext
          .. fzf_rg_opt_word1
          .. opt
          .. ' -- ' .. '"' .. vf.escape(ptn, '().$') .. '"'

  return rg_cmd
end

g.rg_emp_line_ptn  = '^[ \\t]*$'
g.rg_some_line_ptn = '^[^ \\t]+$'
-- g.rg_some_line_ptn = '[^ \\t]'

function v.Rg.ptn_cnt(ptn, opt)

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

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = v.Rg.ptn_cnt(ptn, opt)
  return rg_rslt_cnt
end

function v.Rg.all_rslt_ar()

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rslt_ar = v.Rg.ptn_rslt_ar(ptn, opt)
  return rslt_ar
end

function v.Rg.ptn_rslt_ar(ptn, opt)

  local rg_rslt_txt = v.Rg.ptn_rslt_txt(ptn, opt)
  local rg_rslt_ar  = vf.split(rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg.ptn_rslt_txt(ptn, opt)
  
  local rg_cmd = v.Rg.cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = v.Sys.cmd(rg_cmd)
  return r_rslt_txt
end

