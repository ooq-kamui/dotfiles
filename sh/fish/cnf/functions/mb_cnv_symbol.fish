function mb_cnv_symbol

  set srch '！＃＄％＆＊＋－＝：；？＠／＼＾＿｀～'
  set rpl  '!#$%&*+-=:;?@/\^_`~'

  cat -            |\
  sed_y $srch $rpl |\
  sed               \
    -e "s|・| |g"   \
    -e "s/｜/|/g"   \
    -e "s|＇|'|g"   \
    -e 's|＂|"|g'   \
                    \
    -e "s|（| (|g"  \
    -e "s|）|) |g"  \
    -e "s|＜| <|g"  \
    -e "s|＞|> |g"  \
    -e "s|｛| {|g"  \
    -e "s|｝|} |g"  \
    -e 's|［| [|g'  \
    -e 's|］|] |g'  \
                    \
    -e "s|、|, |g"  \
    -e "s|。|. |g"  \
    -e "s|，|, |g"  \
    -e "s|．|. |g"  \
                    \
    -e "s|「||g"    \
    -e "s|」| |g"   \
    -e "s|『||g"    \
    -e "s|』| |g"   \

end

