function dir_jmp_lst

    set z_history_file_path ~/.local/share/z/data
    #echo $z_history_file_path

    cat $z_history_file_path | sed 's/|.*//g'
end

