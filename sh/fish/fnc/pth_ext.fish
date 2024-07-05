function pth_ext

  cat - |\
  sed 's|^.*\.\([^\.]*\)$|\1|'

  # awk -F. '{print $NF}'

end

