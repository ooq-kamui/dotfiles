function emp_2_wildcard

  if test -z "$argv"
    set argv .* *
  end

  for _arg in $argv

    echo $_arg
  end
end

