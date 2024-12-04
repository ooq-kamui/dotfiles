function col

  set awk_arg_col

  for col_num in $argv

    set awk_arg_col $awk_arg_col '$'$col_num
  end

  set awk_arg_col ( string join , $awk_arg_col )

  #echo $awk_arg_col
  cat - | awk_by_arg_col $awk_arg_col
end

