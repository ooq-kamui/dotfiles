function dir_trim

  for _dir in $argv

    set _dir ( string replace -r '/$' '' $_dir )

    echo $_dir
    #set r_dir $r_dir $_dir
  end

  #echo $r_dir
end

