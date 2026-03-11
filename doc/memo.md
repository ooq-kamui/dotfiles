
# dotfiles


## nvim

fzf rslt
- case: file same, win split
- buf.drp
- or opn opt


```lua

local rg_cmd = '....'

local spec = vim.fn['fzf#vim#with_preview'](
  {
    options = '--exact --delimiter : --nth 3.. --expect=ctrl-o',
  },
  'up:70%:hidden',
  'ctrl-u'
)

spec['sink*'] = fzf_handler

vim.fn['fzf#vim#grep'](rg_cmd, 1, spec, 1)
```


cmd_nml, tidy
- cls cre


slctd reduce , case: __xx_bb__


plg-mng
- lazy
  - ref https://lazy.folke.io/installation
  - by ai


plg
- blink.cmp
  - instl
    - https://eiji.page/blog/neovim-blink-cmp-intro/


## wez

tab new, dir same, off


## skr-vps

web-svr rpl

alm setting at skr console
- confirm
- firewall
  - url

