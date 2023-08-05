function date

  if test -z "$argv"

    command date +'%Y-%m-%d %a'
  else
    command date $argv
  end
end

