function commandline_cp
  if type -q pbcopy
    echo (commandline) | pbcopy
  end
end

