
-- mark

v.Mark = {}

v.Mark.alph_def = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
}

function v.Mark.show_tgl()

  if vf.exists('v.Mark.show_flg') == 0 then

    v.Mark.show_flg = c.f
  end

  if not v.Mark.show_flg then

    vim.cmd('DoShowMarks')
    v.Mark.show_flg = c.t
  else
    vim.cmd('NoShowMarks')
    v.Mark.show_flg = c.f
  end
end

function v.Mark.lst()

  local mark = {}
  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.alph_def, _alph) == 0 then
      -- continue
    else
      mark = v.Tbl.add(mark, _mark['mark'][2])
    end
  end

  --print( mark )
  return mark
end

function v.Mark.alph_line()

  local line_num = v.Cursor.line_num()

  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.alph_def, _alph) == 0 then
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

  v.Cmd.cmd('DoShowMarks')
end

function v.Mark.add()

  local alph = v.Mark.alph_useabl()
  v.Cmd.cmd('mark ' .. alph)
end

function v.Mark.alph_useabl()

  local mark = v.Mark.lst()

  for idx, _alph in pairs(v.Mark.alph_def) do
    if vf.count(mark, _alph) == 0 then
      --print( _alph )
      return _alph
    end
  end

  print( 'use alph all' )
  return ''
end

function v.Mark.del(alph)

  v.Cmd.cmd('delmark ' .. alph)
end

function v.Mark.del_all()

  v.Cmd.cmd('delmark!')
  v.Cmd.cmd('DoShowMarks')
end

-- key bind

-- mark
-- vim.keymap.set('n', 'K', 'mz')

-- mark, cursor mv mark forward
-- vim.keymap.set('n', 'xx', ']`')

-- mark, cursor mv mark back
-- vim.keymap.set('n', 'xx', '[`')

