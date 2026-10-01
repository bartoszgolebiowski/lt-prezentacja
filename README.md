# Generator Prezentacji HTML & Inline SVG (Antigravity Skill)

Projekt zawiera definicję i implementację dedykowanego skilla dla Antigravity: **`html-presentation`**, służącego do projektowania i kodowania profesjonalnych prezentacji biznesowych i technicznych (standard McKinsey, BCG, Google Keynote) w czystym HTML/CSS z wektorową grafiką Inline SVG.

---

## ⚡ Błyskawiczna Instalacja Skilli (`skills` CLI)

Możesz zainstalować te skille w dowolnym projekcie AI (Cursor, Claude Code, Antigravity, GitHub Copilot, Codex itp.) za pomocą oficjalnego menedżera skilli:

```bash
# Instalacja obu skilli (interaktywny wybór lub automatyczna instalacja):
npx skills add bartoszgolebiowski/lt-prezentacja

# Instalacja konkretnego skilla:
npx skills add bartoszgolebiowski/lt-prezentacja --skill html-presentation
npx skills add bartoszgolebiowski/lt-prezentacja --skill deploy-gh-pages

# Instalacja globalna (dostępna we wszystkich projektach użytkownika):
npx skills add -g bartoszgolebiowski/lt-prezentacja
```

### 🔗 Dostępne Skille w Repozytorium:
- [`.agents/skills/html-presentation`](.agents/skills/html-presentation/SKILL.md) — Tworzenie profesjonalnych prezentacji biznesowych w HTML/CSS + Inline SVG (standard McKinsey, BCG, Google Keynote).
- [`.agents/skills/deploy-gh-pages`](.agents/skills/deploy-gh-pages/SKILL.md) — Automatyczny deployment prezentacji na GitHub Pages przy pomocy GitHub CLI (`gh`).

---

## 📁 Pełna Struktura Skilla

```text
lt-prezentacja/
├── README.md
└── .agents/
    └── skills/
        └── html-presentation/
            ├── SKILL.md                          # Główna instrukcja skilla z frontmatterem YAML
            ├── references/
            │   ├── layouts.md                    # Katalog układów slajdów (kod + reguły)
            │   ├── charts.md                     # Zasady wykresów i danych (data-first)
            │   ├── svg-guidelines.md             # Zasady czystej geometrii (Text-Free SVG)
            │   ├── copywriting-rules.md          # Rygor 3 sekund i formuła Headline/Fragment
            │   ├── themes.md                     # System motywów CSS (McKinsey, Tech, Editorial, Klienci)
            │   └── presenter-controls.md         # Funkcje prezentera (Grid view, .fragment, PDF, Admin)
            └── resources/
                ├── base-template.html            # Główny szkielet prezentacji (CSS + JS + Panel Admina)
                ├── slide-template.html           # Pełny deck pokazowy (13 gotowych slajdów demo)
                └── layouts/                      # Modułowe szablony slajdów (Vector & Geometry snippets)
                    ├── 01-title.html
                    ├── 02-split-screen.html      (ze strzałką transformacji SVG)
                    ├── 03-cards-flow.html        (ze strzałkami przepływu SVG)
                    ├── 04-hero-stat.html         (ze strzałką trendu SVG)
                    ├── 05-pipeline-process.html  (z osią czasu i strzałkami)
                    ├── 06-grid-matrix.html       (z osiami współrzędnych SVG)
                    ├── 07-transformation-bridge.html (z łukiem i mostem SVG)
                    ├── 08-ishikawa-fishbone.html (z kręgosłupem i żebrami SVG)
                    ├── 09-root-cause-funnel.html (z wektorem penetracji w dół)
                    ├── 10-vicious-cycle.html     (z 4 łukami w okręgu SVG)
                    ├── 11-double-diamond.html    (z wektorowymi rombami SVG)
                    ├── 12-cta-next-steps.html
                    ├── 13-closing-qa.html
                    ├── 14-flywheel-loop.html     (z 4 zakrzywionymi strzałkami wzrostu)
                    ├── 15-chart-columns.html     (kolumny + KPI)
                    ├── 16-chart-ranking-bars.html (ranking + nawias Pareto)
                    ├── 17-chart-heatmap.html     (heatmapa sezonowości)
                    ├── 18-chart-lines.html       (linie + kolumna zmian)
                    └── 19-cta-decision-rows.html (decyzje z liczbą-dowodem)
```

