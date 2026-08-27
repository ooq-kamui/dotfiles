function e-chk --description "Check English spelling, usage, and grammar"

    if test (count $argv) -eq 0
        echo "Usage: e-chk \"English word, phrase, or sentence to check\""
        return 1
    end

    set -l text (string join " " $argv)

    set -l prompt "以下の英語の入力をチェックしてください.

入力が単語の場合:
- 綴りが正しいか確認し, 間違っていれば正しい綴りを示す
- その単語が実在するか確認する
- 簡潔に意味を示す (日本語で)

入力が短いフレーズの場合:
- 各単語の綴りが正しいか確認する
- そのフレーズが英語として自然かどうか判定する
- 不自然なら自然な表現を提案する

入力が文の場合:
- 綴り・文法・自然さをチェックする
- 問題があれば簡潔に説明し修正案を提示する

問題がなければ OK と答え, 単語の場合は意味も添えてください.
回答は日本語で簡潔にお願いします.

入力: \"$text\""

    echo $prompt | kiro-cli chat 2>/dev/null | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' | sed -n '/^>/,/^$/p' | sed 's/^> //'
end

