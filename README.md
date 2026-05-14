# Basecamp Email Parser

Extracts active Basecamp topic links from daily activity emails so you can quickly catch up on what's been happening.

## How it works

Basecamp sends daily activity digest emails containing links to active topics. This tool:

1. Parses `.eml` email files to extract the HTML body
2. Finds all Basecamp topic links (`3.basecamp.com` URLs with class `decorated`)
3. Outputs a sorted, deduplicated list of `Topic Name URL` pairs to a file called `topics`

## Requirements

- Python 3
- `xmllint` (from libxml2)
- `gsed` (GNU sed — on macOS: `brew install gnu-sed`)

## Usage

1. Export your Basecamp daily activity emails in `.eml` format and save them to this directory
2. Run:

```sh
./generate_topics.sh
```

3. Open the `topics` file — each line is a topic name followed by its URL:

```
Budget discussion https://3.basecamp.com/...
Design review https://3.basecamp.com/...
```

## Files

- `generate_topics.sh` — main script; processes all `.eml` files and writes `topics`
- `parse.py` — decodes the quoted-printable HTML body from an `.eml` file
- `.gitignore` — excludes `.eml` files and the `basecamp-topics` output from version control
