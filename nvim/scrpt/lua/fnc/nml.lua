
v.Nml = {}

function v.Nml.exe(nml_cmd) -- alias

  -- v.Log.log(nml_cmd)
  nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
  -- v.Log.log(nml_cmd)
  v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
end

v.Nml.cmd = {}

-- v.Nml.cmd.srch                        = '' -- '/'
-- v.Nml.cmd.line_shft_l                 = '' -- '<<'
-- v.Nml.cmd.dmy                         = '' -- '<c-a>'
-- v.Nml.cmd.dmy                         = '' -- '<c-e>'
-- v.Nml.cmd.dmy                         = '' -- '<c-v>'
-- v.Nml.cmd.dmy                         = '' -- '<c-w>c>'
-- v.Nml.cmd.dmy                         = '' -- '<c-w>w>'
-- v.Nml.cmd.dmy                         = '' -- '<c-x>'
-- v.Nml.cmd.dmy                         = '' -- '<c-y>'
-- v.Nml.cmd.dmy                         = '' -- '<esc>'
-- v.Nml.cmd.dmy                         = '' -- '<esc>'
-- v.Nml.cmd.dmy                         = '' -- '<gv'
-- v.Nml.cmd.dmy                         = '' -- '>gv'
-- v.Nml.cmd.dmy                         = '' -- 'D'
-- v.Nml.cmd.dmy                         = '' -- 'G'
-- v.Nml.cmd.dmy                         = '' -- 'I '
-- v.Nml.cmd.dmy                         = '' -- 'Jj'
-- v.Nml.cmd.dmy                         = '' -- 'N'
-- v.Nml.cmd.dmy                         = '' -- 'O'
-- v.Nml.cmd.dmy                         = '' -- 'P'
-- v.Nml.cmd.dmy                         = '' -- 'V'
-- v.Nml.cmd.dmy                         = '' -- '[m'
-- v.Nml.cmd.dmy                         = '' -- '[{'
-- v.Nml.cmd.dmy                         = '' -- '`[v`]h'
-- v.Nml.cmd.dmy                         = '' -- 'a <bs><esc>'
-- v.Nml.cmd.dmy                         = '' -- 'b'
-- v.Nml.cmd.dmy                         = '' -- 'e'
-- v.Nml.cmd.dmy                         = '' -- 'el'
-- v.Nml.cmd.dmy                         = '' -- 'g'
-- v.Nml.cmd.dmy                         = '' -- 'gegel'
-- v.Nml.cmd.dmy                         = '' -- 'gel'
-- v.Nml.cmd.dmy                         = '' -- 'gg'
-- v.Nml.cmd.dmy                         = '' -- 'ggVG'
-- v.Nml.cmd.dmy                         = '' -- 'gv"Ay'
-- v.Nml.cmd.dmy                         = '' -- 'gv'
-- v.Nml.cmd.dmy                         = '' -- 'gvj'
-- v.Nml.cmd.dmy                         = '' -- 'hxx'
--
-- v.Nml.cmd.dmy                         = '' -- 'n'
-- v.Nml.cmd.dmy                         = '' -- 'o'
-- v.Nml.cmd.dmy                         = '' -- 'r'
-- v.Nml.cmd.dmy                         = '' -- 'v'
-- v.Nml.cmd.dmy                         = '' -- 'viw'
-- v.Nml.cmd.dmy                         = '' -- 'v~'
-- v.Nml.cmd.dmy                         = '' -- 'w'
-- v.Nml.cmd.dmy                         = '' -- 'wh'
-- v.Nml.cmd.dmy                         = '' -- 'y'
-- v.Nml.cmd.dmy                         = '' -- '|'
--
--
-- v.Nml.cmd.dmy                         = '' --
-- v.Nml.cmd.dmy                         = '' -- cursor mv
-- v.Nml.cmd.dmy                         = '' --
--
-- v.Nml.cmd.dmy                         = '' -- 'j'
-- v.Nml.cmd.dmy                         = '' -- 'k'
-- v.Nml.cmd.dmy                         = '' -- 'h'
-- v.Nml.cmd.dmy                         = '' -- 'l'
-- v.Nml.cmd.dmy                         = '' -- '$'
-- v.Nml.cmd.dmy                         = '' -- '$h'
-- v.Nml.cmd.dmy                         = '' -- '$l'
--
-- v.Nml.cmd.dmy                         = '' --
-- v.Nml.cmd.dmy                         = '' -- rgstr
-- v.Nml.cmd.dmy                         = '' --
--
-- v.Nml.cmd.dmy                         = '' -- '""P'
-- v.Nml.cmd.dmy                         = '' -- '"'
-- v.Nml.cmd.dmy                         = '' -- '"_dd'
-- v.Nml.cmd.dmy                         = '' -- '"a'
-- v.Nml.cmd.dmy                         = '' -- '"aP'
-- v.Nml.cmd.dmy                         = '' -- '"ad'
-- v.Nml.cmd.dmy                         = '' -- '"add'
-- v.Nml.cmd.dmy                         = '' -- '"ayy'
-- v.Nml.cmd.dmy                         = '' -- '"zP'
-- v.Nml.cmd.dmy                         = '' -- '"zd'
-- v.Nml.cmd.dmy                         = '' -- '"zx'
-- v.Nml.cmd.dmy                         = '' -- '"zy'
-- v.Nml.cmd.dmy                         = '' -- '"zyy"zP'
--
-- v.Nml.cmd.dmy                         = '' --
-- v.Nml.cmd.dmy                         = '' -- ins
-- v.Nml.cmd.dmy                         = '' --
--
-- v.Nml.cmd.dmy                         = '' -- "i' '"
-- v.Nml.cmd.dmy                         = '' -- 'i '
-- v.Nml.cmd.dmy                         = '' -- 'i'
-- v.Nml.cmd.dmy                         = '' -- 'i-'
-- v.Nml.cmd.dmy                         = '' -- 'i/'
-- v.Nml.cmd.dmy                         = '' -- 'i<cr>'
-- v.Nml.cmd.dmy                         = '' -- 'i\\'
-- v.Nml.cmd.dmy                         = '' -- 'i~'

