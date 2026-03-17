
-- ai

v.Ai = {}

function v.Ai.ask_by_slctd()

  local ai_chat_cmd = 'KIRO_LOG_NO_COLOR=1 kiro-cli chat --resume --no-interactive'
  local sys_cmd = 'echo "hello" | ' .. ai_chat_cmd
  local rslt = v.Sys.cmd(sys_cmd)
  v.Log.val(rslt)
end

