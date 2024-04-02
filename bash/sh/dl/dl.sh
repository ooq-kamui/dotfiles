#!/bin/bash

# dl-dl.sh  cre ( dl this sh )
# ```
# curl -Lo ~/sh/dl.sh \
#   https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/dl.sh
# ```

# bk

mkdir -p ~/bk.tmp

cp -p ~/.bashrc         ~/bk.tmp/
cp -p ~/.bashrc_gitbash ~/bk.tmp/

cp -p ~/.vimrc     ~/bk.tmp/
cp -p ~/.vimrc_win ~/bk.tmp/


# bash

#curl -Lo ~/.bash_profile \
#  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.bash_profile

curl -Lo ~/.bashrc \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.bashrc

curl -Lo ~/.bashrc_gitbash \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.bashrc_gitbash


# vim

curl -Lo ~/.vimrc \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/.vimrc

curl -Lo ~/.vimrc_win \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/.vimrc_win


# dl-cmd.dl

curl -Lo ~/sh/dl-cmd.sh \
  https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/dl-cmd.sh



