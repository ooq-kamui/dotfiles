
-- mark

v.Mark = {}

v.Mark.key_def = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
}

function v.Mark.show_tgl()

  if vf.exists('v.Mark.show_flg') == 0 then

    v.Mark.show_flg = bl.f
  end

  if not v.Mark.show_flg then

    -- v.Cmd.cmd('DoShowMarks')
    v.Mark.show_flg = bl.t
  else
    -- v.Cmd.cmd('NoShowMarks')
    v.Mark.show_flg = bl.f
  end
end

function v.Mark.lst()

  local mark_lst = {}
  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.key_def, _alph) == 0 then
      -- continue
    else
      -- mark_lst = v.Tbl.add(mark_lst, _mark['mark'][2])
      v.Tbl.add(mark_lst, _mark['mark'][2])
    end
  end

  --print( mark_lst )
  return mark_lst
end

function v.Mark.alph_line()

  local line_num = v.Cursor.line_num()

  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.key_def, _alph) == 0 then
      -- continue
    else
      if _mark['pos'][2] == line_num then
        --print( _alph )
        return _alph
      end
    end
  end
  return ''
end

function v.Mark.tgl()

  local alph = v.Mark.alph_line()
  --print( 'Mark_tgl ' .. alph )

  if v.Str.is__emp(alph) then
    v.Mark.add()
  else
    v.Mark.del(alph)
  end

  -- v.Cmd.cmd('DoShowMarks')
end

function v.Mark.add()

  local alph = v.Mark.alph_useabl()
  v.Cmd.cmd('mark ' .. alph)
end

function v.Mark.alph_useabl()

  local mark = v.Mark.lst()

  for idx, _alph in pairs(v.Mark.key_def) do
    if vf.count(mark, _alph) == 0 then
      --print( _alph )
      return _alph
    end
  end

  print( 'use alph all' )
  return ''
end

function v.Mark.del(key)

  v.Cmd.cmd('delmark ' .. key)
end

function v.Mark.del_all()

  v.Cmd.cmd('delmark!')
  -- v.Cmd.cmd('DoShowMarks')
end

-- key bind

-- mark, cursor mv mark forward
-- vim.keymap.set('n', 'xx', ']`')

-- mark, cursor mv mark back
-- vim.keymap.set('n', 'xx', '[`')

