
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

function v.File.txt(file_path)

  if not vf.filereadable(file_path) then
    return
  end

  local cmd = 'cat ' .. file_path

  local pth_lst_txt = v.Sys.cmd(cmd)
  return pth_lst_txt
end

function v.File.line_ar(file_path)

  local file_txt = v.File.txt(file_path)
  local file_line_ar = v.Txt._to_ar(file_txt)
  return file_line_ar
end

-- file cnd

function v.File.is__readable(file_name)

  local ret = vf.filereadable(file_name)
  return ret
end

