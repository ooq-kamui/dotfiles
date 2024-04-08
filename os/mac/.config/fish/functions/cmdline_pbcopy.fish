function cmdline_pbcopy

  if type -q pbcopy
    echo (commandline) | pbcopy
  end
end

