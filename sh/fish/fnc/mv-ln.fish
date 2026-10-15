function mv-ln --argument-names file_name_old file_name_new

  if test (count $argv) -ne 2
    echo 'usage: mv-ln <file_name_old> <file_name_new>' >&2
    return 1
  end

  # mv 先が dir の場合は, その中に mv された file を link 先にする
  set -l file_pth_new $file_name_new
  if test -d $file_name_new
    set file_pth_new $file_name_new/( basename $file_name_old )
  end

  # link 先は絶対 path にする ( 相対 path だと link の置き場所から解釈されて壊れるため )
  mv        $file_name_old $file_name_new
  and ln -s ( realpath $file_pth_new ) $file_name_old
end
