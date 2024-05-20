function memo

  set dir ~/wrk/doc-tech

  set cmdsub "$argv[1]"

  if      test $cmdsub = 'cd'

    psh $dir

  else if test $cmdsub = 'fd'

    set ptn "$argv[2]"

    if test -z $ptn

      fd -e md '' $dir
    else

      if      test -z $argv[3]

        fd -e md '' $dir | rg $ptn

      else if test $argv[3] = 'vi'

        vi ( fd -e md '' $dir | rg $ptn )
      end
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

  else
    echo "cmdsub : $cmdsub ?"
  end
end

