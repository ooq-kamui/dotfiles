function mv_excld
  
  if test -n "$argv[1]"
    set fr_dir (string trim -r -c / $argv[1] )
  else
    return
  end

  if test -n "$argv[2]"
    set to_dir (string trim -r -c / $argv[2] )
  else
    return
  end

  if test -n "$argv[3]"
    set excld_files $argv[3..]
  else
    set excld_files ''
  end

  # if ! test -d "$fr_dir"
  if not test -d "$fr_dir"
    echo '$arg[1] is not dir'
    return
  end

  set fr_file_lst_tmp ( command ls $fr_dir )

  # set fr_file_lst ''

  for fr_file in $fr_file_lst_tmp

    if contains $fr_file $to_dir $excld_files
      # echo 'true'
    else
      set fr_file_lst $fr_file_lst $fr_file
    end
  end

  # echo $fr_file_lst_tmp
  # echo $to_dir
  # echo $excld_files
  # echo $fr_file_lst

  echo "mv $fr_file_lst $to_dir"

  mv $fr_file_lst $to_dir
end

