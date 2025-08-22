
# dotfiles


## nvim

mb tidy
- call Cursor.__mv_by_line_col, in for
  - use ?
    - vim.fn.strdisplaywidth()
    - vim.fn.screenpos()
- tst
    aaa   bbb    ccc
    aaa   bbb    ccc    ddd
    あいうえお     aaa   bbb    ccc
    あいうえお     aaa   bbb    ccc

```
local function move_to_display_col(col)
  local line = vim.api.nvim_get_current_line()
  local byte_col = vim.fn.byteidx(line, col - 1)
  if byte_col == -1 then
    byte_col = #line
  end
  vim.api.nvim_win_set_cursor(0, {vim.fn.line('.'), byte_col})
end
```

```
-- 表示上の10列目に移動
move_to_display_col(10)

-- キーマップに設定
vim.keymap.set('n', '<leader>g', function()
  local col = vim.fn.input('Column: ')
  move_to_display_col(tonumber(col))
end)
```


## skr-vps

alm
- ssh key cre


## aws

q dev try
- setting
  - account cre ?

gen2 try


## godot

platformer
- tutorial

game cre
- prj cre
- map cre
- chara cre


## nvim

plg
- nvim-treesitter

file type java
- cmnt
- syntax color

dir ch
- `:d, :p`
- dir_start
- dir_buf

plg
- lualine
- lazy
- coc


## skr-vps

centos setting at skr console
- firewall
  - url


