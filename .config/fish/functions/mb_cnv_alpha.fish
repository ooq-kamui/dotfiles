function mb_cnv_alpha

  set srch_l 'ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ'
  set srch_u 'ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ'

  set rpl_l  'abcdefghijklmnopqrstuvwxyz'
  set rpl_u  'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  cat - |\
  sed -e "y|$srch_l$srch_u|$rpl_l$rpl_u|"
end

