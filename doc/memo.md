
# dotfiles


## nvim

ptn
- ptn_vim, ptn_lua
- cnst ptn def

v.Str.is__ptn() -- vim


v.Str.srch_byte_idx_with_lua()
- > xxx_with_ptn_lua(), xxx_with_ptn_vim()
- rpl ? v.Str.srch_byte_idx_with_vim()


slctd.edge_x_byte_idx()
- cre
v.Slctd.is_str_edge_l_byte_idx__line_top()
- l get: method ch, tgl > ??
- key: f b + r l


srch_byte_idx_with_vim_end() union



n q: mb err
function v.Line.word_ruler_idx(line_num, ruler_idx_min)

- tst
  - あいうえお  aa  bb  cc
  - a  b  c  e   f   g


v.Slctd.is_cursor_pos__r()

v.Line.end__pad_space(line_num, fil_end_byte_idx)


v.Slctd.str_edge_r_out_char()
- logic: cursor __ mv not


cheat-sheet fzf opn
- <leader><c-s>


n E, err
- case: /  after
  - srch str flt
```
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vim.api.nvim_create_augroup("SearchCallback", { clear = true }),
  pattern = { "/", "?" }, -- 検索コマンドのみを対象にする
  callback = function()
    -- 検索がキャンセル（Escなど）された場合は実行しないための判定
    if vim.v.event.abort then
      return
    end

    -- ここに呼び出したい所定の関数を書く
    print("検索が完了しました！")
    -- your_function() 
  end,
})
```


## wez

tab new time
- win, mac
  - confirm
    - case: color-scheme lst off


## kiro

kiro-cli
- instl


## godot

platformer
- tutorial

game cre
- map cre
- chara cre


## nvim

fzf rslt, case: file same, win split

plg-mng
- lazy
  - ref https://lazy.folke.io/installation

plg
- blink.cmp
  - instl
    - https://eiji.page/blog/neovim-blink-cmp-intro/

v.Sys.sh_run_by_slctd_line()
- confirm at dialog ( neovim )
  - view log
  - use nui.nvim

plg
- noice.nvim


## skr-vps

web-svr rpl

alm setting at skr console
- confirm
- firewall
  - url

