function cmdline__fzf_git_file_lst_by_commit_id

  set file_path ( git-file-lst-by-commit-id | fzf )

  set git_root_dir_rel ( git-root-pth-rel )

  commandline -i "$git_root_dir_rel$file_path"
end

