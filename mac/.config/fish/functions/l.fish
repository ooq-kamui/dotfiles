function l

  if      test -z "$argv[1]"

    fd -d 1 ''

  else if test -d "$argv[1]"

    fd -d 1 '' $argv[1]
    #ls -1AG $argv

  else if test -f "$argv[1]"

    ls -1 $argv[1]
    #ls -G $argv[1]
  else
    fd -d 1 '$argv[1]'
  end
end

