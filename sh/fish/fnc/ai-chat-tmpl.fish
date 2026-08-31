function ai-chat-tmpl

  set -l ai_command kiro-cli

  if test (count $argv) -eq 0
      echo "ユーザーエラー: 翻訳したい英文を入力してください。"
      echo "使い方: trans This is a pen."
      return 1
  end

  set -l english_text ( string join " " $argv )

  set -l prompt "あなたはプロの翻訳家です。
以下の指示に従って、渡された英文を翻訳してください。

【指示】
1. 自然で日常的に使われる日本語に翻訳すること。
2. 前置き（「はい、翻訳しました」など）や解説は一切含めないこと。
3. 翻訳結果の文章だけを出力すること。

【翻訳対象】
$english_text"

  $ai_command chat --resume --no-interactive $prompt 
end

