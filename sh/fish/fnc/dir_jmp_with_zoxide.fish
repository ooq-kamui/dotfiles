function dir_jmp_with_zoxide

  if test -z "$argv"

    set dir ( zoxide query --list | fzf )

    #if test -n "$dir"
    if test -z "$dir"
      return
    end

    cd $dir

  else
    z $argv

    if test "$status" -eq "1"
      return
    end
  end

  pth
end

