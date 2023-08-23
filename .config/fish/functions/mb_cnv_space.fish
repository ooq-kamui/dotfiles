function mb_cnv_space

  set srch '　'
  set rpl  ' '

  cat - |\
  sed -e "y|$srch|$rpl|"
end

