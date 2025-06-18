
Sys = {}

function v.Sys_cmd(sys_cmd)

  -- print(sys_cmd)
  local ret = f.system(sys_cmd)
  -- print(ret)
  return ret
end

-- opn app

function v.Opn_app(path)

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

function v.Opn_app_by_cursor_path()
  
  local path = v.Cursor_filepath()
  v.Opn_app(path)
end

function v.Opn_app_by_line_path(line_num)

  -- local path = f.getline(line_num)
  local path = v.Line_str_by_line_num(line_num)

  path = f.trim(path)
  v.Opn_app(path)
end

function v.Opn_app_by_slctd_str()

  local path = v.Slctd_str()
  path = f.trim(path)
  v.Opn_app(path)
end

function v.Opn_app_buf_file()

  local path = v.Buf_file_path()
  -- print( path )
  v.Opn_app(path)
end

function v.Opn_buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Opn_app(dir)
end

function v.Opn_brwsr()

  local url = 'https://www.google.com/'
  v.Opn_app(url)
end

function v.Opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' .. word
  v.Opn_app(url)
end

function v.Opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' .. yt_video_id
  v.Opn_app(url)
end

