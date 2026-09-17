
-- log

v.Log = {}

function v.Log.log(...) -- alias

  local len = select('#', ...)
  local val1 = ...

  if len == 1 and v.Var.is__tbl(val1) then
    v.Log.tbl(val1)
  else
    v.Log.val(...)
  end
end

function v.Log.val(...)

  print(...)
end

function v.Log.tbl(tbl)

  print(vim.inspect(tbl))
end

