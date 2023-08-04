# 
# source ~/.config/fish/config.fish
# 

#set -x LSCOLORS fxgxcxdxexegedabagacad
set -x LSCOLORS fxgxcxdxxxegedabagacad
#               ^dir    ^exe
#                 ^lnk?
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


# 
# alias
# 

alias shutdown_start "sudo shutdown -r now"

#alias l "ls -1hAG"
alias lld "ll -d"

alias cp "cp -p"

alias pwd_cp "pwd | pbcopy"

alias cd_p1 "cd ../"
alias cd_p2 "cd ../../"
alias cd_p3 "cd ../../../"

alias cd_dl 'cd ~/Downloads'

alias cd_vim      "cd ~/doc/tech/github/vimrc"
alias cd_vim_swp  "cd ~/.local/state/nvim/swap"

alias cd_fish_fnc "cd ~/doc/tech/github/vimrc/.config/fish/functions"

alias cd_life    "cd ~/doc/life"
alias cd_tech    "cd ~/doc/tech"
alias cd_hoby    "cd ~/doc/hoby"
alias cd_game    "cd ~/doc/hoby/game"

alias cd_ooq_game    "cd ~/dev/ooq/g.proto/assets"
alias cd_ooq_game_bk "cd ~/dev/ooq/z.proto.bk"
alias cd_ooq_artcl   "cd ~/dev/ooq-artcl"

alias cd_holo      "cd ~/doc/hoby/youtube/vtuber/holo/prj"
alias cd_holo_data "cd ~/doc/hoby/youtube/vtuber/holo/prj/www/song/data"

alias vim "nvim -p"
alias vi  "nvim -p"

alias vi_vimrc    "vi ~/.vimrc"
alias vi_vim_swap "vi ~/.local/share/nvim/swap/"
alias vi_fsh_cnf  "vi ~/.config/fish/config.fish"
alias vi_cnf      "vi ~/.config/fish/config.fish"

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias du   "du -h"
alias du_1 "du -hd1"

set -x LC_TIME en_US
alias date_ymd   "date +'%Y-%m-%d'"
alias date_ymdhm "date +'%Y-%m-%d %H:%M'"
alias date_y1    "date_y 1"
alias date_y2    "date_y 2"
alias da         "date +'%Y-%m-%d %a'"
#alias date "date +'%Y-%m-%d %H:%M %a %Z'"

alias rgf "rg -l"

alias trns   "trans"
alias trns_j "trans {ja=en}"
alias trns_e "trans {en=ja}"

alias ba 'pmset -g ps | grep -oE "[0-9]+%"' # battery

alias history_del 'history delete'

alias opn "open"
alias opn_github_vim  "open https://github.com/ooq-kamui/vimrc"
alias opn_github_holo "open https://github.com/ooq-kamui/holo-song"
alias opn_ooq         "open https://ooq.jp/"

alias ooq_artcl_build_rsync 'fish ~/dev/ooq-artcl/sh/build.rsync.fish'


# 
# bind
# 

bind \cq 'clear; commandline -f repaint'

# corsor mv char
bind \cl forward-char
bind \cs backward-char

# corsor mv word
bind \co backward-word
bind \cf forward-word

#bind \cx backward-delete-char
bind \ck kill-word

# cmdline
bind \cc cmdline_pbcopy
bind \cb cmdline_bracket
bind \cg cmdline_quote

bind \c_ cmdline_date

bind \cu fzf-file-widget
bind \cy fzf-file-widget
#bind \cy fzf-history-widget

# dmy
#bind \cr cmdline_date
bind \ct cmdline_date
bind \cx cmdline_date


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta


# 
# cd
# 
#cd ~/dev/ooq/g.proto/assets



