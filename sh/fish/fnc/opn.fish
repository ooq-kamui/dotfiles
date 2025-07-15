function opn

  if test -z "$argv"
    set path .
  else
    set path $argv
  end

  set st ( uname -a | grep -o 'WSL2' )

  if test "$st" = "WSL2"
    explorer.exe $path
  else
    open $path
  end
end

