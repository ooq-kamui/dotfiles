
v.File = {}

function v.File.load(file_path)

  local file, err = io.open(file_path, 'r')

  if not file then
    -- print("Failed to read file: " .. err)
    return
  end

  local txt = file:read('*a') -- ファイル全体を読み込み

  file:close()
  -- print("Data loaded from: " .. file_path)

  return txt
end

function v.File.save(file_path, txt)

  local file, err = io.open(file_path, 'w')

  if not file then
    -- print("Failed to write file: " .. err)
    return
  end

  file:write(txt)
  file:close()
end

-- file tmp

function v.File.tmp__cre() -- alias

  local tmp_path = vf.system('mktemp ')
  return tmp_path
end