---

## 🎯 Główne Filary Standardu

1. **3-Etapowy Workflow Warsztatowy:**
   * **Etap 1: Wywiad strategiczny:** Ustalenie celu spotkania, audytorium i kluczowej tezy.
   * **Etap 2: Konspekt i dobór layoutów:** Weryfikacja 4-etapowej ramy oraz zakazu powtórzeń sąsiadujących układów przed wygenerowaniem kodu.
   * **Etap 3: Generowanie HTML/CSS:** Wdrożenie rygoru słów, wektorów SVG i klas `.fragment`.

2. **Katalog 10 Dozwolonych Układów:**
   * **Klasyczne:** Split Screen (50/50), Trzy Kolumny (Rule of Thirds), Hero Stat (Big Number), Oś Czasu (Pipeline), Siatka 2x2.
   * **Wektorowe:** Most Transformacji (Gap Analysis), Diagram Rybiej Ości (Ishikawa), Lejek Przyczynowo-Skutkowy (5 Whys), Błędne Koło (Vicious Cycle), Podwójny Diament (Double Diamond).

3. **Zasada Czystej Geometrii (Text-Free SVG):**
   * Brak znaczników `<text>` wewnątrz SVG.
   * Wszystkie napisy osadzane w HTML (`<h3>`, `<p>`, `<span>`) z pozycjonowaniem CSS.

4. **Rygor Redakcyjny (30–50 słów na slajd):**
   * Format fragmentów: `<strong>Słowo kluczowe:</strong> Zwięzły wniosek (5–8 słów)`.
   * Przekaz czytelny w 3 sekundy.

5. **Wbudowane Narzędzia Prezentera & Panel Administratora:**
   * **Dyskretny Panel Administratora (`Alt + A`):** Ukryte okno do wyboru motywów, tworzenia nowych klientów za pomocą próbników kolorów, zapisu w `localStorage`, kopiowania kodu CSS oraz odpalania prezentacji.
   * **Widok miniatur / siatki (Grid View):** Klawisz `G` lub `Esc`.
   * **Krokowe odsłanianie (.fragment):** Spacja / strzałki odsłaniają punkty sekwencyjnie.
   * **Pasek postępu (Progress Bar):** Na górnej krawędzi slajdu.
   * **Ukrycie kontrolek (`H`):** Czysty ekran bez pływającego paska.
   * **System motywów:** `mckinsey`, `tech`, `editorial`, `ttpsc` oraz dowolne motywy klientów.
   * **Druk do PDF:** `Ctrl + P` z dopracowanym arkuszem `@media print`.

---

## 🚀 Jak Przetestować Szablon Pokazowy

W pliku `resources/slide-template.html` znajduje się kompletna prezentacja demonstracyjna zawierająca wszystkie 10 układów slajdów.

```powershell
Start-Process ".agents/skills/html-presentation/resources/slide-template.html"
```

---

## 🌐 Publikacja na GitHub Pages (`deploy-gh-pages`)

W projekcie znajduje się również dedykowany skill **`deploy-gh-pages`**, który automatyzuje cały proces publikacji prezentacji w internecie przy użyciu oficjalnego **GitHub CLI (`gh`)**:
1. Tworzy publiczne repozytorium GitHub (`gh repo create`).
2. Przygotowuje plik `index.html` oraz `.nojekyll`.
3. Wypycha zmiany i włącza usługę **GitHub Pages** przez GitHub REST API (`POST /repos/:owner/:repo/pages`).
4. Zwraca gotowy publiczny adres URL: `https://<username>.github.io/<repo>/`.

### Błyskawiczny deployment jednym poleceniem:
```powershell
& ".agents/skills/deploy-gh-pages/scripts/deploy-gh-pages.ps1"
```
Lub z własną nazwą repozytorium:
```powershell
& ".agents/skills/deploy-gh-pages/scripts/deploy-gh-pages.ps1" -RepoName "prezentacja-zarzad" -Visibility "public"
```
