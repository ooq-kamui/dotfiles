
-- log

v.Log = {}

function v.Log.log(...) -- alias

  -- dev anchor
  if bl.t then
    v.Log.val(...)
  else
    v.Log.tbl(val)
  end
end

function v.Log.val(...)

  print(...)
  -- print(val)
end

function v.Log.tbl(tbl)

  print(vim.inspect(tbl))
end

