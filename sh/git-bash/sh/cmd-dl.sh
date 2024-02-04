#!/bin/bash

# dl-dl.sh cre ( this dl sh )
# ```
# curl -Lo ~/sh/dl.sh \
#   https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/dl.sh
# ```

# bk

mkdir -p ~/bk.tmp


# cmd

t_cmd=lf_ext

cp -p ~/sh/cmd/$t_cmd ~/bk.tmp/

curl -Lo ~/sh/cmd/$t_cmd \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/cmd/$t_cmd



