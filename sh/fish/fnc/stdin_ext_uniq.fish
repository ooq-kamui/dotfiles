function stdin_ext_uniq

  cat -                         |\
  rg --only-matching '\.[^.]+$' |\
  sort | uniq

  # sed -e 's|^.*\([^/.]+\.[^/.]+\)$|\1|'
end

