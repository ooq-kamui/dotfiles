function dir_jmp

  if test -z "$argv"

    set z_history_file_path ~/.local/share/z/data
    #echo $z_history_file_path

    set dir ( cat $z_history_file_path | sed 's/|.*//g' | fzf )

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

