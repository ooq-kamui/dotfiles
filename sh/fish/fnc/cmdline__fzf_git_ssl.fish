function cmdline__fzf_git_ssl

  set tmp_file_path ( mktemp )

  ji_ssl > $tmp_file_path

  commandline -i ( cat $tmp_file_path | fzf )
end

