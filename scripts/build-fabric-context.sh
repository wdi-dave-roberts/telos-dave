#!/bin/bash
# Concatenate all populated telos files into a single Fabric context.
# Run after updating any telos file, or add to your processing rhythm.

TELOS_DIR="$HOME/github/wdi-dave/telos-dave"
CONTEXT_FILE="$HOME/.config/fabric/contexts/telos.md"

# Core identity files (order matters — most fundamental first)
FILES=(
  "MISSION.md"
  "BELIEFS.md"
  "BACKGROUND.md"
  "PERSONALITY.md"
  "CHALLENGES.md"
  "LEARNED.md"
  "TRAUMAS.md"
)

> "$CONTEXT_FILE"

for f in "${FILES[@]}"; do
  if [ -f "$TELOS_DIR/$f" ]; then
    cat "$TELOS_DIR/$f" >> "$CONTEXT_FILE"
    echo -e "\n---\n" >> "$CONTEXT_FILE"
  fi
done

echo "Built Fabric context: $(wc -l < "$CONTEXT_FILE") lines from ${#FILES[@]} files"
