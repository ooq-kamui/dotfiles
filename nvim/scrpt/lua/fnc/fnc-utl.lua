
-- utl

u = {}

u.Log = {}

function u.Log.val(val)

  print(val)
end

function u.Log.tbl(tbl)

  print(vim.inspect(tbl))
end

u.Tbl = {}

function u.Tbl.add(tbl, val)

  return table.insert(tbl, val)
end

function u.Tbl.del(tbl, idx)

  return table.remove(tbl, idx)
end

function u.Tbl.len(tbl)

  return #tbl
end

function u.Tbl.idx(tbl, val)

  for _idx, _val in pairs(tbl) do

    if _val == val then
      return _idx
    end
  end
  return nil
end

function u.Tbl.srt(tbl, cmp_fnc)

  return table.sort(tbl, cmp_fnc)
end

u.Str = {}

function u.Str.sub(str, idx_s, idx_e)  -- alias

  local r_str = string.sub(str, idx_s, idx_e)
  return r_str
end

-- dev anchor
function u.Str.srch(str, ptn)

  local ret = string.match(str, ptn)
  return ret
end

u.Num = {}

function u.Num.seq(s_num, e_num)

  local tbl = {}
  for num = s_num, e_num do
    u.Tbl.add(tbl, num)
  end
  return tbl
end


