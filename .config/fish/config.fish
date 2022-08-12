# 
# source ~/.config/fish/config.fish
# 

#export LSCOLORS=fxgxcxdxexegedabagacad
set -x LSCOLORS fxgxcxdxexegedabagacad
#               ^dir    ^exe
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey

# 
# path
# 

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH 
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x RIPGREP_CONFIG_PATH ~/.ripgreprc

set -x FZF_DEFAULT_OPTS '--bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'
#set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
#set -x FZF_CTRL_T_COMMAND  'rg --files --hidden --follow --glob "!.git/*"'


# 
# alias
# 

#alias l  "ls -1hAG"

alias vi  "nvim -p"
alias vim "nvim -p"

alias pwd_cp "pwd | pbcopy"

# 
# alias - short cut
# 
alias cd_up1  "cd ../"
alias cd_up2  "cd ../../"
alias cd_up3  "cd ../../../"

alias cd_vim       "cd ~/doc/tech/github/vimrc"
alias cd_vim_swp   "cd ~/.local/state/nvim/swap"
alias cd_life      "cd ~/doc/life"
alias cd_ooq       "cd ~/dev/ooq/g.proto/assets"
alias cd_ooq_bk    "cd ~/dev/ooq/z.proto.bk"
alias cd_holo      "cd ~/doc/hoby/youtube/vtuber/hololive/prj"
alias cd_holo_data "cd ~/doc/hoby/youtube/vtuber/hololive/prj/www/song/data"

alias vi_vimrc    "vi ~/.vimrc"
alias vi_vim_swap "vi ~/.local/share/nvim/swap/"
alias vi_fish_config "vi ~/.config/fish/config.fish"
alias vi_config      "vi ~/.config/fish/config.fish"
alias vi_doc "vi doc/memo.txt"

set -x LC_TIME en_US
alias date_ymd   "date +'%Y-%m-%d'"
alias date_ymdhm "date +'%Y-%m-%d %H:%M'"
#alias date "date +'%Y-%m-%d %H:%M %a %Z'"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"

alias trans_ja2en "trans {ja=en}"
alias trans_en2ja "trans {en=ja}"

#alias fzf="fzf --bind=ctrl-o:accept "
#alias rpl="string replace"
#alias f="mdfind -onlyin . -name"

# 
# bind
# 

# corsor mv char
bind \cL forward-char
bind \cS backward-char

# corsor mv word
bind \cO backward-word
bind \cF forward-word

bind \cK kill-word
#bind \cS backward-delete-char

bind \cx 'clear; commandline -f repaint'
bind \cq 'clear; commandline -f repaint'
#bind -k backspace 'clear; commandline -f repaint'

bind \cu fzf-file-widget
bind \cy fzf-history-widget
#bind \cy fzf-file-widget
#bind \cu fzf-history-widget

bind \cc commandline_pbcopy
bind \cb commandline_bracket
#bind \cr commandline_bracket


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta
#set fish_color_selection      --background=blue

# 
# lua
# 
#export LUA_PATH='/opt/homebrew/Cellar/luarocks/3.8.0/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;/opt/homebrew/lib/lua/5.4/?.lua;/opt/homebrew/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/kamui/.luarocks/share/lua/5.4/?.lua;/Users/kamui/.luarocks/share/lua/5.4/?/init.lua'
#export LUA_CPATH='/opt/homebrew/lib/lua/5.4/?.so;/opt/homebrew/lib/lua/5.4/loadall.so;./?.so;/Users/kamui/.luarocks/lib/lua/5.4/?.so'


# 
# cd
# 
#cd ~/dev/ooq/g.proto/assets

