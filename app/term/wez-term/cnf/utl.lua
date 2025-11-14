
utl = {}

utl.tbl = {}

function utl.tbl.is_in(tbl, val)
  for _, value in ipairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end

