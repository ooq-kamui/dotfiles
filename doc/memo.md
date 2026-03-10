
# dotfiles


## nvim

fzf rslt
- case: file same, win split
- buf.drp
- or opn opt


```lua
local function fzf_handler(lines)

  if #lines < 2 then return end

  local key = lines[1]
  local selection = lines[2]
  local parts = vim.split(selection, ":")
  local filename = parts[1]
  local lnum = parts[2]

  smart_open(filename, lnum)
end

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


plg-mng
- lazy
  - ref https://lazy.folke.io/installation
  - by ai


plg
- blink.cmp
  - instl
    - https://eiji.page/blog/neovim-blink-cmp-intro/


## claude

try


## skr-vps

web-svr rpl

alm setting at skr console
- confirm
- firewall
  - url

