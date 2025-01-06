function lrf_ext

  fd |\
  stdin_ext_uniq


  # fd | rg --only-matching '\.[^.]+$' | sort | uniq
end

