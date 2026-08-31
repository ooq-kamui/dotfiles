function ai-chat

  set -l ai_command kiro-cli

  $ai_command chat --resume --no-interactive ( string join " " $argv )
end

