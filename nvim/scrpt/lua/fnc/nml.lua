
v.Nml = {}

function v.Nml.exe(nml_cmd) -- alias
  -- v.Log.log(nml_cmd)
  nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
  -- v.Log.log(nml_cmd)
  v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
end

function v.Nml.exe_x_time(nml_cmd, time) -- alias

  time = time or 1

  for idx = 1, time do
    v.Nml.exe(nml_cmd)
  end
end

function v.Nml.ins(str)
  -- v.Log.log(str)
  str = v.Str.escape(str, [[\"]])
  v.Cmd.cmd('exe "normal! ' .. 'i' .. str .. '"')
end

-- 
-- normal
-- 

v.Nml.n = {}

v.Nml.n.key = {}
v.Nml.n.key.esc  = '<esc>'
v.Nml.n.key.bs   = '<bs>'
v.Nml.n.key.pipe = '|'

-- 
-- cursor
-- 

v.Nml.n.cursor = {}

v.Nml.n.cursor.mv = {}
v.Nml.n.cursor.mv.d_mlt = '<c-e>'
v.Nml.n.cursor.mv.u_mlt = '<c-y>'

v.Nml.n.cursor.mv.d     = 'j'
v.Nml.n.cursor.mv.u     = 'k'
v.Nml.n.cursor.mv.b     = 'h'
v.Nml.n.cursor.mv.l     = 'h'
v.Nml.n.cursor.mv.f     = 'l'
v.Nml.n.cursor.mv.r     = 'l'

v.Nml.n.cursor.mv.line_end = '$'

v.Nml.n.cursor.mv.b_word_s = 'b'
v.Nml.n.cursor.mv.b_word_e = 'ge'

v.Nml.n.cursor.mv.f_word_s = 'w'
v.Nml.n.cursor.mv.f_word_e = 'e'
v.Nml.n.cursor.mv.f_space_not_s = 'W'
v.Nml.n.cursor.mv.f_space_not_e = 'E'
v.Nml.n.cursor.mv.f_space_e = v.Nml.n.cursor.mv.f_word_s .. v.Nml.n.cursor.mv.b -- 'wh'

v.Nml.n.cursor.mv.line_end = '$'

v.Nml.n.cursor.mv.file_top = 'gg'
v.Nml.n.cursor.mv.file_end = 'G'

-- 
-- win
-- 

v.Nml.n.win = {}
v.Nml.n.win.splt = {}
v.Nml.n.win.splt.quit      = '<c-w>c>'
v.Nml.n.win.splt.quit_othr = '<c-w>o>'
v.Nml.n.win.splt.nxt       = '<c-w>w>'

-- v.Nml.n.dmy = 'Jj'

-- v.Nml.n.dmy = '[m'
-- v.Nml.n.dmy = '[{'
-- v.Nml.n.dmy = '`[v`]h'
-- v.Nml.n.dmy = 'a <bs><esc>'

-- 
-- srch
-- 

v.Nml.n.srch = {}
v.Nml.n.srch.exe = '/'
v.Nml.n.srch.nxt_f = 'n'
v.Nml.n.srch.nxt_b = 'N'

-- srch slct

v.Nml.n.srch.nxt_f_slct = 'g' .. 'n'
v.Nml.n.srch.nxt_b_slct = 'g' .. 'N'


-- 
-- rgstr
-- 

v.Nml.n.rgstr = {}
v.Nml.n.rgstr.key = {}

v.Nml.n.rgstr.key.rgstr = '"'

v.Nml.n.rgstr.key.main    = 'a'
v.Nml.n.rgstr.key.nul     = 'z'
v.Nml.n.rgstr.key.nul2    = '_'
v.Nml.n.rgstr.key.name_no = '"'

v.Nml.n.rgstr.main    = v.Nml.n.rgstr.key.rgstr .. v.Nml.n.rgstr.key.main    -- "a
v.Nml.n.rgstr.nul     = v.Nml.n.rgstr.key.rgstr .. v.Nml.n.rgstr.key.nul     -- "z
v.Nml.n.rgstr.nul2    = v.Nml.n.rgstr.key.rgstr .. v.Nml.n.rgstr.key.nul2    -- "_
v.Nml.n.rgstr.name_no = v.Nml.n.rgstr.key.rgstr .. v.Nml.n.rgstr.key.name_no -- ""

v.Nml.n.rgstr.key.main_add = 'A'

v.Nml.n.rgstr.main_add = v.Nml.n.rgstr.key.rgstr .. v.Nml.n.rgstr.key.main_add -- "A

-- 
-- edit
-- 

-- edit base

v.Nml.n.edit = {}

v.Nml.n.edit.ynk = 'y'
v.Nml.n.edit.del = 'd'

v.Nml.n.edit.char = {}
v.Nml.n.edit.char.del = 'x'
v.Nml.n.edit.char.rpl = 'r'
v.Nml.n.edit.char.case_tgl = 'v~'

v.Nml.n.edit.line = {}
v.Nml.n.edit.line.ynk = 'yy'
v.Nml.n.edit.line.del = 'dd'

v.Nml.n.edit.paste = {}
v.Nml.n.edit.paste.pre = 'P'

-- 

v.Nml.n.edit.xx = v.Nml.n.rgstr.main .. v.Nml.n.edit.del       -- "ad
v.Nml.n.edit.xx = v.Nml.n.rgstr.main .. v.Nml.n.edit.char.del  -- "ax
v.Nml.n.edit.xx = v.Nml.n.rgstr.main .. v.Nml.n.edit.line.ynk  -- "ayy
v.Nml.n.edit.xx = v.Nml.n.rgstr.main .. v.Nml.n.edit.line.del  -- "add

v.Nml.n.edit.xx = v.Nml.n.rgstr.main .. v.Nml.n.edit.paste.pre -- "aP

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.ynk       -- "zy
v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.del       -- "zd

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.line.ynk  -- "zyy

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.char.del  -- "zx

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.paste.pre -- "zP

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul  .. v.Nml.n.edit.line.ynk  -- "zyy
               .. v.Nml.n.rgstr.nul  .. v.Nml.n.edit.paste.pre -- "zP

v.Nml.n.edit.xx = v.Nml.n.rgstr.nul2 .. v.Nml.n.edit.line.del  -- "_dd

v.Nml.n.edit.xx = v.Nml.n.rgstr.name_no .. v.Nml.n.edit.paste.pre  -- ""P

v.Nml.n.edit.line.shft_l = '<<'

v.Nml.n.edit.line.f_str = {}
v.Nml.n.edit.line.f_str.del = 'D'

v.Nml.n.edit.word = {}
v.Nml.n.edit.word.icl = '<c-a>'
v.Nml.n.edit.word.dcl = '<c-x>'


-- 
-- mode
-- 

v.Nml.n.mode = {}
v.Nml.n.mode.v_str  = 'v'
v.Nml.n.mode.v_line = 'V'
v.Nml.n.mode.v_box  = '<c-v>'

v.Nml.n.mode.ins  = 'i'
v.Nml.n.mode.ins_line_pre = 'O'
v.Nml.n.mode.ins_line_flw = 'o'

v.Nml.x = {}
v.Nml.x.mode = {}
v.Nml.x.mode.v_line = 'V'
v.Nml.x.mode.v_box  = '<c-v>'

-- 
-- slct
-- 

v.Nml.n.slct = {}
v.Nml.n.slct.re   = 'gv'
v.Nml.n.slct.word = 'viw'

-- 
-- slctd
-- 

v.Nml.x.slctd = {}

-- v.Nml.n.dmy = 'ggVG'
-- v.Nml.n.dmy = 'gv"Ay'
-- v.Nml.n.dmy = 'gvj'

v.Nml.x.cursor = {}
v.Nml.x.cursor.mv = {}

v.Nml.x.cursor.mv.edge_tgl = 'o'
v.Nml.x.cursor.mv.f_word_e = 'e'


v.Nml.x.edit = {}

v.Nml.x.edit.ynk      = 'y'

v.Nml.x.edit.fil_char = 'r'
v.Nml.x.edit.box_ins  = 'I'

v.Nml.x.edit.line = {}
v.Nml.x.edit.line.shft_l = '<'
v.Nml.x.edit.line.shft_r = '>'


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

