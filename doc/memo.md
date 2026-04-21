
# dotfiles


## watch

icn fix
- memo
- msg


## wez term

opacity tgl, key-bind, mac/win

```
local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('opacity-tgl', function(window, pane)

  local overrides = window:get_config_overrides() or {}

  local opacity_a = 0.8
  local opacity_b = 1.0

  if overrides.window_background_opacity == opacity_a then
    overrides.window_background_opacity = opacity_b
  else
    overrides.window_background_opacity = opacity_a
  end

  window:set_config_overrides(overrides)
end)

return {
  window_background_opacity = 0.8,
  keys = {
    { key = 'e', mods = 'CTRL|SHIFT', action = act.EmitEvent 'opacity-tgl' },
  },
}
```


## ai gemini

gemini cli
- call nano banana 2, terminal, try
  - extension install
    - mac
    - alm

gemini.md, try
- doc-tech write


## ai claude

at iphone, cmd
- doc-tech


## ai llm

ollama, gemma


## flo flow

pixel art, tidy

logic tidy

etc


## web-svr

web svr rpl
- task lst
  - spec confirm
    - strage
    - memory
  - nginx setting
  - ...


## nvim

x S, case: mb


plg
- blink.cmp
  - instl
    - https://eiji.page/blog/neovim-blink-cmp-intro/

- splitting/joining


## skr-vps

alm setting at skr console
- confirm
- firewall
  - url

