function pth_ext

  cat - |\
  sed 's|^.*\.\([^\.]*\)$|\1|'
end

