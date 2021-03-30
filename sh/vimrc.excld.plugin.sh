#!/bin/bash

cat .vimrc                              |\
sed "/plugin  #bgn#/,/plugin  #end#/ d"  \
> dl.vimrc


