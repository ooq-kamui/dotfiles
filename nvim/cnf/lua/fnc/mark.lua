
-- mark

v.Mark = {}

v.Mark.key_lst_def = v.Str.alph_lst('c')
-- v.Mark.key_lst_def = {'a','b','c'}
-- v.Mark.key_lst_def = {
--   -- 'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
--   -- 'o','p','q','r','s','t','u','v','w','x','y','z'
-- }

function v.Mark.add()

  v.Mark.rotate()

  local alph = 'a' -- top key
  v.Cmd.cmd('mark ' .. alph)
end

function v.Mark.rotate()

  local idx = v.Tbl.len(v.Mark.key_lst_def)
  local key_fr, key_to

  while idx >= 2 do

    key_fr = v.Mark.key_lst_def[idx - 1]
    key_to = v.Mark.key_lst_def[idx    ]

    v.Mark.__mv(key_fr, key_to)

    idx = idx - 1
  end
end

function v.Mark.__mv(key_fr, key_to)

  if not key_fr or not key_to then return end

  local pos = vim.api.nvim_buf_get_mark(0, key_fr)

  if pos[1] <= 0 then return end

  vim.api.nvim_buf_set_mark(0, key_to, pos[1], pos[2], {})
end

function v.Mark.del(key)

  v.Cmd.cmd('delmark ' .. key)
end

function v.Mark.del_all()

  v.Cmd.cmd('delmark!')
  -- v.Cmd.cmd('delmark A-Z0-9')
  -- v.Cmd.cmd('DoShowMarks')
end


-- legacy

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

function v.Mark.alph_useabl()

  local mark = v.Mark.lst()

  for idx, _alph in pairs(v.Mark.key_lst_def) do
    if vf.count(mark, _alph) == 0 then
      -- v.Log.val( _alph )
      return _alph
    end
  end

  v.Log.val( 'use alph all' )
  return ''
end

function v.Mark.lst()

  local mark_lst = {}
  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.key_lst_def, _alph) == 0 then
      -- continue
    else
      -- mark_lst = v.Tbl.add(mark_lst, _mark['mark'][2])
      v.Tbl.add(mark_lst, _mark['mark'][2])
    end
  end

  -- v.Log.val( mark_lst )
  return mark_lst
end

function v.Mark.alph_line()

  local line_num = v.Cursor.line_num()

  for idx, _mark in pairs(vf.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if vf.count(v.Mark.key_lst_def, _alph) == 0 then
      -- continue
    else
      if _mark['pos'][2] == line_num then
        -- v.Log.val( _alph )
        return _alph
      end
    end
  end
  return ''
end

function v.Mark.tgl()

  local alph = v.Mark.alph_line()
  -- v.Log.val( 'Mark_tgl ' .. alph )

  if v.Str.is__emp(alph) then
    v.Mark.add()
  else
    v.Mark.del(alph)
  end

  -- v.Cmd.cmd('DoShowMarks')
end


-- key bind

-- mark  -  cursor mv
-- keymap__('n', 'rm', '``')
-- keymap__('n', 'rm', '`z')
-- keymap__('n', 'xx', 'mz')

-- mark, cursor mv mark forward
-- vim.keymap.set('n', 'xx', ']`')

-- mark, cursor mv mark back
-- vim.keymap.set('n', 'xx', '[`')

