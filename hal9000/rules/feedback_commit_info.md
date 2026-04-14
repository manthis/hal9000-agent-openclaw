---
name: Toujours donner le hash et message de commit après un push
description: Après chaque commit+push git, communiquer le hash court et le message du commit à l'utilisateur
type: feedback
originSessionId: 1a7d7b1e-1d54-4ebd-be3a-b3802128c082
---
Après chaque `git commit` + `git push`, toujours communiquer à Max :
- Le hash court du commit (ex: `d4fefff`)
- Le message du commit

**Why:** Max veut pouvoir tracer et référencer ses commits facilement sans avoir à aller vérifier lui-même sur GitHub.

**How to apply:** Systématiquement après tout commit+push, inclure une ligne du type : "Commit : `d4fefff` — \"message du commit\""
