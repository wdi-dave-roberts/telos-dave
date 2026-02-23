#!/usr/bin/env bash
# generate-prompt.sh — Generate weekly journal prompt from telos gaps
#
# Usage: ./generate-prompt.sh
#
# Reads all populated telos files and generates targeted questions
# based on what's thin, stale, or unresolved.
#
# Output: prints to stdout (pipe to file or send via agent)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TELOS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Concatenate all populated telos files
TELOS_CONTENT=""
for f in MISSION.md BELIEFS.md VALUES.md GOALS.md STRATEGIES.md LEARNED.md \
         TRAUMAS.md CHALLENGES.md NARRATIVES.md WRONG.md MODELS.md; do
  FILE="$TELOS_DIR/$f"
  if [[ -f "$FILE" ]] && [[ $(wc -c < "$FILE") -gt 100 ]]; then
    TELOS_CONTENT="${TELOS_CONTENT}\n\n--- ${f} ---\n\n$(cat "$FILE")"
  fi
done

# Add recent journal entries if they exist
RECENT_JOURNALS=""
if [[ -d "$TELOS_DIR/journal" ]]; then
  for f in $(ls -t "$TELOS_DIR/journal/"*.md 2>/dev/null | head -3); do
    RECENT_JOURNALS="${RECENT_JOURNALS}\n\n--- RECENT JOURNAL: $(basename "$f") ---\n\n$(cat "$f")"
  done
fi

# Add recent captures if they exist
RECENT_CAPTURES=""
if [[ -d "$TELOS_DIR/captures" ]]; then
  for f in $(ls -t "$TELOS_DIR/captures/"*.md 2>/dev/null | head -3); do
    RECENT_CAPTURES="${RECENT_CAPTURES}\n\n--- RECENT CAPTURE: $(basename "$f") ---\n\n$(cat "$f")"
  done
fi

echo -e "${TELOS_CONTENT}${RECENT_JOURNALS}${RECENT_CAPTURES}" | \
  fabric-ai -p personal_telos_journal_prompt
