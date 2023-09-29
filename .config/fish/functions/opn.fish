function opn

  if test -z "$argv"
    set path .
  else
    set path $argv
  end

  open $path
end

