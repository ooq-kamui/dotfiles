# 
# source ~/.config/fish/config.fish
# 

set -U fish_greeting

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
set -x PATH /opt/homebrew/var/nodebrew/current/bin $PATH
#set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x NODEBREW_ROOT /opt/homebrew/var/nodebrew


# 
# ripgrep ( rg )
# 

set -x RIPGREP_CONFIG_PATH ~/.ripgreprc

# 
# fzf
# 

set -x FZF_DEFAULT_COMMAND ( fzf_fd_def )
set -x FZF_DEFAULT_OPTS    '--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'
set -x FZF_CTRL_T_COMMAND  ( echo $FZF_DEFAULT_COMMAND )
#set -x FZF_CTRL_T_OPTS
#set -x FZF_CTRL_R_OPTS


# 
# alias
# 

alias shutdown_start "sudo shutdown -r now"

alias clr 'clear'
alias clp 'pbcopy'

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias fi 'fish'

alias sh_ch_fi 'chsh -s /opt/homebrew/bin/fish'
alias sh_ch_ba 'chsh -s /bin/bash'

alias tmx      'tmux'
alias tmx_init 'fi ~/sh/tmux-win-init.fish'

alias his     'history'
alias his_del 'history delete'

alias to     'touch'
alias to_clr ':>'
alias cp 'cp -p'
alias rn 'rename'

alias cdp 'cd ../'

alias cd_dl    "cd ~/Downloads"
alias cd_iclud "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

alias cd_fish_fnc "cd ~/doc/tech/github/vimrc/.config/fish/functions"
alias cd_plist    "cd ~/Library/LaunchAgents"

alias cd_vim      "cd ~/doc/tech/github/vimrc"
alias cd_vim_swp  "cd ~/.local/state/nvim/swap"

alias dir 'z'

alias p 'pth'

alias l_clp "l | pbcopy"

alias vim "nvim -p"
alias vi  "nvim -p"

alias vi_fsh_cnf  "vi ~/.config/fish/config.fish"
alias vi_cnf      "vi ~/.config/fish/config.fish"

alias vi_vimrc    "vi ~/.vimrc"
alias vi_vim_swap "vi ~/.local/share/nvim/swap/"

#alias opn "open"

set -x LC_TIME en_US
alias da      "date_ymd"
alias da_y1   "date_y 1"
alias da_y2   "date_y 2"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"

alias du   "du -h"
alias du_1 "du -hd1"

alias trns   "trans"
alias trns_j "trans {ja=en}"
alias trns_e "trans {en=ja}"

alias ba 'battery'
alias ca 'cal'

alias fd "fd --hidden --follow --exclude .git"

alias rgf "rg -l"


# alias prj

alias cd_game "cd ~/doc/hoby/game"
alias cd_tech "cd ~/doc/tech"
alias cd_hoby "cd ~/doc/hoby"
alias cd_life "cd ~/doc/life"

alias cd_ooq_game    "cd ~/dev/ooq/g.proto/assets"
alias cd_ooq_game_bk "cd ~/dev/ooq/z.proto.bk"
alias cd_ooq_artcl   "cd ~/dev/ooq-artcl/hugo/content"

set   holo_dir     "~/doc/hoby/youtube/vtuber/holo"
alias cd_holo      "cd $holo_dir/prj/stt"
alias cd_holo_data "cd $holo_dir/prj/stt/www/song/data"

alias opn_github_vim  "open https://github.com/ooq-kamui/vimrc"
alias opn_github_holo "open https://github.com/ooq-kamui/holo-song"
alias opn_ooq         "open https://ooq.jp/"

alias ooq_artcl_build_rsync 'fish ~/dev/ooq-artcl/sh/build.rsync.fish'

# alias cmd path

alias uconv '/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'


# 
# bind
# 

bind \c_ 'clear; commandline -f repaint'

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
#bind \c? cmdline_quote
bind \ct cmdline_date
#bind \cq cmdline_date
bind \cx cmdline_his_del

# fzf
bind \cy fzf-file-widget
bind \cu fzf-history-widget

# erase
bind -e \cr 
#bind -e \ct
#bind -e \cx 


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta


# 
# cd
# 
#cd ~/dev/ooq/g.proto/assets



