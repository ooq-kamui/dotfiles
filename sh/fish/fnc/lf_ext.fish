function lf_ext

  fd | rg --only-matching '\.[^.]+$' | sort | uniq
end

