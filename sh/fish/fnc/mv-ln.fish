function mv-ln --argument-names file_name_old file_name_new

  mv        $file_name_old $file_name_new
  and ln -s $file_name_new $file_name_old
end

