
-- log

v.Log = {}

function v.Log.log(val) -- alias

  if bl.t then
    v.Log.val(val)
  else
    v.Log.tbl(val)
  end
end

function v.Log.val(val)

  print(val)
end

function v.Log.tbl(tbl)

  print(vim.inspect(tbl))
end

