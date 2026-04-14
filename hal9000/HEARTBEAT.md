# HEARTBEAT.md

## Checks périodiques

### Brew log
- Fichier : `~/.openclaw/logs/brew.log`
- Chercher les lignes contenant `ERREUR` depuis le dernier heartbeat
- Si erreur trouvée → alerter Max immédiatement
- Si tout est OK → HEARTBEAT_OK (pas besoin de mentionner brew)

### Crons de rapport brew
- Cron update report : `2738713c-9a3b-4240-b7ac-c8875e187a9c` (`homebrew-nightly-update`, 0h00 Europe/Paris chaque nuit)
- Cron cleanup report : `1357238c-224e-495c-aeb1-09afda7acfd3` (`homebrew-weekly-cleanup`, 0h15 le lundi Europe/Paris)
- Si absents → les recréer avec le même prompt (voir scripts/homebrew-*.sh pour le contexte)
