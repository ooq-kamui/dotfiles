
-- fnc

require('fnc/fnc-log'   )

-- global

g.dots_str     = ' .. '
g.dots_str_ptn = ' %.%. '
g.dots_put_col = 50

g.home_dir         = vf.expand('$HOME')
g.dotfiles_dir     = g.home_dir      .. '/wrk/prj-pri/dotfiles'
g.nvim_init_dir    = g.dotfiles_dir  .. '/nvim/scrpt'

g.nvim_lua_dir     = g.nvim_init_dir .. '/lua'
g.nvim_lua_fnc_dir = g.nvim_lua_dir  .. '/fnc'
g.nvim_lua_etc_dir = g.nvim_lua_dir  .. ''

g.nvim_lua_env_dir = g.nvim_lua_dir  .. '/env'

require('fnc/fnc-cmd'   )
require('fnc/fnc-dir'   )
require('fnc/fnc-line'  )
require('fnc/fnc-mode'  )
require('fnc/fnc-rgstr' )
require('fnc/fnc-cursor')
require('fnc/fnc-slctd' )
require('fnc/fnc-srch'  )
require('fnc/fnc-ins'   )

require('fnc/fnc-buf'   )
require('fnc/fnc-sys'   )
require('fnc/fnc-mcr'   )

require('fnc/fnc-mark'  )

require('fnc/fnc-tst'   )


-- function v.Echo(str) -- alias -- old -- del
-- 
--   print(str)
-- end

-- vim

-- vim basic

function v.Esc() -- alias

  -- v.Cmd.nml('\\<esc>')
  vim.cmd('exe "normal! \\<esc>"')
end

-- undo clr, file ( crnt buf ? )

function v.Undo__clr()

  -- local undo_lvl_tmp = &undolevels
  local undo_lvl_tmp = vim.bo.undolevels

  vim.opt_local.undolevels = -1
  vim.cmd([[exe "normal! a \<bs>\<esc>"]])

  vim.bo.undolevels = undo_lvl_tmp
end

-- syntax color

function v.Hl_grp()

  -- print( vf.synIDattr(vf.synID(vf.line('.'), vf.col('.'), 1), 'name') )
  local cmd = "echo synIDattr(synID(line('.'), col('.'), 1), 'name')"
  v.Cmd.cmd(cmd)
  -- print(  )
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Cmd.cmd(cmd)
end

-- rg

-- dev anchor
function v.Rg_rslt_line_parse(line)

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

function v.Rg_cmd(ptn, ext, word1, opt)

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

  if word1 == c.t then
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

function v.Rg_ptn_cnt(ptn, opt)

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

function v.Rg_all_cnt()

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = v.Rg_ptn_cnt(ptn, opt)
  return rg_rslt_cnt
end

function v.Rg_all_rslt_ar()

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rslt_ar = v.Rg_ptn_rslt_ar(ptn, opt)
  return rslt_ar
end

