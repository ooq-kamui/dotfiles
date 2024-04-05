function memo

  set dir ~/doc/tech/doc-tech

  set cmdsub "$argv[1]"

  if      test $cmdsub = 'cd'

    psh $dir

  else if test $cmdsub = 'fd'

    if test -z $argv[2]

      fd -e md '' $dir
    else
      fd -e md '' $dir | rg $argv[2]
    end

  else if test $cmdsub = 'rg'

    rg -N -g '*.md' "$argv[2]" $dir/
    #rg --heading -g '*.md' "$argv[2]" $dir/

  else if test $cmdsub = 'vi'

    vi -c ":cd $dir"
  end
end

