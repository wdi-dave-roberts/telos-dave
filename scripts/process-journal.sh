#!/usr/bin/env bash
# process-journal.sh — Run a journal entry through the Fabric telos pipeline
#
# Usage: ./process-journal.sh <journal-file>
#
# Pipeline:
#   1. personal_telos_excavation → what's beneath the words
#   2. wdi_expand_telos_from_anecdote → map to telos files
#   3. t_find_blindspots → what's not being seen
#
# Output saved to findings/ with timestamp

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TELOS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FINDINGS_DIR="$TELOS_DIR/findings"

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <journal-file>"
  echo ""
  echo "Runs journal entry through Fabric telos analysis pipeline."
  echo "Output saved to findings/"
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "ERROR: File not found: $INPUT"
  exit 1
fi

DATE=$(date +%Y-%m-%d)
BASENAME=$(basename "$INPUT" .md)
OUTPUT_PREFIX="$FINDINGS_DIR/${DATE}-${BASENAME}"

echo "Processing: $INPUT"
echo "Output prefix: $OUTPUT_PREFIX"
echo ""

# Step 1: Excavation — what's beneath the words
echo "Step 1/3: Excavation..."
cat "$INPUT" | fabric -p personal_telos_excavation > "${OUTPUT_PREFIX}-excavation.md" 2>/dev/null
echo "  ✅ ${OUTPUT_PREFIX}-excavation.md"

# Step 2: Anecdote expansion — map to telos files
echo "Step 2/3: Telos mapping..."
cat "$INPUT" | fabric -p wdi_expand_telos_from_anecdote > "${OUTPUT_PREFIX}-telos-map.md" 2>/dev/null
echo "  ✅ ${OUTPUT_PREFIX}-telos-map.md"

# Step 3: Blindspots — what's not being seen
echo "Step 3/3: Blindspot analysis..."
CONTEXT=$(cat "$TELOS_DIR"/MISSION.md "$TELOS_DIR"/BELIEFS.md "$TELOS_DIR"/TRAUMAS.md "$TELOS_DIR"/LEARNED.md 2>/dev/null)
echo -e "${CONTEXT}\n\n---\n\nNEW JOURNAL ENTRY:\n\n$(cat "$INPUT")" | fabric -p t_find_blindspots > "${OUTPUT_PREFIX}-blindspots.md" 2>/dev/null
echo "  ✅ ${OUTPUT_PREFIX}-blindspots.md"

echo ""
echo "Done. Review findings at:"
echo "  ${OUTPUT_PREFIX}-excavation.md"
echo "  ${OUTPUT_PREFIX}-telos-map.md"
echo "  ${OUTPUT_PREFIX}-blindspots.md"
