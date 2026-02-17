
# dotfiles


## nvim

dots > ruler_idx

v.Cursor.line_end__dots_adjst()

v.Cursor.line_end__ins_dots()


v.Str.byte_idx_by_ruler_idx(str, ruler_idx) -- todo dev

v.Str.sub_by_ruler_idx(str, ruler_idx_s, ruler_idx_e) -- todo dev

v.Str.srch_ruler_idx_by_ptn_vim(str, ptn_vim, srch_s_ruler_idx)

v.Str.word_ruler_idx_lst(str)


v.Line.end__pad_space(line_num, fil_end_byte_idx)


- tst
  - aaa                                            .. 
  - あいう                                         ..  


ptn
- def at str
- srch alias


v.Slctd.str_edge_r_out_char()
- with: cursor __ mv, not

slctd.str_edge_x_byte_idx()
- with v.Slctd.str_edge_pos()
- tst, confirm

v.Slctd.str_edge_xxx() > v.Slctd.edge_xxx()


vf.index() > tbl.xxx(), ret idx 1 start, match not : nil
- week __ inc, dcl


n q: mb err
function v.Line.word_ruler_idx(line_num, ruler_idx_min)

- tst
  - あいうえお  aa  bb  cc
  - a  b  c  e   f   g


cheat-sheet fzf opn
- <leader><c-s>


n E, err


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

