#!/bin/zsh

for f in *.eml; do
  python3 parse.py < $f \
    | xmllint --html --xpath "//a[contains(@href, '3.basecamp.com') and @class='decorated']" -\
    | gsed 's/.*href="\([^"]*\)"[^>]*>\([^<]*\)<.*/\2 \1/'
done | gsed -e 's/#.*//' -e 's/\\x[0-9a-f][0-9a-f]//g' -e 's/^ *//' | sort -u > topics
