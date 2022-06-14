# fish

cat .vimrc                              |\
sed "/plugin  #bgn#/,/plugin  #end#/ d"  \
> .tmp.vimrc

