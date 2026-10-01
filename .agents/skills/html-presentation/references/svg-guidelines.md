# Zasady Pracy z Inline SVG w Prezentacjach (Text-Free SVG)

Jednym z najważniejszych wymogów jakościowych dla prezentacji jest generowanie **czystego, responsywnego wektora** połączonego z elastycznymi elementami HTML.

---

## 1. Złota Zasada: Czysta Geometria (Brak `<text>` wewnątrz SVG)

Nigdy nie umieszczaj tekstu wewnątrz znacznika `<text>` w SVG.

### Dlaczego?
* Znaczniki `<text>` w SVG nie obsługują automatycznego zawijania wierszy ani elastycznego flow.
* Skalowanie SVG często zniekształca lub rozmywa proporcje typografii.
* Brak dostępności i trudniejsze stylowanie fontami Google Fonts.

### Prawidłowy wzorzec projektowy:
SVG odpowiada wyłącznie za linie, osie, strzałki, łuki, tła i geometryczne powiązania. Teksty, nagłówki i etykiety są elementami HTML (`<div>`, `<span>`, `<h4>`), pozycjonowanymi za pomocą **CSS Grid**, **Flexbox** lub **pozycjonowania absolutnego** nad/wewnątrz kontenera grafiki.

---

## 2. Standardowe Markery i Definicje

Każdy blok SVG używający strzałek powinien definiować marker w `<defs>`:

```html
<svg viewBox="0 0 800 400" preserveAspectRatio="xMidYMid meet" class="diagram-svg">
  <defs>
    <!-- Grot ciemny (standardowy) -->
    <marker id="arrow-slate" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <polygon points="0 1, 8 4, 0 7" fill="#475569" />
    </marker>
    <!-- Grot akcentowy (niebieski) -->
    <marker id="arrow-blue" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <polygon points="0 1, 8 4, 0 7" fill="#2563EB" />
    </marker>
    <!-- Grot sukcesu (zielony) -->
    <marker id="arrow-green" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <polygon points="0 1, 8 4, 0 7" fill="#16A34A" />
    </marker>
  </defs>
  <!-- Ścieżki i kształty -->
</svg>
```

---

## 3. Przykłady Wektorów dla Zaawansowanych Układów

### A. Most Transformacji (Gap Analysis)
Wektor tworzy łukowatą kładkę lub gradientową platformę łączącą dwa punkty:
```html
<svg viewBox="0 0 800 160" class="bridge-svg">
  <defs>
    <linearGradient id="bridgeGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#94A3B8" />
      <stop offset="50%" stop-color="#2563EB" />
      <stop offset="100%" stop-color="#16A34A" />
    </linearGradient>
  </defs>
  <!-- Linia łuku mostu -->
  <path d="M 50 120 Q 400 20 750 120" fill="none" stroke="url(#bridgeGrad)" stroke-width="4" stroke-dasharray="6,6" />
  <!-- Strzałka wierzchołkowa -->
  <line x1="50" y1="120" x2="750" y2="120" stroke="#CBD5E1" stroke-width="2" />
</svg>
```

---

### B. Diagram Rybiej Ości (Ishikawa)
```html
<svg viewBox="0 0 900 360" class="ishikawa-svg">
  <defs>
    <marker id="fish-arrow" markerWidth="10" markerHeight="10" refX="7" refY="5" orient="auto">
      <polygon points="0 2, 8 5, 0 8" fill="#1E293B" />
    </marker>
  </defs>
  <!-- Kręgosłup główny -->
  <line x1="80" y1="180" x2="760" y2="180" stroke="#1E293B" stroke-width="4" marker-end="url(#fish-arrow)" />
  
  <!-- Górne ości (45 stopni) -->
  <line x1="220" y1="60" x2="340" y2="180" stroke="#64748B" stroke-width="3" />
  <line x1="460" y1="60" x2="580" y2="180" stroke="#64748B" stroke-width="3" />

  <!-- Dolne ości (45 stopni w górę) -->
  <line x1="220" y1="300" x2="340" y2="180" stroke="#64748B" stroke-width="3" />
  <line x1="460" y1="300" x2="580" y2="180" stroke="#64748B" stroke-width="3" />
</svg>
```

---

### C. Błędne Koło (Vicious Cycle – 4 Węzły)
Okrąg z 4 łukami i grotami:
```html
<svg viewBox="0 0 400 400" class="cycle-svg">
  <defs>
    <marker id="cycle-arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <polygon points="0 1, 8 4, 0 7" fill="#DC2626" />
    </marker>
  </defs>
  <!-- Łuk 1: Góra -> Prawo -->
  <path d="M 210 50 A 150 150 0 0 1 350 190" fill="none" stroke="#DC2626" stroke-width="3" marker-end="url(#cycle-arrow)" />
  <!-- Łuk 2: Prawo -> Dół -->
  <path d="M 350 210 A 150 150 0 0 1 210 350" fill="none" stroke="#DC2626" stroke-width="3" marker-end="url(#cycle-arrow)" />
  <!-- Łuk 3: Dół -> Lewo -->
  <path d="M 190 350 A 150 150 0 0 1 50 210" fill="none" stroke="#DC2626" stroke-width="3" marker-end="url(#cycle-arrow)" />
  <!-- Łuk 4: Lewo -> Góra -->
  <path d="M 50 190 A 150 150 0 0 1 190 50" fill="none" stroke="#DC2626" stroke-width="3" marker-end="url(#cycle-arrow)" />
</svg>
```

---

### D. Podwójny Diament (Double Diamond)
```html
<svg viewBox="0 0 800 320" class="diamond-svg">
  <!-- Diament 1: Problem (Discover / Define) -->
  <polygon points="80,160 260,30 440,160 260,290" fill="#EFF6FF" stroke="#2563EB" stroke-width="2.5" />
  <line x1="260" y1="30" x2="260" y2="290" stroke="#93C5FD" stroke-width="1.5" stroke-dasharray="4,4" />

  <!-- Diament 2: Rozwiązanie (Develop / Deliver) -->
  <polygon points="440,160 620,30 800,160 620,290" fill="#F0FDF4" stroke="#16A34A" stroke-width="2.5" />
  <line x1="620" y1="30" x2="620" y2="290" stroke="#86EFAC" stroke-width="1.5" stroke-dasharray="4,4" />
</svg>
```
Każdy wierzchołek diamentu ma swoją etykietę HTML (np. `1. Odkryj`, `2. Zdefiniuj`, `3. Opracuj`, `4. Wdróż`) umieszczoną bezpośrednio nad lub pod figurą.
