function memo

  set dir ~/wrk/doc/doc-tech

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

  else if test $cmdsub = 'slf'

    set slf_dir  ~/wrk/cnf/sh/fish/cnf/functions
    set slf_path $slf_dir/memo.fish

    vi $slf_path

  else if test $cmdsub = 'tmp'

    echo $cmdsub
  end
end

