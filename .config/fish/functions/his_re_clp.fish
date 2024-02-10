function his_re_clp

  if test -n "$argv[1]"
    set num $argv[1]
  else
    set num 1
  end

  set exe ( history | sed -n "$num p" | string split " " )
  #echo $exe

  $exe | clp
end

