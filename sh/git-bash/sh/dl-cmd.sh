#!/bin/bash

# dl-dl.sh cre ( this dl sh )
# ```
# curl -Lo ~/sh/dl.sh \
#   https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/dl.sh
# ```

# bk
mkdir -p ~/bk.tmp
cp -p ~/sh/cmd/* ~/bk.tmp/


# cmd

#cmd_lst="cat_line fd_ext"

cmd_lst=$(cat <<EOS
cat_line
fd_ext
fzf-winpty
grep_ext
grep_ext_md
his
hlp
l
llr
lr
lrd
lrf
mb_cnv
mb_cnv_alpha
mb_cnv_num
mb_cnv_space
mb_cnv_symbol
memo
mv_ext
opn
pth
re
sed_y
trm
EOS
)
#echo $cmd_lst

for t_cmd in $cmd_lst
do
  #echo $t_cmd
  curl -Lo ~/sh/cmd/$t_cmd https://raw.githubusercontent.com/ooq-kamui/vimrc/master/sh/git-bash/sh/cmd/$t_cmd
done



