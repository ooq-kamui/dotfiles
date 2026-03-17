
v.Nml = {}

function v.Nml.exe(nml_cmd) -- alias

  -- v.Log.log(nml_cmd)
  nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
  -- v.Log.log(nml_cmd)
  v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
end

v.Nml.n = {}

-- v.Nml.n.srch                        = '/'

-- v.Nml.n.line_shft_l                 = '<<'

v.Nml.n.cursor = {}
v.Nml.n.cursor.str = {}
v.Nml.n.cursor.str.icl              = '<c-a>'
v.Nml.n.cursor.str.dcl              = '<c-x>'


-- v.Nml.n.dmy                         = '<c-v>'

-- v.Nml.n.dmy                         = '<c-w>c>'
-- v.Nml.n.dmy                         = '<c-w>w>'

-- v.Nml.n.dmy                         = '<esc>'
-- v.Nml.n.dmy                         = '<gv'
-- v.Nml.n.dmy                         = '>gv'
-- v.Nml.n.dmy                         = 'D'
-- v.Nml.n.dmy                         = 'G'
-- v.Nml.n.dmy                         = 'I '
-- v.Nml.n.dmy                         = 'Jj'
-- v.Nml.n.dmy                         = 'N'
-- v.Nml.n.dmy                         = 'O'
-- v.Nml.n.dmy                         = 'P'
-- v.Nml.n.dmy                         = 'V'
-- v.Nml.n.dmy                         = '[m'
-- v.Nml.n.dmy                         = '[{'
-- v.Nml.n.dmy                         = '`[v`]h'
-- v.Nml.n.dmy                         = 'a <bs><esc>'
-- v.Nml.n.dmy                         = 'b'
-- v.Nml.n.dmy                         = 'e'
-- v.Nml.n.dmy                         = 'el'
-- v.Nml.n.dmy                         = 'g'
-- v.Nml.n.dmy                         = 'gegel'
-- v.Nml.n.dmy                         = 'gel'
-- v.Nml.n.dmy                         = 'gg'
-- v.Nml.n.dmy                         = 'ggVG'
-- v.Nml.n.dmy                         = 'gv"Ay'
-- v.Nml.n.dmy                         = 'gv'
-- v.Nml.n.dmy                         = 'gvj'
-- v.Nml.n.dmy                         = 'hxx'
--
-- v.Nml.n.dmy                         = 'n'
-- v.Nml.n.dmy                         = 'o'
-- v.Nml.n.dmy                         = 'r'
-- v.Nml.n.dmy                         = 'v'
-- v.Nml.n.dmy                         = 'viw'
-- v.Nml.n.dmy                         = 'v~'
-- v.Nml.n.dmy                         = 'w'
-- v.Nml.n.dmy                         = 'wh'
-- v.Nml.n.dmy                         = 'y'
-- v.Nml.n.dmy                         = '|'

v.Nml.n.cursor.mv = {}
-- v.Nml.n.cursor.mv.d                 = '<c-e>'
-- v.Nml.n.cursor.mv.u                 = '<c-y>'

-- v.Nml.n.cursor.mv.xx                = 'j'
-- v.Nml.n.cursor.mv.xx                = 'k'
-- v.Nml.n.cursor.mv.xx                = 'h'
-- v.Nml.n.cursor.mv.xx                = 'l'

-- v.Nml.n.cursor.mv.xx                = '$'

-- v.Nml.n.cursor.mv.xx                = '$h'
-- v.Nml.n.cursor.mv.xx                = '$l'

--
-- rgstr
--

-- v.Nml.n.rgstr.xx                    = '""P'
-- v.Nml.n.rgstr.xx                    = '"'
-- v.Nml.n.rgstr.xx                    = '"_dd'
-- v.Nml.n.rgstr.xx                    = '"a'
-- v.Nml.n.rgstr.xx                    = '"aP'
-- v.Nml.n.rgstr.xx                    = '"ad'
-- v.Nml.n.rgstr.xx                    = '"add'
-- v.Nml.n.rgstr.xx                    = '"ayy'
-- v.Nml.n.rgstr.xx                    = '"zP'
-- v.Nml.n.rgstr.xx                    = '"zd'
-- v.Nml.n.rgstr.xx                    = '"zx'
-- v.Nml.n.rgstr.xx                    = '"zy'
-- v.Nml.n.rgstr.xx                    = '"zyy"zP'

--
-- ins
--

-- v.Nml.n.ins.xx                      = "i' '"
-- v.Nml.n.ins.xx                      = 'i '
-- v.Nml.n.ins.xx                      = 'i'
-- v.Nml.n.ins.xx                      = 'i-'
-- v.Nml.n.ins.xx                      = 'i/'
-- v.Nml.n.ins.xx                      = 'i<cr>'
-- v.Nml.n.ins.xx                      = 'i\\'
-- v.Nml.n.ins.xx                      = 'i~'

