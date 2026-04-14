#!/bin/zsh
set -euo pipefail

LOG="$HOME/.openclaw/logs/brew.log"
REPORT="$HOME/.openclaw/logs/brew-last-cleanup.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] [CLEANUP] Démarrage" >> "$LOG"

CLEANUP_OUTPUT=$(brew cleanup 2>&1)
EXIT_CODE=$?

echo "$CLEANUP_OUTPUT" >> "$LOG"

{
  echo "TIMESTAMP=$TIMESTAMP"
  echo "STATUS=$([ $EXIT_CODE -eq 0 ] && echo SUCCESS || echo ERROR)"
  echo "---"
  echo "$CLEANUP_OUTPUT" | grep -E "^(Removing|Pruning)" || echo "Rien à nettoyer"
} > "$REPORT"

if [ $EXIT_CODE -eq 0 ]; then
  echo "[$TIMESTAMP] [CLEANUP] Succès" >> "$LOG"
  osascript -e 'display notification "brew cleanup terminé avec succès" with title "HAL9000 · Brew" subtitle "Nettoyage hebdomadaire"'
else
  echo "[$TIMESTAMP] [CLEANUP] ERREUR" >> "$LOG"
  osascript -e 'display notification "Erreur lors du brew cleanup — vérifier ~/.openclaw/logs/brew.log" with title "HAL9000 · Brew ⚠️" subtitle "Nettoyage hebdomadaire"'
fi
