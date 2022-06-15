# 
# source ~/.config/fish/config.fish
# 

export LSCOLORS=fxgxcxdxexegedabagacad
#               ^dir    ^exe
# a:black, b:red, c:green, d:brown, e:blue,
# f:magenta, g:cyan, h:grey

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH 
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x RIPGREP_CONFIG_PATH ~/.ripgreprc

#set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
#set -x FZF_CTRL_T_COMMAND  'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'

# alias
alias l  "ls -1hAG"
#alias ll "ls -lgohAGD '%Y-%m-%d %H:%M'"
#alias ld "l  -d"
#alias ll "ls -lgohAGD '%Y-%m-%d %H:%M' | cut -b14-"

alias vi  "nvim -p"
alias vim "nvim -p"

#alias fzf="fzf --bind=ctrl-o:accept "
#alias rpl="string replace"
#alias f="mdfind -onlyin . -name"

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


#cd ~/dev/ooq/g.prototype/001/assets/

# 
# lua
# 
export LUA_PATH='/opt/homebrew/Cellar/luarocks/3.8.0/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;/opt/homebrew/lib/lua/5.4/?.lua;/opt/homebrew/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/kamui/.luarocks/share/lua/5.4/?.lua;/Users/kamui/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/opt/homebrew/lib/lua/5.4/?.so;/opt/homebrew/lib/lua/5.4/loadall.so;./?.so;/Users/kamui/.luarocks/lib/lua/5.4/?.so'


