
v.Mcr = {}

function v.Mcr.rec() -- stop : same key ( call re )

  if vf.reg_recording() == '' then
    return 'qa'
  else
    return 'q'
  end
end

function v.Mcr.ply()

  if vf.reg_recording() == '' then
    return '1@a'
  else
    return 'q'
  end
end

