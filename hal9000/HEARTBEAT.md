# HEARTBEAT.md

## Checks périodiques

### Brew log
- Fichier : `~/.openclaw/logs/brew.log`
- Chercher les lignes contenant `ERREUR` depuis le dernier heartbeat
- Si erreur trouvée → alerter Max immédiatement
- Si tout est OK → HEARTBEAT_OK (pas besoin de mentionner brew)

### Crons de rapport brew (expire après 7 jours)
- Cron update report : `b3395419` (00h15 chaque nuit)
- Cron cleanup report : `33191e3f` (02h15 le dimanche)
- Si expirés → les recréer avec le même prompt (voir scripts/homebrew-*.sh pour le contexte)
