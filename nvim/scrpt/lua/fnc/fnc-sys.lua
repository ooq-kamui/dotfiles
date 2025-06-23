
v.Sys = {}

function v.Sys.cmd(sys_cmd)

  -- print(sys_cmd)
  local ret = f.system(sys_cmd)
  -- print(ret)
  return ret
end

function v.Sys.cmd_by_slctd_line()

  local str = v.Slctd_str()
  local sys_cmd = 'echo ' .. "'" .. str .. "'" .. ' | sh'
  local rslt = v.Sys.cmd(sys_cmd)
  print( rslt )
  v.Rgstr__('a', rslt)
end

-- opn app

function v.Sys.cmd_opn_app(path)

  local path = path
  local cmd_sys

  if     v.Is_env__('mac') then
    cmd_sys = 'open'

  elseif v.Is_env__('win64') then
    cmd_sys = 'start'

  elseif v.Is_env__('win32unix') then
    cmd_sys = 'start'

  else
    return
  end

  if v.Is_env__('win64') then
    path = v.Str_path_unix__cnv_win(path)
  end

  local res = f.system(cmd_sys .. " '" .. path .. "'")
end

function v.Sys.cmd_opn_app_by_cursor_path()

  local path = v.Cursor_filepath()
  v.Sys.cmd_opn_app(path)
end

function v.Sys.cmd_opn_app_by_line_path(line_num)

  local path = v.Line_str_by_line_num(line_num)

  path = f.trim(path)
  v.Sys.cmd_opn_app(path)
end

function v.Sys.cmd_opn_app_by_slctd_str()

  local path = v.Slctd_str()
  path = f.trim(path)
  v.Sys.cmd_opn_app(path)
end

function v.Sys.cmd_opn_app_by_slctd_line() -- range

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    v.Sys.cmd_opn_app_by_line_path(line_num)
  end
end

function v.Sys.cmd_opn_app_buf_file()

  local path = v.Buf_file_path()
  -- print( path )
  v.Sys.cmd_opn_app(path)
end

function v.Sys.cmd_opn_buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Sys.cmd_opn_app(dir)
end

function v.Sys.cmd_opn_yt_by_slctd_str()

  local yt_video_id = v.Slctd_str()
  local yt_video_id = f.trim(yt_video_id)
  v.Sys.cmd_opn_yt(yt_video_id)
end

function v.Sys.cmd_opn_brwsr()

  local url = 'https://www.google.com/'
  v.Sys.cmd_opn_app(url)
end

function v.Sys.cmd_opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' .. word
  v.Sys.cmd_opn_app(url)
end

function v.Sys.cmd_opn_ggl_srch_by_slctd_str()

  local word = v.Slctd_str()
  local word = f.trim(word)
  v.Sys.cmd_opn_ggl_srch(word)
end

function v.Sys.cmd_opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' .. yt_video_id
  v.Sys.cmd_opn_app(url)
end
-- sys cmd trns

function v.Sys.cmd_trns_by_slctd_str() -- range

  local str = v.Slctd_str()
  str = f.substitute(str, "\\n", ' ', 'g')

  local lang
  -- if str =~ '[^\\x01-\\x7E]' then -- mlt byte
  if v.Is_str__ptn(str, '[^\\x01-\\x7E]') then -- mlt byte
    lang = '{ja=en}'
  else
    lang = '{en=ja}'
  end

  str = f.escape(str, "'")
  local sys_cmd = 'trans -no-ansi ' .. lang .. " '" .. str .. "'"
  local rslt = v.Sys.cmd(sys_cmd)
  print( rslt )
end

-- math

function v.Sys.cmd_math_by_slctd_line() -- range

  local str = v.Slctd_str()
  local sys_cmd = 'echo ' .. "'" .. str .. "'" .. ' | math'
  local rslt = v.Sys.cmd(sys_cmd)
  print( rslt )
  v.Rgstr__('a', rslt)
end

-- url encdoe

function v.Sys.cmd_url_encode_by_slctd_str() -- range

  local str = v.Slctd_str()
  local sys_cmd = 'url_encode "' .. str .. '"'
  local rslt = v.Sys.cmd(sys_cmd)
  --print( rslt )
  v.Cursor__ins(rslt)
end

