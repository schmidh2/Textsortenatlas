#!/usr/bin/env bash
# Übernimmt inhaltliche Änderungen aus main (Teams-Version) in die Homepage-Variante
# und veröffentlicht sie unter https://schmidh2.github.io/Textsortenatlas-Homepage/
set -euo pipefail

SITE_REMOTE="homepage-site"
SITE_URL="https://github.com/schmidh2/Textsortenatlas-Homepage.git"

cd "$(dirname "$0")"

if [ "$(git branch --show-current)" != "homepage" ]; then
  echo "Bitte im Zweig 'homepage' ausführen." >&2; exit 1
fi
if [ -n "$(git status --porcelain)" ]; then
  echo "Es gibt nicht committete Änderungen. Bitte zuerst committen." >&2; exit 1
fi

git remote get-url "$SITE_REMOTE" >/dev/null 2>&1 || git remote add "$SITE_REMOTE" "$SITE_URL"

git fetch origin
new=$(git rev-list --count HEAD..origin/main)
if [ "$new" -gt 0 ]; then
  echo "$new neue Änderung(en) aus main werden übernommen ..."
  if ! git merge --no-edit origin/main; then
    git merge --abort
    echo "Konflikt beim Zusammenführen. Nichts wurde verändert oder veröffentlicht." >&2
    echo "Bitte Claude bitten, den Konflikt zu lösen." >&2
    exit 1
  fi
else
  echo "Keine neuen Änderungen in main."
fi

git push origin homepage
git push "$SITE_REMOTE" homepage:main
echo "Fertig. Die Seite ist in etwa einer Minute aktualisiert."
