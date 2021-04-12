#!/bin/bash

dir_fr=~
dir_to=~/doc/tech/github/vimrc

dir_fr_config=$dir_fr/.config
dir_to_config=$dir_to/.config

dir_fr_karabiner=$dir_fr_config/karabiner
dir_to_karabiner=$dir_to_config/karabiner

dir_cmplxmod=assets/complex_modifications

dir_fr_cmplxmod=$dir_fr_karabiner/$dir_cmplxmod
dir_to_cmplxmod=$dir_to_karabiner/$dir_cmplxmod

cp $dir_fr_karabiner/karabiner.json $dir_to_karabiner/

file="
num__symbl.json
0__underscore.json
shift__num_pad.json
esc__add_eisu.json
shift__bracket.json
"

for f in $file
do
  cp $dir_fr_cmplxmod/$f $dir_to_cmplxmod/
done


