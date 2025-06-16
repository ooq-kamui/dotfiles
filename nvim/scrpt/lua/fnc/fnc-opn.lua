
-- opn

v.Opn = {}


-- opn xxx

-- opn file

function v.Opn.opn(filename)

  v.Cmd('tab drop ' .. filename)
end

function v.Opn_tmp_file()

  local path = v.File_tmp__cre()
  print( path )
  v.Opn.opn(path)
end

g.init_lua_file_path         = g.init_lua_dir     .. '/init.lua'
g.init_lua_opt_file_path     = g.init_lua_etc_dir .. '/init-opt.lua'
g.init_lua_cmd_file_path     = g.init_lua_etc_dir .. '/init-cmd-usr.lua'
g.init_lua_hl_file_path      = g.init_lua_etc_dir .. '/init-hl.lua'
g.init_lua_key_map_file_path = g.init_lua_etc_dir .. '/init-key-map.lua'

g.init_lua_fnc_file_path     = g.init_lua_etc_dir .. '/init-fnc.lua'
g.init_lua_plg_fzf_file_path = g.init_lua_etc_dir .. '/init-plg-fzf.lua'

function v.Opn_init_vim()

  -- lua
  v.Opn.opn(g.init_lua_fnc_file_path    )
  v.Opn.opn(g.init_lua_plg_fzf_file_path)

  local vimrc_c9_file_path
  local vimrc_gitbash_file_path

  if     v.Is_env__('linux')     then -- c9, s9

    vimrc_c9_file_path      = g.init_vim_dir .. '/c9/init.vim'
    -- v.Opn.opn(vimrc_c9_file_path)

  elseif v.Is_env__('win32unix') then -- gitbash

    vimrc_gitbash_file_path = g.init_vim_dir .. '/gitbash/init.vim'
    v.Opn.opn(vimrc_gitbash_file_path)
  end
end

function v.Opn_init_vim_l()

  v.Opn.opn(g.init_lua_opt_file_path    )
  v.Opn.opn(g.init_lua_cmd_file_path    )

  v.Opn.opn(g.init_lua_file_path        )

  v.Opn.opn(g.init_lua_key_map_file_path)
  v.Opn.opn(g.init_lua_hl_file_path     )
end

function v.Opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  v.Opn.opn(path)
end

function v.Opn_man(cmd)

  v.Cmd('tab new')
  v.Cmd('Man ' .. cmd)
  v.Cmd('only')
end

g.memo_path = 'doc/memo.md'

function v.Opn_memo()

  v.Opn.opn(g.memo_path)
end

g.grep_wk_path = '~/wrk/tmp/rg.md'

function v.Opn_grep_wk()

  local file_type = f.getftype(g.grep_wk_path)

  if v.Is_str__emp(file_type) then

    v.Opn.opn(g.grep_wk_path)
  else
    v.Opn_tmp_file()
  end
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

-- tag jmp

-- tag jmp by str ( refactoring path )

function v.Tag_jmp_by_str(rg_rslt_line)

  local rg_rslt_line = f.trim(rg_rslt_line)

  if v.Is_str__emp(rg_rslt_line) then
    print( 'empty' )
    return
  end

  local rg_rslt_line = f.matchstr(rg_rslt_line, '\\S\\+')
  -- print( rg_rslt_line )

  local rg_rslt_line_ar = v.Rg_rslt_line_parse(rg_rslt_line)
  -- print( rg_rslt_line_ar )

  local filename = rg_rslt_line_ar[1]
  local line_num = f.get(rg_rslt_line_ar, 1, 1)
  -- print( line_num )
  -- return

  if not f.filereadable(filename) then
    print( 'file does not exist' )
    return
  end

  v.Cmd('tab drop ' .. filename)
  -- v.Normal(line_num .. 'G')
  v.Cursor__mv_by_line_num(line_num)
end

function v.Tag_jmp_by_cursor_line()

  local base_buf_num = v.Buf_num()

  local str = v.Cursor_line_str()
  v.Tag_jmp_by_str(str)

  v.Cmd('sbuffer ' .. base_buf_num)
  -- v.Normal('j')
  v.Cursor__mv_d()
end

function v.Tag_jmp_by_slctd_line() -- range

  local base_buf_num = v.Buf_num()

  local line_str

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    line_str = v.Line_str_by_line_num(line_num)

    v.Tag_jmp_by_str(line_str)
    v.Cmd('sbuffer ' .. base_buf_num)
  end
end

-- buf

function v.Buf_num()

  return f.bufnr('%')
end

function v.Buf__quit()

  local cmd = 'bd'
  v.Cmd(cmd)
end

function v.Buf__quit_swtch()

  local win_num = f.winnr('$')

  if win_num > 1 then
    v.Win_splt__quit()
  else
    v.Buf__quit()
  end
end

function v.Buf__fltr() -- use not

end

-- win splt

function v.Win__splt_h()

  local cmd = 'split'
  v.Cmd(cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  v.Cmd(cmd)

  v.Win_splt_cursor__mv_nxt()
end

function v.Win_splt_cursor__mv_nxt()

  vim.cmd('exe "normal! \\<c-w>w>"')
end

function v.Win_splt__quit()

  vim.cmd('exe "normal! \\<c-w>c>"')
end



