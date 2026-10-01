# Podręcznik Wdrażania na GitHub Pages przez GitHub CLI (`gh`)

Niniejszy dokument opisuje procedurę publikacji statycznych prezentacji HTML na GitHub Pages z poziomu wiersza poleceń przy użyciu oficjalnego narzędzia **GitHub CLI (`gh`)**.

---

## 1. Wymagania Wstępne

1. Zainstalowany program `gh`:
   ```powershell
   gh --version
   ```
2. Zalogowany użytkownik:
   ```powershell
   gh auth status
   ```
   *Jeśli nie jesteś zalogowany:*
   ```powershell
   gh auth login -w -p https -s repo,workflow
   ```

---

## 2. Standardowy Workflow Krok po Kroku

### Krok 1: Przygotowanie Pliku Głównego
GitHub Pages domyślnie serwuje plik `index.html` z katalogu głównego (`/`) lub podkatalogu `/docs`.
Upewnij się, że prezentacja jest skopiowana do `index.html`:
```powershell
Copy-Item "resources/slide-template.html" "index.html"
```
Dodaj pusty plik `.nojekyll`, aby wyłączyć silnik Jekyll (gwarantuje to bezpośrednie serwowanie plików HTML/SVG bez transformacji):
```powershell
New-Item -ItemType File -Name ".nojekyll" -Force
```

---

### Krok 2: Inicjalizacja i Commit Git
```powershell
git init -b main
git add index.html .nojekyll README.md
git commit -m "Deploy HTML presentation to GitHub Pages"
```

---

### Krok 3: Utworzenie Repozytorium na GitHubie
Użyj polecenia `gh repo create` z flagą `--public` (bezpłatny GitHub Pages wymaga publicznego repozytorium na darmowych kontach):
```powershell
# Przykład:
gh repo create "nazwa-prezentacji" --public --source=. --remote=origin --push
```

---

### Krok 4: Włączenie GitHub Pages przez REST API
Aktywuj Pages wskazując gałąź `main` oraz katalog główny (`/`):
```powershell
'{"source":{"branch":"main","path":"/"}}' | gh api --method POST "repos/{owner}/{repo}/pages" --input -
```

---

### Krok 5: Weryfikacja Statusu i Odczyt Live URL
Po włączeniu Pages GitHub automatycznie uruchamia build.
Adres URL prezentacji ma strukturę:
```text
https://<username>.github.io/<repo>/
```

Możesz odpytać API o aktualny status:
```powershell
# Pobranie docelowego URL:
gh api "repos/{owner}/{repo}/pages" --jq ".html_url"

# Sprawdzenie statusu ostatniego buildu:
gh api "repos/{owner}/{repo}/pages/builds/latest" --jq ".status"
```

---

## 3. Typowe Kody Błędów i Rozwiązania

| Kod / Problem | Przyczyna | Rozwiązanie |
| :--- | :--- | :--- |
| **`409 Conflict: Page already exists`** | Usługa Pages została już włączona w tym repozytorium | Zignoruj błąd lub zaktualizuj źródło metodą `PUT`. |
| **`404 Not Found` na live URL** | Pierwszy build trwa zazwyczaj 30–90 sekund | Odczekaj chwilę i odśwież stronę w trybie incognito (`Ctrl + F5`). |
| **`422 Unprocessable Entity`** | Próba włączenia Pages na repozytorium prywatnym na darmowym koncie GitHub Free | Zmień widoczność repo na publiczną: `gh repo edit --visibility public`. |
| **Brak stylów lub ikon** | Błędne ścieżki względne do zasobów | Nasze szablony są w 100% samowystarczalne (single-file HTML) i nie mają zewnętrznych zależności lokalnych. |
