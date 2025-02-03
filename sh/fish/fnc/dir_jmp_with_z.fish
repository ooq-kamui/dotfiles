function dir_jmp_with_z

  if test -z "$argv"

    set z_history_file_path ~/.local/share/z/data
    #echo $z_history_file_path

    # set dir ( cat $z_history_file_path | sed 's/|.*//g' | fzf )
    set dir ( dir_jmp_lst_with_z | fzf )

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

