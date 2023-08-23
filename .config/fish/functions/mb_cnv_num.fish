function mb_cnv_num

  set srch '０１２３４５６７８９'
  set rpl  '0123456789'

  cat - |\
  sed -e "y|$srch|$rpl|"
end

