
v.Tbl = {}

function v.Tbl.get_by_key(tbl, key, val_dflt)

  if not tbl[key] then
    return val_dflt
  end

  return tbl[key]
end

function v.Tbl.last(tbl)

  local len = v.Tbl.len(tbl)
  return tbl[len]
end

function v.Tbl.add(tbl, val)

  return table.insert(tbl, val)
end

function v.Tbl.del(tbl, idx)

  return table.remove(tbl, idx)
end

function v.Tbl.len(tbl) -- rpl vf.len()

  if not v.Var.is__tbl(tbl) then return end

  local len = #tbl
  return len
end

function v.Tbl.idx(tbl, val)

  for _idx, _val in pairs(tbl) do

    if _val == val then
      return _idx
    end
  end
  return nil
end

function v.Tbl.tbl2d_idx(tbl2d, val)

  local idx1, idx2

  for _idx1, tbl in pairs(tbl2d) do
    for _idx2, _val in pairs(tbl) do
      if _val == val then
        idx1, idx2 = _idx1, _idx2
        break
      end
    end
  end
  return idx1, idx2
end

function v.Tbl.join(tbl, dlm)

  ret = table.concat(tbl, dlm)
  return ret
end

function v.Tbl.srt(tbl, cmp_fnc)

  return table.sort(tbl, cmp_fnc)
end

function v.Tbl.lst_by_2d_idx(tbl2d, idx)

  local lst = {}

  for _idx, val in pairs(tbl2d) do
    v.Tbl.add(lst, tbl2d[_idx][idx])
  end
  return lst
end

function v.Tbl.idx_inc_loop(tbl, idx)

  idx = idx + 1
  if idx > v.Tbl.len(tbl) then
    idx = 1
  end
  return idx
end

-- cnd

function v.Tbl.is__in(lst, val)

  local idx = v.Tbl.idx(lst, val)

  if idx then
    return bl.t
  else
    return bl.f
  end
end

function v.Tbl.is_last(tbl, val)

  if val == v.Tbl.last(tbl) then
    return bl.t
  else
    return bl.f
  end
end

