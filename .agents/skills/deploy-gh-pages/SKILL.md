---
name: deploy-gh-pages
description: Automatyczny deployment prezentacji HTML lub statycznych stron internetowych na GitHub Pages przy użyciu GitHub CLI (gh). Używaj tego skilla za każdym razem, gdy użytkownik prosi o opublikowanie prezentacji lub strony w internecie, stworzenie repozytorium GitHub, wdrożenie na GitHub Pages lub wygenerowanie publicznego linku przez gh CLI.
---

# Deployment na GitHub Pages przez GitHub CLI (`gh`)

Ten skill umożliwia agentowi automatyczne utworzenie zdalnego repozytorium na GitHubie, przygotowanie plików prezentacji, zainicjalizowanie Gita oraz włączenie i skonfigurowanie usługi **GitHub Pages** za pomocą oficjalnego narzędzia **GitHub CLI (`gh`)**.

---

## 1. Kiedy Używać Tego Skilla

Aktywuj ten skill, gdy:
* Użytkownik chce udostępnić swoją wygenerowaną prezentację HTML w internecie (np. dla klienta lub zarządu).
* Użytkownik prosi o wdrożenie / zdeployowanie projektu na **GitHub Pages**.
* Użytkownik chce założyć nowe repozytorium na GitHubie i podpiąć hosting statyczny przez `gh CLI`.

---

## 2. Zautomatyzowany Skrypt Wdrożeniowy

Do dyspozycji jest gotowy, bezpieczny skrypt PowerShell:
👉 [`scripts/deploy-gh-pages.ps1`](./scripts/deploy-gh-pages.ps1)

### Szybkie wywołanie:
```powershell
# Domyślny deployment (nazwa repozytorium jak katalog, publiczne, szuka index.html lub slide-template.html):
& ".agents/skills/deploy-gh-pages/scripts/deploy-gh-pages.ps1"

# Wskazanie własnej nazwy repozytorium i pliku źródłowego:
& ".agents/skills/deploy-gh-pages/scripts/deploy-gh-pages.ps1" -RepoName "prezentacja-zarzad" -SourceFile "resources/slide-template.html" -Visibility "public"
```

---

## 3. Ręczna Procedura Krok po Kroku (Dla Agenta)

Jeśli agent wykonuje poszczególne polecenia w konsoli samodzielnie:

### Krok 1: Weryfikacja logowania w GitHub CLI
```powershell
gh auth status
```
Upewnij się, że użytkownik jest zalogowany. Jeśli nie, poinformuj go o konieczności wykonania `gh auth login`.

### Krok 2: Przygotowanie `index.html` i pliku `.nojekyll`
GitHub Pages wymaga pliku `index.html` w katalogu głównym:
```powershell
if (-not (Test-Path "index.html")) {
    Copy-Item "resources/slide-template.html" "index.html"
}
New-Item -ItemType File -Name ".nojekyll" -Force | Out-Null
```

### Krok 3: Git Init & Commit
```powershell
if (-not (Test-Path ".git")) {
    git init -b main
}
git add index.html .nojekyll README.md
git commit -m "Deploy presentation to GitHub Pages"
```

### Krok 4: Utworzenie repozytorium na GitHubie i Push
```powershell
gh repo create "<nazwa-repozytorium>" --public --source=. --remote=origin --push
```
*Uwaga: Na bezpłatnych kontach GitHub darmowy hosting Pages wymaga repozytorium publicznego (`--public`).*

### Krok 5: Aktywacja usługi GitHub Pages przez API
Włącz Pages na gałęzi `main` w katalogu `/`:
```powershell
'{"source":{"branch":"main","path":"/"}}' | gh api --method POST "repos/{owner}/{repo}/pages" --input -
```

### Krok 6: Odczyt Live URL i Weryfikacja
Pobierz wygenerowany adres strony:
```powershell
gh api "repos/{owner}/{repo}/pages" --jq ".html_url"
```
Adres ma standardowy format:
`https://<username>.github.io/<nazwa-repozytorium>/`

---

## 4. Raportowanie dla Użytkownika

Po pomyślnym zakończeniu deploymentu zwróć użytkownikowi:
1. **Link do Repozytorium GitHub:** `https://github.com/<owner>/<repo>`
2. **Bezpośredni link do Prezentacji na GitHub Pages:** `https://<owner>.github.io/<repo>/`
3. Informację, że propagacja pierwszego buildu trwa zazwyczaj od 30 do 90 sekund.
