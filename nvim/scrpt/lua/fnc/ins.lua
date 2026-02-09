
-- mode ins

v.Ins = {}

-- complete  -  mode insert ins lst

function v.Ins.symbol01()

  local lst = { '$', '@', '#', ';', '%' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.symbol02()

  local lst = { '?', '!', '&', '~', '^', '|', '\\', '/' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.symbol03()

  local lst = { '=', '+', '-' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.bracket()

  -- local lst = { '()', '{}', '[]', '<>', '[]()', '[][]', '(){}' }
  local lst = { '()', '{}', '[]', '<>' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.quote()

  local quote_lst = {
    markdown = { '``', "''", '""' },
    dflt     = { "''", '""', '``' },
  }

  local file_type = v.Buf.file_type()
  local lst = quote_lst[file_type] or quote_lst['dflt']

  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.markdown_lnk()

  local lst = { '[]()', '[][]', '![]()' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.week()

  vf.complete(v.Cursor.col_num(), v.Date.week_def)
  return ''
end

function v.Ins.num()

  local lst = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' }
  vf.complete(v.Cursor.col_num(), lst)
  return ''
end

function v.Ins.reg()

  local lst = {
    v.Rgstr.get('0'),
    v.Rgstr.get('1'),
    v.Rgstr.get('2'),
    v.Rgstr.get('3')
  }
  vf.complete(v.Cursor.col_num(), lst )
  return ''
end

