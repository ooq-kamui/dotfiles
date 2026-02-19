
-- fnc tst

v.Tst = {}

function v.Tst.tst()

  local str = 'あaいiう'
  -- local byte_idx = 1 -- 1
  -- local byte_idx = 2 -- 1
  -- local byte_idx = 3 -- 1
  local byte_idx = 4 -- 2
  -- local byte_idx = 5 -- 3
  -- local byte_idx = 6 -- 3
  -- local byte_idx = 7 -- 3
  -- local byte_idx = 8 -- 4

  local char_idx = v.Str.char_idx_by_byte_idx(str, byte_idx)
  v.Log.val(char_idx)

  local byte_idx = v.Slctd.str_edge_r_byte_idx()
  -- v.Cursor.str_week__icl()
end


