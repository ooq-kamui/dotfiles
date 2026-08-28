function eng-tutor --description "Check English spelling/grammar using Gemini API"

    if test (count $argv) -eq 0
        echo "Usage: e-chk <word or sentence>"
        return 1
    end

    set -l input (string join " " $argv)

    # Require GEMINI_API_KEY
    if not set -q GEMINI_API_KEY; or test -z "$GEMINI_API_KEY"
        echo "Error: GEMINI_API_KEY is not set"
        return 1
    end

    set -l url "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=$GEMINI_API_KEY"

    # Use python3 to build JSON body and parse response (avoids shell escaping issues)
    set -l response (printf '%s' "$input" | python3 -c "
import sys, json

user_input = sys.stdin.read()

prompt = f'''You are an English language assistant. The user will give you text.

Rules:
- If the input is in Japanese, translate it into natural English. Provide the English translation, and if there are multiple natural ways to say it, briefly show alternatives.
- If the input is English and a single word, check the spelling. If correct, say so briefly, then show the word's meaning (if it has multiple meanings, list a few representative ones). If incorrect, list the likely intended correct word(s) — show several candidates if more than one is plausible — with their meanings.
- If the input is English and a short sentence or phrase, check whether it sounds natural. Point out any grammatical errors, awkward phrasing, or unnatural expressions, and suggest improvements.
- Keep your response concise and direct.
- Do not repeat the input unnecessarily.
- Include a Japanese translation of your explanation on the next line.

Input: {user_input}'''

body = json.dumps({'contents': [{'parts': [{'text': prompt}]}]})
print(body)
" 2>&1)

    if test $status -ne 0
        echo "Failed to build request body"
        echo "$response"
        return 1
    end

    set -l body "$response"

    set -l api_response (curl -s -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "$body")

    # Extract text from response
    set -l text (printf '%s' "$api_response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    print(data['candidates'][0]['content']['parts'][0]['text'])
except (KeyError, IndexError, TypeError) as e:
    # Show the raw response for debugging
    print(f'Error parsing response: {e}', file=sys.stderr)
    print(data if 'data' in dir() else 'No data', file=sys.stderr)
    sys.exit(1)
except json.JSONDecodeError as e:
    print(f'Invalid JSON response: {e}', file=sys.stderr)
    sys.exit(1)
" 2>&1)

    if test $status -ne 0
        echo "Failed to parse Gemini response:"
        printf '%s\n' $text
        return 1
    end

    printf '%s\n' $text
end

