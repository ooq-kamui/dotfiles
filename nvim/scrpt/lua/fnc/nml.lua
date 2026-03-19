
v.Nml = {}

function v.Nml.exe(nml_cmd) -- alias
  -- v.Log.log(nml_cmd)
  nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
  -- v.Log.log(nml_cmd)
  v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
end

function v.Nml.ins(str)

  v.Cmd.cmd('exe "normal! ' .. 'i' .. str .. '"')
end

v.Nml.n = {}

v.Nml.n.srch                         = '/'

v.Nml.n.cursor = {}

v.Nml.n.cursor.line = {}
v.Nml.n.cursor.line.shft_l           = '<<'

v.Nml.n.cursor.word = {}
v.Nml.n.cursor.word.icl              = '<c-a>'
v.Nml.n.cursor.word.dcl              = '<c-x>'

v.Nml.n.cursor.line.f_str = {}
v.Nml.n.cursor.line.f_str.del = 'D'

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


v.Nml.n.win = {}
v.Nml.n.win.splt = {}
v.Nml.n.win.splt.quit = '<c-w>c>'
v.Nml.n.win.splt.nxt  = '<c-w>w>'

v.Nml.n.esc                         = '<esc>'


v.Nml.n.slctd = {}
-- v.Nml.n.dmy                         = '<gv'
-- v.Nml.n.dmy                         = '>gv'


-- v.Nml.n.dmy                         = 'G'
-- v.Nml.n.dmy                         = 'I '
-- v.Nml.n.dmy                         = 'Jj'
-- v.Nml.n.dmy                         = 'N'
-- v.Nml.n.dmy                         = 'O'
-- v.Nml.n.dmy                         = 'o'
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
-- v.Nml.n.dmy                         = 'r'
-- v.Nml.n.dmy                         = 'v'
-- v.Nml.n.dmy                         = 'viw'
-- v.Nml.n.dmy                         = 'v~'
-- v.Nml.n.dmy                         = 'w'
-- v.Nml.n.dmy                         = 'wh'
-- v.Nml.n.dmy                         = 'y'
-- v.Nml.n.dmy                         = '|'

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


v.Nml.n.mode = {}
v.Nml.n.mode.box          = '<c-v>'
v.Nml.n.mode.ins          = 'i'


-- 
-- slctd
-- 

v.Nml.x = {}
v.Nml.x.cursor = {}
v.Nml.x.cursor.mv = {}
v.Nml.x.cursor.mv.edge_tgl = 'o'


-- 
-- ins
-- 

v.Nml.n.ins = {}
v.Nml.n.ins.quote_space = v.Nml.n.mode.ins .. "' '"
v.Nml.n.ins.space       = v.Nml.n.mode.ins .. ' '
v.Nml.n.ins.hyphen      = v.Nml.n.mode.ins .. '-'
v.Nml.n.ins.slash       = v.Nml.n.mode.ins .. '/'
v.Nml.n.ins.slash_back  = v.Nml.n.mode.ins .. [[\]]
v.Nml.n.ins.childer     = v.Nml.n.mode.ins .. '~'
v.Nml.n.ins.cr          = v.Nml.n.mode.ins .. '<cr>'

