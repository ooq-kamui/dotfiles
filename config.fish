
#cd ~/dev/ooq/g.prototype/001/assets/

export LSCOLORS=fxfxcxdxexegedabagacad
#               ^dir    ^exe

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH 
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x RIPGREP_CONFIG_PATH ~/.ripgreprc
#set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
#set -x FZF_CTRL_T_COMMAND  'rg --files --hidden --follow --glob "!.git/*"'

alias ll="la"
#alias ls="ls -1"
#alias vim="nvim"
#alias vi="nvim"

#alias f="mdfind -onlyin . -name"

# corsor mv char
bind \cL forward-char
#bind \cO backward-char

# corsor mv word
bind \cO backward-word
bind \cF forward-word

bind \cK kill-word
#bind \cQ kill-word
#bind \cS backward-delete-char


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta
#set fish_color_selection      --background=blue


