

# nnoremap :o :Opn 
# vim.keymap.set('n', 'xx', ':call Load_re()')

# excld

cat nnoremap-cnv-tst-space.lua


cat nnoremap-cnv-tst-space.lua |\
sed -E '/nnoremap / s|nnoremap +([^ ]+) +(.*)|vim.keymap.set("n", "\1", "\2")|g'



# sed '/nnoremap / s/nnoremap \+\([^ ]\+\) +\([^ ]\+\)$/vim.keymap.set("n", "\1", "\2")/g'


