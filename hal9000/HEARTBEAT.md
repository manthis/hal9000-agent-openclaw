# HEARTBEAT.md

## Checks périodiques

### Brew log
- Lire `~/.openclaw/logs/brew.log`
- Chercher `ERREUR` depuis le dernier heartbeat
- Si erreur: alerter M immédiatement
- Sinon: `HEARTBEAT_OK` sans mentionner brew

### Crons de rapport brew
- Vérifier l'existence de:
  - `2738713c-9a3b-4240-b7ac-c8875e187a9c` (`homebrew-nightly-update`, 00:00 Europe/Paris)
  - `1357238c-224e-495c-aeb1-09afda7acfd3` (`homebrew-weekly-cleanup`, lundi 00:15 Europe/Paris)
- Si absent: recréer avec le même prompt, en s'aidant de `scripts/homebrew-*.sh`
