function battery

  pmset -g ps        |\
  grep -oE '[0-9]+%'
end

