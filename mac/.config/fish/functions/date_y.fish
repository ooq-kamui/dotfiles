function date_y

  if test -n "$argv[1]"
    set num $argv[1]
  else
    set num 1
  end

  date -v -{$num}d +"%Y-%m-%d"
end

