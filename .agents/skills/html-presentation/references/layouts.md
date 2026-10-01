# Katalog Układów Slajdów (Layout Catalog)

Poniższy katalog zawiera specyfikację techniczną, strukturę DOM oraz stylizację 10 autoryzowanych układów slajdów. Każdy slajd ma wymiary robocze `1280px x 720px`.

---

## Wspólna struktura nagłówka slajdu
Wszystkie slajdy meritum (oprócz Hero Stat oraz slajdu tytułowego/finałowego) posiadają spójny nagłówek:

```html
<header class="slide-header">
  <span class="slide-kicker">STRATEGIA OPERACYJNA // Q3 2026</span>
  <h2 class="slide-title">Kluczowe Wnioski i Wąskie Gardła</h2>
</header>
```

```css
.slide-header {
  margin-bottom: 32px;
}
.slide-kicker {
  font-size: 13px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: #64748B;
  display: block;
  margin-bottom: 6px;
}
.slide-title {
  font-size: 34px;
  font-weight: 800;
  color: #0F172A;
  margin: 0;
  line-height: 1.2;
}
```

---

## Grupa A: Układy Klasyczne

### 1. Split Screen (50/50 lub 60/40)
* **Zastosowanie:** Zestawienie kontrastowe (Problem vs Rozwiązanie, Stan Obecny vs Propozycja) lub opis z wizualizacją.
* **Struktura:**
```html
<div class="split-container">
  <div class="split-col col-left">
    <div class="badge badge-danger">Wyzwanie</div>
    <h3>Przeciążenie manualne</h3>
    <ul class="bullet-list">
      <li><strong>Czas obsługi:</strong> 42 min na pojedyncze zgłoszenie.</li>
      <li><strong>Podatność na błędy:</strong> 18% pomyłek weryfikacyjnych.</li>
      <li><strong>Koszty skali:</strong> Wymóg zatrudnienia kolejnych 12 osób.</li>
    </ul>
  </div>
  <div class="split-col col-right">
    <div class="badge badge-success">Rozwiązanie</div>
    <h3>Automatyzacja agentowa</h3>
    <ul class="bullet-list">
      <li><strong>Czas reakcji:</strong> Skrócenie do poniżej 30 sekund.</li>
      <li><strong>Bezawaryjność:</strong> Wzrost precyzji do 99.4%.</li>
      <li><strong>Oszczędności:</strong> 65% redukcji kosztów obsługi.</li>
    </ul>
  </div>
</div>
```
* **CSS:**
```css
.split-container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 36px;
  flex: 1;
}
.split-col {
  background: #F8FAFC;
  border: 1px solid #E2E8F0;
  border-radius: 12px;
  padding: 32px;
  display: flex;
  flex-direction: column;
}
```

---

### 2. Karty / Trzy Kolumny (Rule of Thirds)
* **Zastosowanie:** 3 filary strategii, 3 obszary optymalizacji, 3 warianty.
* **Struktura:**
```html
<div class="cards-grid-3">
  <div class="card">
    <div class="card-num">01</div>
    <h3 class="card-title">Standaryzacja Danych</h3>
    <p class="card-text"><strong>Spójny model:</strong> Centralna warstwa schematów eliminuje 90% konfliktów.</p>
  </div>
  <div class="card card-featured">
    <div class="card-num">02</div>
    <h3 class="card-title">Orkiestracja LLM</h3>
    <p class="card-text"><strong>Wielomodelowość:</strong> Dynamiczny routing zapytań tnie koszty tokenów o 40%.</p>
  </div>
  <div class="card">
    <div class="card-num">03</div>
    <h3 class="card-title">Bramki Jakości</h3>
    <p class="card-text"><strong>Automatyczny audyt:</strong> Rygorystyczny fallback redukuje halucynacje do zera.</p>
  </div>
</div>
```
* **CSS:**
```css
.cards-grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 28px;
  flex: 1;
}
.card {
  background: #FFFFFF;
  border: 1px solid #E2E8F0;
  border-radius: 12px;
  padding: 32px 28px;
  display: flex;
  flex-direction: column;
}
.card-featured {
  border-color: #2563EB;
  box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.1);
}
.card-num {
  font-size: 28px;
  font-weight: 800;
  color: #2563EB;
  margin-bottom: 16px;
}
```

---

