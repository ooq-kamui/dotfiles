
-- prmtv

require('fnc/char')
require('fnc/ptn' )
require('fnc/str' )
require('fnc/mb'  )
require('fnc/tbl' )

-- var

v.Var = {}

function v.Var.is__emp(val)

  if not val then
    return bl.t

  elseif val == '' then
    return bl.t

  -- dev anchor
  -- if ar {}
  end

  return bl.f
end

function v.Var.is__str(val)

  if type(val) == 'string' then
    return bl.t
  else
    return bl.f
  end
end

-- ar ( list )

v.Ar = {}

-- txt

v.Txt = {}

function v.Txt._to_ar(txt)

  local line_ar  = v.Str.split(txt, '\\n')
  return line_ar
end

v.Do = {}

function v.Do.nothing() -- use by tst

  -- v.Log.val( "do nothing.." )
end

-- int

v.Int = {}

function v.Int._2_str(num)

  local num_str = vf.printf('%o', num)
  return num_str
end

-- idx

v.Idx = {}

function v.Idx.__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx > ar_len then
    r_idx = 1
  end

  return r_idx
end

function v.Idx.__dcl(idx, ar_len)

  local r_idx = idx - 1

  if r_idx <= 0 then
    r_idx = ar_len
  end

  return r_idx
end

v.Num = {}

function v.Num.seq(s_num, e_num)

  local tbl = {}
  for num = s_num, e_num do
    v.Tbl.add(tbl, num)
  end
  return tbl
end

