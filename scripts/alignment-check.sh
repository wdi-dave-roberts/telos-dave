#!/usr/bin/env bash
# alignment-check.sh — Check a decision against personal telos
#
# Usage: ./alignment-check.sh <decision-file-or-text>
#
# Can pass a file path OR pipe text directly:
#   echo "I'm thinking about skipping breakfast service to finish this build" | ./alignment-check.sh -
#   ./alignment-check.sh captures/2026-02-01-decision.md
#
# Uses wdi_telos_alignment_check against your personal telos

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TELOS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <decision-file>"
  echo "   or: echo 'decision text' | $0 -"
  echo ""
  echo "Checks a decision against your personal telos for alignment."
  exit 1
fi

# Read decision input
if [[ "$INPUT" == "-" ]]; then
  DECISION=$(cat)
elif [[ -f "$INPUT" ]]; then
  DECISION=$(cat "$INPUT")
else
  # Treat as inline text
  DECISION="$INPUT"
fi

# Build telos context
TELOS_CONTEXT=""
for f in MISSION.md BELIEFS.md VALUES.md GOALS.md STRATEGIES.md LEARNED.md CHALLENGES.md; do
  FILE="$TELOS_DIR/$f"
  if [[ -f "$FILE" ]] && [[ $(wc -c < "$FILE") -gt 100 ]]; then
    TELOS_CONTEXT="${TELOS_CONTEXT}\n\n--- ${f} ---\n\n$(cat "$FILE")"
  fi
done

echo -e "PERSONAL TELOS:${TELOS_CONTEXT}\n\n---\n\nDECISION TO EVALUATE:\n\n${DECISION}" | \
  fabric -p wdi_telos_alignment_check
