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
