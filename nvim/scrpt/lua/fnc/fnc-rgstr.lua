
-- rgstr

v.Rgstr = {}

function v.Rgstr_get(rgstr_name)

  return f.getreg(rgstr_name)
end

function v.Rgstr_info_rgstr(rgstr_info)

  local rgstr = u.Str.sub(rgstr_info, 7, 7)
  return rgstr
end

function v.Rgstr__(rgstr_name, val)

  f.setreg(rgstr_name, val)
end

function v.Rgstr__clr()

  v.Rgstr__('a', '')
end

function v.Rgstr__shft()

  local a = v.Rgstr_get('a')
  local b = v.Rgstr_get('b')

  if a == b then
    return
  end

  v.Rgstr__('h', v.Rgstr_get('g'))
  v.Rgstr__('g', v.Rgstr_get('f'))
  v.Rgstr__('f', v.Rgstr_get('e'))

  v.Rgstr__('e', v.Rgstr_get('d'))
  v.Rgstr__('d', v.Rgstr_get('c'))
  v.Rgstr__('c', b            )
  v.Rgstr__('b', a            )
end

