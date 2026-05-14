import email
import sys
import quopri

msg = email.message_from_string(sys.stdin.read())

for part in msg.get_payload():
    if part.get_content_type() == 'text/html':
        decoded = quopri.decodestring(part.get_payload())
        print(decoded)