function v.Rg_ptn_rslt_ar(ptn, opt)

  local rg_rslt_txt = v.Rg_ptn_rslt_txt(ptn, opt)
  local rg_rslt_ar  = vf.split(rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg_ptn_rslt_txt(ptn, opt)
  
  local rg_cmd = v.Rg_cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = v.Sys.cmd(rg_cmd)
  return r_rslt_txt
end

-- jmplst

function v.Jmplst()

  local jmplst_tmp = vf.getjumplist()[1]
  -- v.Log.tbl(jmplst_tmp)

  local buf_num_key_prefix = 'key_'
  local jmplst = {}
  local _buf_num_key

  for idx, _jmplst_tmp in pairs(jmplst_tmp) do

    _buf_num_key = buf_num_key_prefix .. _jmplst_tmp['bufnr']

    if jmplst[_buf_num_key] == nil then
      -- v.Log.val(_buf_num_key)
      jmplst[_buf_num_key] = {}
    end

    v.Tbl.add(jmplst[_buf_num_key], _jmplst_tmp)
  end
  -- v.Log.tbl(jmplst)

  for idx, _buf_num_key in pairs(vf.keys(jmplst)) do

    v.Tbl.srt(jmplst[_buf_num_key], v.Jmplst_cmp)
  end
  -- v.Log.tbl(jmplst)

  local buf_num_key = buf_num_key_prefix .. v.Buf.num()
  -- v.Log.val(buf_num_key)

  local r_jmplst    = vf.get(jmplst, buf_num_key, {})
  -- v.Log.tbl(r_jmplst)

  return r_jmplst
end

function v.Jmplst_line_info()

  local jmplst = v.Jmplst()

  local jmplst_line_info = {}

  local line_num
  for idx, _jmplst in pairs(jmplst) do

    line_num  = _jmplst['lnum']

    -- line_info = line_num .. ' ' .. vf.getline(line_num)
    line_info = line_num .. ' ' .. v.Line.str_by_line_num(line_num)

    v.Tbl.add(jmplst_line_info, line_info)
  end
  -- v.Log.tbl(jmplst_line_info)

  return jmplst_line_info
end

function v.Jmplst_cmp(jmplst1, jmplst2)

  local ret

  return jmplst1['lnum'] <  jmplst2['lnum']
end

-- env

function v.Is_env__(env) -- alias

  -- env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  local ret = ( vf.has(env) == 1 )

  -- print( env .. ' : ', ret )
  -- print( 'hostname : ' .. vf.hostname() )

  return ret
end

function v.Is_nvim() -- alias

  local ret = ( vf.has('nvim') == 1 )
  print('nvim : ', ret)
  return ret
end

function v.Env_dir()

  local env_dir

  if     v.Is_env__('mac')       then -- mac
    env_dir = 'mac'

  elseif v.Is_env__('linux')     then -- c9, s9
    env_dir = 'c9'

  elseif v.Is_env__('win64')     then -- pwsh
    env_dir = 'pwsh'

  elseif v.Is_env__('win32unix') then -- gitbash
    env_dir = 'gitbash'
  end

  return env_dir
end

function v.Env_dir__()

  vim.g.env_dir = v.Env_dir()
end

-- plg

function v.Vim_plg_path()

  local vim_plg_dir_linux = g.home_dir .. '/.local/share/nvim/site'
  local vim_plg_dir_mac   = vim_plg_dir_linux
  local vim_plg_dir_win   = g.home_dir .. '/AppData/Local/nvim-data/site'

  local vim_plg_dir = vim_plg_dir_linux -- dflt

  if     v.Is_env__('mac') then

    vim_plg_dir = vim_plg_dir_mac

  elseif v.Is_env__('linux') then

    vim_plg_dir = vim_plg_dir_linux

  elseif v.Is_env__('win64') then

    vim_plg_dir = vim_plg_dir_win

  elseif v.Is_env__('win32unix') then -- gitbash

    vim_plg_dir = vim_plg_dir_win
  end

  local vim_plg_path = vim_plg_dir .. '/autoload/plug.vim'
  return vim_plg_path
end

function v.Is_vim_plg__installed()

  local vim_plg_path = v.Vim_plg_path()
  -- print( vim_plg_path )

  local ret = vf.empty(vf.glob(vim_plg_path)) == 0
  -- print( 'vim-plug installed : ', ret)
  return ret
end

-- repeat fnc

function v.Repeat_fnc()
  print('fnc repeat')

  -- v.Tst.tst()

  -- v.Cursor.__mv_srch('f')
  -- v.Cursor.__mv_d()
  -- v.Cursor.__ins_ynk()
end

-- fnc end


-- 
-- ref
-- 

-- https://vim-jp.org/vimdoc-ja/vimindex.html
-- 
-- ptn ( regex )
-- 
-- \n : 改行
-- \t : tab
-- 
-- \s : space, tab
-- 
-- \w : [0-9A-Za-z_]  word
-- \h : [A-Za-z_]     単語の先頭文字, \w から数字を除いたもの
-- \a : [A-Za-z]      alph
-- \l : [a-z]         小文字
-- \u : [A-Z]         大文字
-- 
-- \d : [0-9]         10進数
-- \x : [0-9A-Fa-f]   16進数
-- \o : [0-7]          8進数
-- 
-- \S : \s 以外
-- \D : \d 以外
-- \X : \x 以外
-- \O : \o 以外
-- \W : \w 以外
-- \H : \h 以外
-- \A : \a 以外
-- \L : \l 以外
-- \U : \u 以外
-- 
-- 上記のそれぞれ + 改行
-- ex
--   \_s : 改行, space, tab のいずれか
-- 
-- [^\x01-\x7E] : 全角
-- 
-- ref: [url]
-- 
-- when unknown server )
--   curl https://raw.githubusercontent.com/ooq-kamui/dotfiles/refs/heads/main/nvim/scrpt/dflt/init.vim > init.vim
--   vim -u init.vim

