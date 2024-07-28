function dir_jmp

  if test -z "$argv"

    cd ( cat /Users/kamui/.local/share/z/data | sed 's/|.*//g' | fzf )

  else
    z $argv
  end

  pth
end