### 3. Hero Stat / Big Number
* **Zastosowanie:** Jeden krytyczny wskaźnik wpływający na decyzję biznesową.
* **Struktura:**
```html
<div class="hero-stat-container">
  <span class="hero-tag">ROCZNY POTENCJAŁ OSZCZĘDNOŚCI</span>
  <div class="hero-number">$2.4M</div>
  <p class="hero-takeaway">
    <strong>Pełna automatyzacja procesów:</strong> Zwrot z inwestycji (ROI) w zaledwie 4.5 miesiąca od wdrożenia.
  </p>
</div>
```
* **CSS:**
```css
.hero-stat-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}
.hero-tag {
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.12em;
  color: #64748B;
  text-transform: uppercase;
  margin-bottom: 12px;
}
.hero-number {
  font-size: 110px;
  font-weight: 900;
  line-height: 1;
  color: #0F172A;
  margin-bottom: 24px;
}
.hero-takeaway {
  font-size: 22px;
  color: #334155;
  max-width: 680px;
  line-height: 1.4;
}
```

---

### 4. Oś Czasu / Proces Poziomy (Pipeline)
* **Zastosowanie:** 3–5 faz wdrożenia, roadmapa lub etapy cyklu życia.
* **Struktura:**
```html
<div class="pipeline-container">
  <div class="pipeline-step">
    <div class="step-badge">Faza 1</div>
    <div class="step-connector"></div>
    <h4 class="step-title">Audyt i MVP</h4>
    <p class="step-desc"><strong>Czas trwania:</strong> 4 tygodnie</p>
    <p class="step-desc"><strong>Cel:</strong> Identyfikacja wąskich gardeł</p>
  </div>
  <div class="pipeline-step">
    <div class="step-badge">Faza 2</div>
    <div class="step-connector"></div>
    <h4 class="step-title">Integracja Core</h4>
    <p class="step-desc"><strong>Czas trwania:</strong> 8 tygodni</p>
    <p class="step-desc"><strong>Cel:</strong> Wdrożenie silnika orkiestracji</p>
  </div>
  <div class="pipeline-step">
    <div class="step-badge">Faza 3</div>
    <div class="step-connector"></div>
    <h4 class="step-title">Testy & Audyt</h4>
    <p class="step-desc"><strong>Czas trwania:</strong> 3 tygodnie</p>
    <p class="step-desc"><strong>Cel:</strong> Weryfikacja bezpieczeństwa</p>
  </div>
  <div class="pipeline-step">
    <div class="step-badge">Faza 4</div>
    <h4 class="step-title">Skalowanie</h4>
    <p class="step-desc"><strong>Czas trwania:</strong> Ciągły rollout</p>
    <p class="step-desc"><strong>Cel:</strong> Objęcie 100% departamentów</p>
  </div>
</div>
```
* **CSS:**
```css
.pipeline-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  position: relative;
  align-items: flex-start;
  margin-top: 40px;
}
.pipeline-step {
  position: relative;
  background: #F8FAFC;
  border: 1px solid #E2E8F0;
  border-radius: 12px;
  padding: 24px 20px;
}
.step-connector {
  position: absolute;
  top: 36px;
  right: -24px;
  width: 24px;
  height: 2px;
  background: #CBD5E1;
  z-index: 2;
}
```

---

### 5. Siatka 2x2 / Grid Layout
* **Zastosowanie:** Macierz priorytetów (Wpływ vs Wysiłek), SWOT, 4 filary architektury.
* **Struktura:**
```html
<div class="grid-2x2">
  <div class="quadrant q-tl">
    <span class="q-label">Szybkie Wygrane (Quick Wins)</span>
    <h4>Automatyzacja szablonów</h4>
    <p><strong>Wysiłek:</strong> Niski | <strong>Wpływ:</strong> Wysoki</p>
  </div>
  <div class="quadrant q-tr">
    <span class="q-label">Projekty Strategiczne</span>
    <h4>Migracja Hurtowni Danych</h4>
    <p><strong>Wysiłek:</strong> Wysoki | <strong>Wpływ:</strong> Bardzo wysoki</p>
  </div>
  <div class="quadrant q-bl">
    <span class="q-label">Wypełniacze Czasu</span>
    <h4>Drobne poprawki UI</h4>
    <p><strong>Wysiłek:</strong> Niski | <strong>Wpływ:</strong> Znikomy</p>
  </div>
  <div class="quadrant q-br">
    <span class="q-label">Pułapki Zasobowe</span>
    <h4>Własny model bazowy LLM</h4>
    <p><strong>Wysiłek:</strong> Ekstremalny | <strong>Wpływ:</strong> Niepewny</p>
  </div>
</div>
```

