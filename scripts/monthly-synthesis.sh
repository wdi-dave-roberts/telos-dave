#!/usr/bin/env bash
# monthly-synthesis.sh — Synthesize a month of captures/journals into narrative
#
# Usage: ./monthly-synthesis.sh [YYYY-MM]
#
# Default: previous month
# Reads: journal/, captures/, findings/ for the target month
# Output: synthesis/YYYY-MM-narrative.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TELOS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SYNTHESIS_DIR="$TELOS_DIR/synthesis"

# Default to previous month
if [[ -n "${1:-}" ]]; then
  TARGET_MONTH="$1"
else
  TARGET_MONTH=$(date -d "last month" +%Y-%m 2>/dev/null || date -v-1m +%Y-%m 2>/dev/null)
fi

echo "Synthesizing month: $TARGET_MONTH"
echo ""

# Collect all content from the target month
MONTH_CONTENT=""

# Journal entries
for f in "$TELOS_DIR/journal/${TARGET_MONTH}"*.md 2>/dev/null; do
  [[ -f "$f" ]] || continue
  MONTH_CONTENT="${MONTH_CONTENT}\n\n--- JOURNAL: $(basename "$f") ---\n\n$(cat "$f")"
done

# Captures
for f in "$TELOS_DIR/captures/${TARGET_MONTH}"*.md 2>/dev/null; do
  [[ -f "$f" ]] || continue
  MONTH_CONTENT="${MONTH_CONTENT}\n\n--- CAPTURE: $(basename "$f") ---\n\n$(cat "$f")"
done

# Findings (analysis outputs)
for f in "$TELOS_DIR/findings/${TARGET_MONTH}"*.md 2>/dev/null; do
  [[ -f "$f" ]] || continue
  MONTH_CONTENT="${MONTH_CONTENT}\n\n--- FINDING: $(basename "$f") ---\n\n$(cat "$f")"
done

if [[ -z "$MONTH_CONTENT" ]]; then
  echo "No content found for $TARGET_MONTH."
  echo "Write some journal entries or captures first!"
  exit 0
fi

# Add telos context for reference
TELOS_CONTEXT=""
for f in MISSION.md BELIEFS.md LEARNED.md; do
  FILE="$TELOS_DIR/$f"
  if [[ -f "$FILE" ]]; then
    TELOS_CONTEXT="${TELOS_CONTEXT}\n\n--- TELOS: ${f} ---\n\n$(cat "$FILE")"
  fi
done

OUTPUT="$SYNTHESIS_DIR/${TARGET_MONTH}-narrative.md"

echo -e "CURRENT TELOS CONTEXT:${TELOS_CONTEXT}\n\n---\n\nTHIS MONTH'S CONTENT:${MONTH_CONTENT}" | \
  fabric-ai -p personal_telos_monthly_narrative > "$OUTPUT"

echo "✅ Narrative saved to: $OUTPUT"
echo ""
echo "Review it. React to it. That reaction is data too."
