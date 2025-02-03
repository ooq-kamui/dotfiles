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
  end

  pth
end