---

## Grupa B: Układy Wektorowe i Geometryczne

### 6. Most Transformacji (From – To / Gap Analysis)
* **Zastosowanie:** Zobrazowanie transformacji biznesowej lub technologicznej i mostu zasobów/kroków pokonujących lukę (gap).
* **Układ:** Lewy blok (`Stan Obecny`), Prawy blok (`Stan Docelowy`) oraz centralna strefa ze strzałką i mostem SVG, na którym osadzone są elementy HTML z działaniami.

### 7. Diagram Rybiej Ości (Ishikawa)
* **Zastosowanie:** Dogłębna analiza awarii lub problemu systemowego.
* **Komponent SVG:** Pozioma linia kręgosłupa z grotem skierowanym na blok problemu po prawej stronie (`Główna Awaria`) oraz ukośne ości (`45°`) dla 4 kategorii (Ludzie, Narzędzia, Procesy, Środowisko). Teksty umieszczane w tagach HTML na końcach i wzdłuż ości.

### 8. Lejek Przyczynowo-Skutkowy (Root Cause Funnel / 5 Whys)
* **Zastosowanie:** Analiza od symptomów zewnętrznych do źródła awarii (*Root Cause*).
* **Komponent:** Pionowa sekwencja zwężających się bloków/trapezów ze strzałką w dół w SVG symbolizującą pogłębianie analizy.

### 9. Błędne Koło / Pętla Sprzężenia (Vicious Cycle)
* **Zastosowanie:** Samonapędzające się problemy (np. Dług techniczny -> Wolny release -> Presja czasu -> Więcej długu).
* **Komponent SVG:** 4 łukowe strzałki w okręgu łączące 4 węzły HTML rozmieszczone symetrycznie (Góra, Prawa, Dół, Lewa).

### 10. Podwójny Diament (Double Diamond)
* **Zastosowanie:** Fazy *Discover -> Define -> Develop -> Deliver*.
* **Komponent SVG:** Dwa stykające się wektorowe romby (dywergencja/konwergencja problemu oraz dywergencja/konwergencja rozwiązania) z podpisami HTML na wierzchołkach.

---

## Grupa C: Układy Wykresowe (dane liczbowe)

Pełne zasady, wzory skalowania i checklista: [charts.md](./charts.md). Gotowe szablony: `resources/layouts/15`–`19`.

### 11. Wykres kolumnowy + KPI (`15-chart-columns.html`)
* **Zastosowanie:** Trend jednej wartości w czasie (kwartały, miesiące) i jedna kluczowa liczba.
* **Struktura:** Lewa kolumna 320px (KPI + strzałka trendu), prawa: siatka N kolumn HTML z liniami bazowymi, linia przerywana poziomu bazowego.

### 12. Ranking słupkowy + nawias Pareto (`16-chart-ranking-bars.html`)
* **Zastosowanie:** 6–10 pozycji malejąco; pokazuje, że kilka pozycji daje większość.
* **Struktura:** Wiersze `grid` (nazwa / słupek / wartość · udział), top N w `--primary`, nawias SVG i duża liczba udziału po prawej.

### 13. Heatmapa produkt x okres (`17-chart-heatmap.html`)
* **Zastosowanie:** Sezonowość i wzorce wielu pozycji; grupowanie wierszy wg wzorca z etykietą grupy po prawej.
* **Struktura:** Siatka komórek z natężeniem `--m` (`color-mix` z `--primary`).

### 14. Wykres liniowy + kolumna zmian (`18-chart-lines.html`)
* **Zastosowanie:** 2–3 serie, przecięcie ("X wyprzedził Y"), delta początek-koniec.
* **Struktura:** SVG 860x380 (osie i linie), etykiety i podziałka w HTML, po prawej kolumna zmian z `.fragment`.

### 15. CTA z wierszami decyzji (`19-cta-decision-rows.html`)
* **Zastosowanie:** Przedostatni slajd po wykresach; każda decyzja z liczbą-dowodem.
* **Struktura:** 3 wiersze `flex: 1` wypełniające obszar treści: numer / decyzja / liczba.
