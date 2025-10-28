-- 
-- win ofc
-- 

config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}

config.font_size = 13

-- For example, changing the initial geometry for new windows:
config.initial_cols = 183
config.initial_rows =  40

wezterm.on('gui-startup', function()
  wezterm.mux.spawn_window({
    position = {
      x = 50,
      y = 10,
      origin = 'ActiveScreen',
    },
  })
end)

