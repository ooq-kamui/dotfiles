function pth

  if test -n "$argv[1]"
    set trgt $argv[1]
  else
    set trgt '.'
  end

  readlink -f $trgt
end

