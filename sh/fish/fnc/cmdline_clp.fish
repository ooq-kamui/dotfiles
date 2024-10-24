function cmdline_clp

  if type -q pbcopy
    echo (commandline) | pbcopy
  else
    # echo (commandline) | clp
  end
end

