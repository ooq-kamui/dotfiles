function cmdline__fzf_git_co_file_lst

  set file_path ( git-co-file-lst | fzf )

  set git_root_dir_rel ( git-root-pth-rel )

  commandline -i "$git_root_dir_rel$file_path"
end

