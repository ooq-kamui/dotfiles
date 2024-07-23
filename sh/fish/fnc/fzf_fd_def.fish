function fzf_fd_def

  echo fd                                \
    --color=always                       \
    --hidden                             \
    --follow                             \
    -I                                   \
    --exclude '.git'                     \
                                         \
    --exclude '\#current-cloud-backend/' \
    --exclude '.docusaurus/'             \
    --exclude 'build/'                   \
    --exclude 'node_modules/'            \

#  --type f             \

end

