function cmdline__fzf_git_file_lst_by_status

  set file_path ( git-file-lst-by-status | fzf )

  set git_root_dir_rel ( git-root-pth-rel )

  commandline -i "$git_root_dir_rel$file_path"
end

