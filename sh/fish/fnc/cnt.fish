function cnt

  if test -z "$argv"

    cat - | count
  else

    count $argv
  end
end

