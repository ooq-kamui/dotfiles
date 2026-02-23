
v.Str = {}

-- cnst

v.Str.cnst = {}

-- alph

v.Str.cnst.alph_lst = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
}

-- cmnt

v.Str.cmnt = {}

v.Str.cmnt.line_1_lst = {
  lua             = '-- ',
  text            = '# ' ,
  vim             = '" ' ,
  fish            = '# ' ,
  sh              = '# ' ,
  css             = '/* ',
  javascript      = '// ',
  typescript      = '// ',
  typescriptreact = '// ',
  java            = '// ',
  sql             = '-- ',
  dflt            = '# ' ,
}

v.Str.cmnt.line_mlt_lst = {
  lua        = {[[--[[]] , '--]]'},
  html       = {'<!--'   ,  '-->'},
  css        = {'/*'     ,  ' */'},
  javascript = {'/*'     ,  ' */'},
  typescript = {'/*'     ,  ' */'},
  java       = {'/*'     ,  ' */'},
  dflt       = {'/*'     ,  ' */'},
}

v.Str.dots = {}
v.Str.dots.str     = ' .. '
v.Str.dots.ptn_vim = [[ \.\. ]]
v.Str.dots.plt_ruler_idx = 50

-- len

function v.Str.len_byte(str)

  local len_byte = vf.strlen(str) -- byte , mb:3
  return len_byte
end

function v.Str.len(str) -- alias

  local len_char = v.Str.len_char(str)
  return len_char
end

function v.Str.len_char(str) -- mb:1

  local len_char = v.Str.len_char_on_nvim(str)
  return len_char
end

function v.Str.len_char_on_nvim(str)

  local len_char = vf.strcharlen(str) -- char on nvim , mb:1
  return len_char
end

function v.Str.len_char_raw(str) -- use not

  local len_char = vf.strchars(str, 0) -- char , mb:1
  return len_char
end

function v.Str.len_ruler(str) -- mb:2

  local len_ruler = vf.strdisplaywidth(str)
  return len_ruler
end

-- str idx cnv

function v.Str.ruler_idx_by_byte_idx(str, byte_idx)

  local str_sub   = v.Str.sub_by_byte_idx_with_mb(str, 1, byte_idx)
  local ruler_idx = v.Str.len_ruler(str_sub)
  return ruler_idx
end

function v.Str.byte_idx_by_ruler_idx(str, ruler_idx) -- byte_idx: mb end

  local byte_idx

  local len_char = v.Str.len_char(str)
  local str_sub, str_sub_len_ruler

  for char_idx = 1, len_char do

    str_sub  = v.Str.sub_by_char_idx(str, 1, char_idx)
    byte_idx = v.Str.len_byte(str_sub)

    str_sub_len_ruler = v.Str.len_ruler(str_sub)
    if str_sub_len_ruler >= ruler_idx then
      break
    end
  end

  return byte_idx
end

function v.Str.byte_idx_by_char_idx(str, char_idx, end_flg)
  -- v.Log.val(char_idx)

  if char_idx > v.Str.len_char(str) then return end

  local byte_idx = vf.byteidx(str, char_idx - 1) -- 0 start

  if byte_idx == -1 then return end

  if end_flg then
    byte_idx = byte_idx + vim.str_utf_end(str, byte_idx + 1) -- fnc arg2: 1 start
  end

  byte_idx = byte_idx + 1
  return byte_idx
end

function v.Str.char_idx_by_byte_idx(str, byte_idx)

  if byte_idx > v.Str.len_byte(str) then return end

  local char_idx = vf.charidx(str, byte_idx - 1)

  if char_idx == -1 then return end

  char_idx = char_idx + 1
  return char_idx
end

function v.Str.ruler_idx_by_char_idx(str, char_idx)

  local byte_idx  = v.Str.byte_idx_by_char_idx( str, char_idx)
  local ruler_idx = v.Str.ruler_idx_by_byte_idx(str, byte_idx)
  return ruler_idx
end

-- char

function v.Str.char(str, char_idx) -- alias

  return v.Str.char_by_char_idx(str, char_idx)
end

function v.Str.char_by_char_idx(str, char_idx) -- char_idx: 1 start, mb:ok

  local char = v.Str.sub_by_char_idx(str, char_idx, char_idx)
  return char
end

function v.Str.l_char(str)

  local l_char_idx = v.Str.l_char_idx(str)
  local char = v.Str.sub_by_char_idx(str, l_char_idx, l_char_idx)
  return char
end

function v.Str.r_char(str)

  local r_char_idx = v.Str.r_char_idx(str)
  local char  = v.Str.sub_by_char_idx(str, r_char_idx, r_char_idx)
  return char
end

function v.Str.l_char_idx(str)

  local l_char_idx = 1
  return l_char_idx
end

function v.Str.r_char_idx(str)

  local r_char_idx = v.Str.len_char(str)
  return r_char_idx
end

-- str sub

function v.Str.sub_by_char_idx(str, char_idx_s, char_idx_e) -- char_idx : 1 start, str:mb:ok

  char_idx_e = char_idx_e or v.Str.len_char(str)

  local sub_str_len_char = char_idx_e - char_idx_s + 1

  local r_str = vf.strcharpart(str, char_idx_s - 1, sub_str_len_char) -- arg2: 0 start
  return r_str
end

function v.Str.sub_by_byte_idx(str, byte_idx_s, byte_idx_e) -- alias

  return v.Str.sub_by_byte_idx_with_mb(str, byte_idx_s, byte_idx_e)
end

function v.Str.sub_by_byte_idx_with_mb(str, byte_idx_s, byte_idx_e) -- mb: ok, byte : 1 start

  local len_byte = v.Str.len_byte(str)

  if byte_idx_s > len_byte then
    return ''
  end

  if not byte_idx_e then
    byte_idx_e = len_byte

  elseif byte_idx_e > len_byte then
    byte_idx_e = len_byte
  end

  byte_idx_s = byte_idx_s + vim.str_utf_start(str, byte_idx_s) -- 1 start
  byte_idx_e = byte_idx_e + vim.str_utf_end(  str, byte_idx_e) -- 1 start

  local r_str = string.sub(str, byte_idx_s, byte_idx_e)
  return r_str
end

function v.Str.sub_by_byte_idx_with_ascii(str, byte_idx_s, byte_idx_e) -- mb: ng, byte : 1 start -- use not

  local r_str = string.sub(str, byte_idx_s, byte_idx_e)
  return r_str
end

function v.Str.sub_by_ruler_idx(str, ruler_idx_s, ruler_idx_e) -- char_idx : 1 start, str:mb:ok

  local byte_idx_s = v.Str.byte_idx_by_ruler_idx(str, ruler_idx_s)
  byte_idx_s = byte_idx_s + vim.str_utf_start(str, byte_idx_s)
  local byte_idx_e = v.Str.byte_idx_by_ruler_idx(str, ruler_idx_e)

  local r_str = v.Str.sub_by_byte_idx(str, byte_idx_s, byte_idx_e)
  return r_str
end

-- cnv etc

function v.Str.trim(str) -- alias

  str = vf.trim(str)
  return str
end

function v.Str.split(str, dlm)

  return vf.split(str, dlm)
end

-- str to num

function v.Str.to_num(num_str)

  local num = tonumber(num_str)
  return num
end

-- str srch

function v.Str.srch_byte_idx(str, ptn_xxx, srch_s_byte_idx) -- use not

  return v.Str.srch_byte_idx_by_ptn_vim(str, ptn_xxx, srch_s_byte_idx)
end

function v.Str.srch_byte_idx_by_ptn_lua(str, ptn_lua, srch_s_byte_idx) -- byte_idx start 1

  local s_byte_idx, e_byte_idx = string.find(str, ptn_lua, srch_s_byte_idx)
  return s_byte_idx, e_byte_idx
end

function v.Str.srch_byte_idx_by_ptn_vim(str, ptn_vim, s_byte_idx, end_flg) -- byte_idx start 0

  local byte_idx
  byte_idx = v.Str.srch_byte_idx_by_ptn_vim_idx_s1(str, ptn_vim, s_byte_idx, end_flg)
  -- byte_idx = v.Str.srch_byte_idx_by_ptn_vim_idx_s0(str, ptn_vim, s_byte_idx, end_flg)
  return byte_idx
end

function v.Str.srch_byte_idx_by_ptn_vim_idx_s1(str, ptn_vim, s_byte_idx, end_flg)

  s_byte_idx = s_byte_idx or 1

  s_byte_idx = s_byte_idx - 1

  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim_idx_s0(str, ptn_vim, s_byte_idx, end_flg)

  if not byte_idx then return end

  byte_idx = byte_idx + 1
  return byte_idx
end

function v.Str.srch_byte_idx_by_ptn_vim_idx_s0(str, ptn_vim, s_byte_idx, end_flg) -- byte_idx start 0

  local r_byte_idx

  if not end_flg then
    r_byte_idx = vf.match(   str, ptn_vim, s_byte_idx)
  else
    r_byte_idx = vf.matchend(str, ptn_vim, s_byte_idx)
  end

  if r_byte_idx == -1 then return end

  return r_byte_idx
end

function v.Str.srch_ruler_idx_by_ptn_vim(str, ptn_vim, srch_s_ruler_idx) -- use not

  local srch_s_byte_idx = v.Str.byte_idx_by_ruler_idx(str, srch_s_ruler_idx)

  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim_idx_s0(str, ptn_vim, srch_s_byte_idx)

  if not byte_idx then return end

  local ruler_idx = v.Str.ruler_idx_by_byte_idx(str, byte_idx)
  return ruler_idx
end

function v.Str.word_byte_idx_lst(str)

  local word_byte_idx_lst = {}
  local char

  local is_space = bl.t
  local str_len  = #str

  for byte_idx = 1, str_len do

    char = v.Str.sub_by_byte_idx(str, byte_idx, byte_idx)

    if v.Char.is_space(char) then
      is_space = bl.t

    else
      if is_space then
        v.Tbl.add(word_byte_idx_lst, byte_idx)
      end
      is_space = bl.f
    end
  end

  return word_byte_idx_lst
end

function v.Str.word_ruler_idx_lst(str)

  local word_ruler_idx_lst = {}

  local len_char = v.Str.len_char(str)
  local is_space = bl.t
  local char, ruler_idx

  for char_idx = 1, len_char do

    char = v.Str.char(str, char_idx)

    if v.Char.is_space(char) then
      is_space = bl.t

    else
      if is_space then
        ruler_idx = v.Str.ruler_idx_by_char_idx(str, char_idx)
        v.Tbl.add(word_ruler_idx_lst, ruler_idx)
      end
      is_space = bl.f
    end
  end

  return word_ruler_idx_lst
end

function v.Str.char_byte_idx_lst(str, char)

    local char_byte_idx_lst = {}
    local byte_idx = 1
    while true do
      local s_byte_idx, e_byte_idx = string.find(str, char, byte_idx, true)

      if s_byte_idx then
        v.Tbl.add(char_byte_idx_lst, s_byte_idx)
        byte_idx = e_byte_idx + 1
      else
        break
      end
    end
    return char_byte_idx_lst
end

-- sub str

function v.Str.sub_by_ptn(str, ptn_vim) -- alias

  return v.Str.sub_by_ptn_with_vim(str, ptn_vim)
end

function v.Str.sub_by_ptn_with_vim(str, ptn_vim)

  str = vf.matchstr(str, ptn_vim)
  return str
end

function v.Str.sub_by_ptn_with_lua(str, ptn_lua) -- use not

  local match_str = string.match(str, ptn_lua)
  return match_str
end

-- str __ rpl

function v.Str.__rpl(str, ptn_vim, rpl)

  return v.Str.__rpl_with_vim(str, ptn_vim, rpl)
  -- return v.Str.__rpl_with_lua(str, ptn_lua, rpl)
end

function v.Str.__rpl_with_lua(str, ptn_lua, rpl)

  local r_str = string.gsub(str, ptn_lua, rpl)
  return r_str
end

function v.Str.__rpl_with_vim(str, ptn_vim, rpl) -- alias

  local r_str = vf.substitute(str, ptn_vim, rpl, 'g')
  return r_str
end

-- cnv

function v.Str.path_unix__cnv_win(path)

  local path = path
  local path = v.Str.__rpl_with_lua(path, '/c/', 'C:/')
  local path = v.Str.__rpl_with_lua(path, '/'  , [[\]])
  return path
end

function v.Str.path_win__cnv_unix(path)

  local path = path
  local path = v.Str.__rpl_with_lua(path, 'C:' , '/c')
  local path = v.Str.__rpl_with_lua(path, [[\]], '/')
  return path
end

function v.Str.drct_turn(drct)

  local drct_turn

  if     drct == 'u' then
    drct_turn = 'd'

  elseif drct == 'd' then
    drct_turn = 'u'

  else
    drct_turn = 'u'
  end

  return drct_turn
end

function v.Str.escape(str, escape_chars) -- alias

  str = vf.escape(str, escape_chars)
  return str
end

-- str cre

function v.Str.space(len_byte)

  local space_str = ''

  local idx = 1
  while idx <= len_byte do

    space_str = space_str .. ' '

    idx = idx + 1
  end
  return space_str
end

function v.Str.cmnt.line_1()

  local cmnt_1_lst = v.Str.cmnt.line_1_lst
  local file_type  = v.Buf.file_type()
  local str = cmnt_1_lst[file_type] or cmnt_1_lst['dflt']
  return str
end

function v.Str.cmnt.line_mlt()

  local cmnt_mlt_lst = v.Str.cmnt.line_mlt_lst
  local file_type    = v.Buf.file_type()
  local str_ar = v.Tbl.get_by_key(cmnt_mlt_lst, file_type, cmnt_mlt_lst['dflt'])
  return str_ar
end

function v.Str.alph_lst(alph_to)

  local alph_lst = {}

  for idx, _alph in pairs(v.Str.cnst.alph_lst) do

    v.Tbl.add(alph_lst, _alph)

    if _alph == alph_to then break end
  end

  return alph_lst
end

-- str cnd

function v.Str.is__emp(str)

  local ret = bl.f

  if str == nil then
    ret = bl.t
  end

  if str == '' then
    ret = bl.t
  end
  return ret
end

function v.Str.is__ptn(str, ptn_vim) -- alias

  return v.Str.is__ptn_with_vim(str, ptn_vim)
end

function v.Str.is__ptn_with_vim(str, ptn_vim)

  local ret = bl.t

  local srch_byte_idx = v.Str.srch_byte_idx_by_ptn_vim(str, ptn_vim)

  if not srch_byte_idx then
    ret = bl.f
  end

  return ret
end

function v.Str.is__space(str)

  local ret = v.Str.is__ptn(str, v.Ptn.vim.space_entire)
  return ret
end

function v.Str.is__num(str)

  local ret = v.Str.is__ptn(str, v.Ptn.vim.num_entire)
  return ret
end

