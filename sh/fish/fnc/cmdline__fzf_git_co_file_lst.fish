function cmdline__fzf_git_co_file_lst

  set file_path ( git_co_file_lst | fzf )

  set git_root_dir_rel ( git_root_pth_rel )

  commandline -i "$git_root_dir_rel$file_path"
end

