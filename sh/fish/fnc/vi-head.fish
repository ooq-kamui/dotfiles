function vi-head

  if test -z "$argv[1]"
    return
  end

  set file_path "$argv[1]"

  git show HEAD:$file_path | nvim -
end

