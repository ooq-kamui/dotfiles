
v.Rg = {}

v.Rg.ptn = {}
v.Rg.ptn.line_emp  = '^['  .. [[ \t]] .. ']*$'

function v.Rg.rslt_line_parse_ar(line)

  local dlm = ':'
  local line_parse_ar = v.Str.splt(line, dlm)
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

function v.Rg.cmd(ptn_rg, ext, word1, opt)

  ptn_rg = ptn_rg or ''

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
          .. ' -- ' .. '"' .. ptn_rg .. '"'

  return rg_cmd
end

function v.Rg.rslt_cnt(ptn_rg, opt)

  local opt

  if opt == nil then
    opt = ''
  else
    opt = opt
  end

  local rg_cmd = "rg " .. opt .. " -e '" .. ptn_rg .. "' | count"
  local rg_rslt_cnt = v.Sys.cmd(rg_cmd)
  rg_rslt_cnt = v.Str.to_num(rg_rslt_cnt)
  return rg_rslt_cnt
end

function v.Rg.all_cnt()

  local ptn_rg = v.Rg.ptn.line_emp
  local opt = '-v' -- match not

  local rg_rslt_cnt = v.Rg.rslt_cnt(ptn_rg, opt)
  return rg_rslt_cnt
end

function v.Rg.all_rslt_ar() -- use not

  local ptn_rg = v.Rg.ptn.line_emp
  local opt = '-v' -- match not

  local rslt_ar = v.Rg.rslt_ar_by_ptn(ptn_rg, opt)
  return rslt_ar
end

function v.Rg.rslt_ar_by_ptn(ptn_rg, opt)

  local rg_rslt_txt = v.Rg.rslt_txt_by_ptn(ptn_rg, opt)
  local rg_rslt_ar  = v.Str.splt(rg_rslt_txt, v.Ptn.vim.nl_char)
  return rg_rslt_ar
end

function v.Rg.rslt_txt_by_ptn(ptn_rg, opt)
  
  local rg_cmd = v.Rg.cmd(ptn_rg, nil, nil, opt) -- todo dev
  local r_rslt_txt = v.Sys.cmd(rg_cmd)
  return r_rslt_txt
end

