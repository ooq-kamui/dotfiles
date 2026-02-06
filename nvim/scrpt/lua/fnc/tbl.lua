
v.Tbl = {}

function v.Tbl.get(tbl, idx, val_dflt)

  if not tbl[idx] then
    return val_dflt
  end

  return tbl[idx]
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

  return #tbl
end

function v.Tbl.idx(tbl, val)

  for _idx, _val in pairs(tbl) do

    if _val == val then
      return _idx
    end
  end
  return nil
end

function v.Tbl.join(tbl, dlm)

  ret = table.concat(tbl, dlm)
  return ret
end

function v.Tbl.srt(tbl, cmp_fnc)

  return table.sort(tbl, cmp_fnc)
end

-- cnd

function v.Tbl.is_in(val, lst)

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

