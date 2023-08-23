function mb_cnv_alpha

  set srch_l 'ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ'
  set rpl_l  'abcdefghijklmnopqrstuvwxyz'

  set srch_u 'ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ'
  set rpl_u  'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  cat -                |\
  sed_y $srch_l $rpl_l |\
  sed_y $srch_u $rpl_u
end

