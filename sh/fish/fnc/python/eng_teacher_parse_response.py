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
