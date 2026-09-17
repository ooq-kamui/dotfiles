
-- date

v.Date = {}

v.Date.week_def = { 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' }

function v.Date.str_by_format(format)

  local str = vf.strftime(format)
  return str
end

function v.Date.str(format) -- alias

  return v.Date.str_by_format(format)
end

function v.Date.da()

  local format = '%Y-%m-%d'
  local str = v.Date.str(format)
  return str
end

function v.Date.tm()

  local format = '%H:%M'
  local str = v.Date.str(format)
  return str
end

function v.Date.dt()

  local format = '%Y-%m-%d.%H:%M'
  local str = v.Date.str(format)
  return str
end

function v.Date.ts()

  local format = '%Y-%m-%d.%H:%M:%S'
  local str = v.Date.str(format)
  return str
end

function v.Date.week()

  local format = '%w'
  local idx = v.Date.str(format) + 1
  local str = v.Date.week_def[idx]
  return str
end

