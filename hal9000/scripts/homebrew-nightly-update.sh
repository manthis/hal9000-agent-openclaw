#!/bin/zsh
set -uo pipefail

LOG="$HOME/.openclaw/logs/brew.log"
REPORT="$HOME/.openclaw/logs/brew-last-update.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
TMP_OUTPUT=$(mktemp)
EXIT_CODE=0

mkdir -p "$HOME/.openclaw/logs"

echo "[$TIMESTAMP] [UPDATE] Démarrage" >> "$LOG"

{
  brew update
  brew upgrade
} >"$TMP_OUTPUT" 2>&1 || EXIT_CODE=$?

UPGRADE_OUTPUT=$(cat "$TMP_OUTPUT")
rm -f "$TMP_OUTPUT"

echo "$UPGRADE_OUTPUT" >> "$LOG"

{
  echo "TIMESTAMP=$TIMESTAMP"
  echo "STATUS=$([ $EXIT_CODE -eq 0 ] && echo SUCCESS || echo ERROR)"
  echo "EXIT_CODE=$EXIT_CODE"
  echo "---"
  echo "$UPGRADE_OUTPUT" | grep -E "^(==> Upgrading|Upgrading |Already up-to-date|Error:|Warning:)" || echo "Aucun détail exploitable"
} > "$REPORT"

if [ $EXIT_CODE -eq 0 ]; then
  echo "[$TIMESTAMP] [UPDATE] Succès" >> "$LOG"
  osascript -e 'display notification "brew update && upgrade terminé avec succès" with title "HAL9000 · Brew" subtitle "Mise à jour nocturne"'
else
  echo "[$TIMESTAMP] [UPDATE] ERREUR (code $EXIT_CODE)" >> "$LOG"
  osascript -e 'display notification "Erreur lors du brew upgrade — vérifier ~/.openclaw/logs/brew.log" with title "HAL9000 · Brew ⚠️" subtitle "Mise à jour nocturne"'
fi

exit 0
