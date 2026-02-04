
v.Sys = {}

function v.Sys.cmd(sys_cmd)

  -- v.Log.val(sys_cmd)
  local ret = vf.system(sys_cmd)
  -- v.Log.val(ret)
  return ret
end

function v.Sys.cmd_by_slctd_line(p_sys_cmd) -- range

  local str = v.Slctd.str()
  local sys_cmd = 'echo ' .. "'" .. str .. "'" .. ' | ' .. p_sys_cmd
  local rslt = v.Sys.cmd(sys_cmd)
  -- v.Log.val(rslt)
  v.Rgstr.ynk__(rslt)
end

function v.Sys.sh_by_slctd_line()

  local sys_cmd = 'sh'
  v.Sys.cmd_by_slctd_line(sys_cmd)
end

-- math

function v.Sys.math_by_slctd_line() -- range

  local sys_cmd = 'math'
  v.Sys.cmd_by_slctd_line(sys_cmd)
end

-- opn app

function v.Sys.opn_app(path)

  local path = path
  local cmd_sys

  if     v.Env.is__('mac') then
    cmd_sys = 'open'

  elseif v.Env.is__('win64') then
    cmd_sys = 'start'

  elseif v.Env.is__('win32unix') then
    cmd_sys = 'start'

  elseif v.Env.is__('wsl') then
    return
  else
    return
  end

  if v.Env.is__('win64') then
    path = v.Str.path_unix__cnv_win(path)
  end

  local res = vf.system(cmd_sys .. " '" .. path .. "'")
end

function v.Sys.opn_app_by_cursor_path()

  local path = v.Cursor.filepath()
  v.Sys.opn_app(path)
end

function v.Sys.opn_app_by_line_path(line_num)

  local path = v.Line.str_by_line_num(line_num)

  path = v.Str.trim(path)
  v.Sys.opn_app(path)
end

function v.Sys.opn_app_by_slctd_str()

  local path = v.Slctd.str()
  path = v.Str.trim(path)
  v.Sys.opn_app(path)
end

function v.Sys.opn_app_by_slctd_line() -- range

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    v.Sys.opn_app_by_line_path(line_num)
  end
end

function v.Sys.opn_buf_file()

  local path = v.Buf.file_path()
  -- v.Log.val( path )
  v.Sys.opn_app(path)
end

function v.Sys.opn_buf_file_dir()

  local dir = v.Buf.file_dir()
  v.Sys.opn_app(dir)
end

function v.Sys.opn_yt_by_slctd_str()

  local yt_video_id = v.Slctd.str()
  local yt_video_id = v.Str.trim(yt_video_id)
  v.Sys.opn_yt(yt_video_id)
end

function v.Sys.opn_brwsr()

  local url = 'https://www.google.com/'
  v.Sys.opn_app(url)
end

function v.Sys.opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' .. word
  v.Sys.opn_app(url)
end

function v.Sys.opn_ggl_srch_by_slctd_str()

  local word = v.Slctd.str()
  local word = v.Str.trim(word)
  v.Sys.opn_ggl_srch(word)
end

function v.Sys.opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' .. yt_video_id
  v.Sys.opn_app(url)
end

-- sys cmd trns

function v.Sys.trns_by_slctd_str() -- range

  local str = v.Slctd.str()
  str = v.Str.__rpl_with_vim(str, "\\n", ' ', 'g')

  local lang
  if v.Str.is__ptn(str, '[^\\x01-\\x7E]') then -- mlt byte
    lang = '{ja=en}'
  else
    lang = '{en=ja}'
  end

  str = vf.escape(str, "'")
  local sys_cmd = 'trans -no-ansi ' .. lang .. " '" .. str .. "'"
  local rslt = v.Sys.cmd(sys_cmd)
  v.Log.val( rslt )
end

-- url encdoe

function v.Sys.url_encode_by_slctd_str() -- range

  local str = v.Slctd.str()
  local sys_cmd = 'url_encode "' .. str .. '"'
  local rslt = v.Sys.cmd(sys_cmd)
  --v.Log.val( rslt )
  v.Cursor.__ins(rslt)
end

-- cmd by slf

function v.Sys.cmd_by_slf(p_sys_cmd)

  local file_path = v.Buf.file_path()
  local sys_cmd   = p_sys_cmd .. ' ' .. file_path

  local rslt = v.Sys.cmd(sys_cmd)
  v.Log.val(rslt)
  -- v.Rgstr.ynk__(rslt)

  v.Buf.opn_re()
end

-- cmd ruff slf

function v.Sys.ruff_by_slf()

  local sys_cmd = 'ruff format'
  v.Sys.cmd_by_slf(sys_cmd)
end

function confirm()

  local items = { "yes", "no" }
  vim.ui.select(
    items,
    {
      prompt = "exec ?",
      -- kind = "Confirm", -- ??
    },
    function(choice, idx)
      if     choice == "yes" then
        -- vim.notify("操作が実行されました。", vim.log.levels.INFO)

      elseif choice == "no"  then
        vim.notify("canceled", vim.log.levels.INFO) -- ??
      else
        vim.notify("canceled", vim.log.levels.INFO) -- ??
      end
    end
  )
end

