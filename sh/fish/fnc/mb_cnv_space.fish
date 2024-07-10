function mb_cnv_space

  set srch '　'
  set rpl  ' '

  cat - |\
  sed_y $srch $rpl

end

