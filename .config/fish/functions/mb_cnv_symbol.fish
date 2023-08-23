function mb_cnv_symbol

  set srch '！＃＄％＆＊＋－＝：；？＠／＼＾＿｀～'
  set rpl  '!#$%&*+-=:;?@/\^_`~'

  cat -                |\
  sed                   \
    -e "y|$srch|$rpl|"  \
                        \
    -e "s|・| |g"       \
    -e "s/｜/|/g"       \
    -e "s|＇|'|g"       \
    -e 's|＂|"|g'       \
                        \
    -e "s|（| (|g"      \
    -e "s|）|) |g"      \
    -e "s|＜| <|g"      \
    -e "s|＞|> |g"      \
    -e "s|｛| {|g"      \
    -e "s|｝|} |g"      \
    -e 's|［| [|g'      \
    -e 's|］|] |g'      \
                        \
    -e "s|、|, |g"      \
    -e "s|。|. |g"      \
    -e "s|，|, |g"      \
    -e "s|．|. |g"      \
                        \
    -e "s|「||g"        \
    -e "s|」| |g"       \
    -e "s|『||g"        \
    -e "s|』| |g"       
end

