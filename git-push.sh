#!/bin/bash

cp ~/.vimrc .vimrc                                                                
sh vimrc.excld.plugin.sh                                                          
git add .        
git commit -m "mod"
git push origin master



