function mb__cnv_symbol

  set srch '！＃＄％＆＊＋－＝：；？＠／＾＿｀～'
  set rpl  '!#$%&*+-=:;?@/^_`~'

  #set srch '＼'
  #set rpl  '\'

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
                    \
    -e "s|①|1. |g"  \
    -e "s|②|2. |g"  \
    -e "s|③|3. |g"  \
    -e "s|④|4. |g"  \
    -e "s|⑤|5. |g"  \
    -e "s|⑥|6. |g"  \
    -e "s|⑦|7. |g"  \
    -e "s|⑧|8. |g"  \
    -e "s|⑨|9. |g"  \
    -e "s|⑩|10. |g" \
                    \
    -e "s|※|*|g"    \
    -e "s|→|-> |g"  \
    -e "s|⇒|-> |g"  \

end

