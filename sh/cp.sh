#!/bin/bash

dir_fr=~
dir_to=~/doc/tech/github/vimrc

dir_fr_config=$dir_fr/.config
dir_to_config=$dir_to/.config

#sh sh/vimrc.excld.plugin.sh                                                          

cp $dir_fr/.vimrc      $dir_to/
cp $dir_fr/.ripgreprc  $dir_to/
cp $dir_fr/.tmux.conf  $dir_to/

cp $dir_fr/.config/fish/config.fish     $dir_to/.config/fish/

cp $dir_fr/.config/nvim/syntax/lua.vim  $dir_to/.config/nvim/syntax/
cp $dir_fr/.config/nvim/ftplugin/qf.vim $dir_to/.config/nvim/ftplugin/

dir_fr_karabiner=$dir_fr_config/karabiner
dir_to_karabiner=$dir_to_config/karabiner

cp $dir_fr_karabiner/karabiner.json $dir_to_karabiner/
cp $dir_fr_karabiner/assets/complex_modifications/* $dir_to_karabiner/assets/complex_modifications/

# vscode settings.json


