function mb__cnv_num

  set srch '０１２３４５６７８９'
  set rpl  '0123456789'

  cat - |\
  sed_y $srch $rpl

end

