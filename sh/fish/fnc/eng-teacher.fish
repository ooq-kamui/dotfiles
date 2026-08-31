function eng-teacher --description "Check English spelling/grammar using Gemini API"

    if test (count $argv) -eq 0
        echo "Usage: eng-teacher <word or sentence>"
        return 1
    end

    set -l input (string join " " $argv)

    # Require GEMINI_API_KEY
    if not set -q GEMINI_API_KEY; or test -z "$GEMINI_API_KEY"
        echo "Error: GEMINI_API_KEY is not set"
        return 1
    end

    set -x https_proxy $GGL_API_PROXY
    set -x http_proxy  $GGL_API_PROXY

    set -l url "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=$GEMINI_API_KEY"

    set -l py_dir (status dirname)/python

    # Use python3 to build JSON body and parse response (avoids shell escaping issues)
    set -l response (printf '%s' "$input" | python3 "$py_dir/eng_teacher_build_body.py" 2>&1)

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
    set -l text (printf '%s' "$api_response" | python3 "$py_dir/eng_teacher_parse_response.py" 2>&1)

    if test $status -ne 0
        echo "Failed to parse Gemini response:"
        printf '%s\n' $text
        return 1
    end

    printf '%s\n' $text
end

