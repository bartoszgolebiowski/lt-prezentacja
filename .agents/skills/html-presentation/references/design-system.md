# Design System: nowoczesny, inteligentny, nie fancy

Cel: czysty, spokojny, pewny siebie wygląd. Struktura i typografia robią robotę, nie efekty.

## 1. Zasady

* **Struktura zamiast ozdób.** Hierarchię budują rozmiar, waga i odstępy, nie ramki i cienie.
* **Jeden akcent na slajd.** `--primary` wskazuje to, co ważne. Reszta jest neutralna.
* **Dużo bieli, ale bez pustki.** Biała przestrzeń oddziela elementy, nie zostawia martwych stref. Główny element wizualny (wykres, diagram, karty) zajmuje min. 60% obszaru treści. Gdy po złożeniu slajdu widać duże puste pole, powiększ wizual lub dodaj wykres z danych.
* **Jedna idea na slajd.** Jeden tytuł-wniosek, jeden element wizualny.
* **Spójna siatka.** Marginesy 64px, rytm odstępów 8 / 16 / 24 / 32 / 48.

## 2. Typografia

| Rola | Rozmiar | Waga | Uwagi |
| :--- | :--- | :--- | :--- |
| Tytuł slajdu | 36–40px | 700 | `letter-spacing: -0.02em`, max 2 linie |
| Kicker | 12–13px | 600 | uppercase, `0.08em`, kolor muted |
| Tekst główny | 18–20px | 400–500 | `line-height: 1.5` |
| Etykieta / opis | 14–15px | 500 | kolor muted |
| Hero number | 96–120px | 700 | `font-variant-numeric: tabular-nums` |

* Jedna rodzina fontów (Inter lub Plus Jakarta Sans). Bez dekoracyjnych fontów.
* Maks. 3 rozmiary tekstu na slajd.
* Wyrównanie do lewej. Centrowanie tylko dla slajdu tytułowego, hero stat i Q&A.
* Min. 12px dla etykiet, 14px dla reszty. Nic mniejszego nie trafia na slajd.

## 3. Kolor

* Paleta: neutralne tło + tekst + `--primary`. `--accent` tylko jako drugi, rzadki akcent.
* Kolory semantyczne (`--success`, `--danger`) tylko dla znaczenia (dobrze / źle), nigdy dla dekoracji.
* Kontrast tekstu min. 7:1 na treści, 4.5:1 na etykietach.
* Zakaz gradientów w tłach kart i obramowaniach. Dopuszczalny subtelny gradient wyłącznie na slajdzie tytułowym.

## 4. Karty i powierzchnie

```css
.card {
  background: var(--bg-white);
  border: 1px solid var(--border-light);
  border-radius: 12px;
  padding: 24px;
}
```

* Jedna warstwa: ramka **albo** delikatny cień, nie oba. Cień: `0 1px 2px rgba(15,23,42,0.06)`.
* Jeden promień zaokrąglenia w całej prezentacji (12px karty, 8px małe elementy).
* Zakaz kart w kartach.
* Bez kolorowych pasków po lewej stronie karty i bez ikon w kolorowych kółkach.

## 5. Ikony i SVG

* Styl liniowy: `stroke-width: 1.5–2`, `stroke-linecap: round`, bez wypełnień.
* Jeden kolor linii (`--primary` lub `--text-muted`).
* Strzałki cienkie (2px), z małym grotem. Bez cieni i efektów glow.
* Emoji są zakazane.

## 6. Ruch

* Tylko `.fragment`: opacity + 6px przesunięcia, 250–300ms, `ease`.
* Bez animacji wejścia tytułów, obrotów, bounce, parallax.
* Przejścia między slajdami: prosty fade, max 200ms.

## 7. Tło slajdu tytułowego i finałowego

* Płaski kolor `--bg-dark`. Opcjonalnie jedna subtelna geometryczna linia lub siatka kropek przy 5–8% krycia.
* Zakaz zdjęć stockowych, neonów, glassmorphismu, mesh gradientów.

## 8. Checklista przed oddaniem

- [ ] Wniosek slajdu jest widoczny w 3 sekundy.
- [ ] Jeden akcent kolorystyczny, brak ozdobników.
- [ ] Brak tekstu poniżej 14px.
- [ ] Główny wizual zajmuje min. 60% obszaru treści, brak dużych martwych stref.
- [ ] Elementy wyrównane do wspólnej siatki.
- [ ] Brak ścian tekstu (patrz [copywriting-rules.md](./copywriting-rules.md)).
