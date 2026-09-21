# Textsortenatlas – Projektnotizen (Übergabe)

Nachschlagewerk zu den 7 Matura-Textsorten in Österreich (Deutsch, SRDP). Eine einzige, in sich geschlossene Datei: `index.html` (HTML + CSS + JS, keine Build-Schritte, nur Google Fonts extern).

## Zweck dieses Zweigs (`homepage`)
Variante für die Einbindung in eine Homepage (statt Teams-Tab). Der Zweig `main` bleibt unverändert der Stand für Teams/GitHub Pages. Hier frei umbauen (z. B. Iframe-Einbindung, Header/Footer anpassen, Navigation, Zoom-Buttons entfernen).

## Stand und Veröffentlichung
- Repo: `schmidh2/Textsortenatlas`, live über GitHub Pages aus `main`: https://schmidh2.github.io/Textsortenatlas/
- GitHub-CLI (`gh`) ist auf diesem Mac angemeldet, `git push` funktioniert. Pushes auf `homepage` verändern die Live-Seite nicht.
- Beim Testen der Live-Seite Cache umgehen (`?v=2` an die URL), sonst sieht man oft alte Stände.
- Die Datei lässt sich lokal per `python3 -m http.server` testen.

## Aufbau von index.html
Datenobjekte im `<script>`: `OPERATOREN`/`NIVEAUS`, `KRITERIEN`, `VERGLEICH` (Vergleichsmatrix), `WORDBANK` u. a. (Sprachbaukasten), `STILMITTEL`/`QUIZ`/`ANALYSE`/`TEXTTRAINING` (Stilmittel und fünf Übungsformen), `TEXTSORTEN` (die 7 Karten), `TRAINING`/`QUELLEN` (Übungsaufträge, Musterlösungen mit Randnotizen, Selbstcheck, Quellenlinks). Die Seite wird per JS aus diesen Daten gerendert. Design: Tokens als CSS-Variablen (hell/dunkel), Schriften Fraunces, Public Sans, IBM Plex Mono, Caveat.

## Wichtige Erkenntnisse (nicht noch einmal einbauen)
- Kein `overflow-x:hidden` auf html/body (schneidet Inhalt ab). Raster mit `minmax(0,1fr)` bzw. `minmax(min(Xpx,100%),1fr)` bauen. `overflow-wrap:anywhere` nur auf `main`, nicht auf den Header (zerbricht das Logo).
- In Teams-Tabs (Iframe) wird die Breite manchmal erst nach einem Fenster-Resize korrekt gesetzt und Pinch-Zoom ist blockiert. Deshalb gibt es eigene Zoom-Buttons (`#zoomwrap` + `.zoom-controls`). Für eine Homepage-Einbindung eventuell entfernen.
- claude.ai-Artifacts lassen sich nicht in fremde Iframes einbetten (`X-Frame-Options: SAMEORIGIN`), GitHub Pages schon.

## Inhaltliche Regeln
- Keine Links auf Seiten, die Bücher oder Texte zu Textsorten verkaufen (Verlage, Shops, Amazon-Partnerlinks). Erlaubt: amtliche Quellen (matura.gv.at, bmb.gv.at) und nichtkommerzielle Seiten wie deutsche-grammatik.net.
- Angaben zu Umfang und Bewertungskriterien folgen dem amtlichen Textsortenkatalog (matura.gv.at). Klausur: eines von 3 Aufgabenpaketen, 2 Texte, 300 Minuten.
- Modelltexte sind eigene, erfundene Beispiele (Ausnahme: Eichendorff „Mondnacht“, gemeinfrei). Leserbrief und Kommentar haben Prüfungsumfang, die anderen fünf sind gekürzt und so gekennzeichnet.
- Umlaute in Dateinamen/URLs beachten (deutsche-grammatik.net nutzt `erörterung`, `übungen`).

## Zusätzlich
Es gibt eine Artifact-Kopie in claude.ai (nur Ansicht, nicht das Original): https://claude.ai/artifact/NqFxpprohFaaJddQSM5HR2

## Homepage-Variante veröffentlichen und mit main abgleichen
- Eigene Webadresse: https://schmidh2.github.io/Textsortenatlas-Homepage/ (Repo `schmidh2/Textsortenatlas-Homepage`, Remote `homepage-site`, Pages aus dessen `main`).
- Inhaltliche Änderungen kommen auf `main` (Teams-Version) und werden mit `./sync-homepage.sh` in `homepage` übernommen und veröffentlicht. Bei Konflikten bricht das Skript ab, ohne etwas zu verändern.
- Design (CSS, Kopfzeile) nur auf `homepage` ändern, Inhalte (Datenobjekte im Skript) nur auf `main`, dann gibt es kaum Konflikte.
