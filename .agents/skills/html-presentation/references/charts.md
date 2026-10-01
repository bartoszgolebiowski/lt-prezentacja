# Wykresy i Dane (Data-First)

Gdy użytkownik dostarcza dane (CSV, tabela, liczby), prezentacja ma je **pokazać**, nie opisać. Slajd z samymi kartami tekstowymi przy danych liczbowych to błąd.

---

## 1. Zasady nadrzędne

1. **Dane = wykres.** Przy danych liczbowych min. **połowa slajdów meritum** zawiera wykres (kolumnowy, słupkowy, liniowy, heatmapa). Karty tekstowe są wyjątkiem.
2. **Wykres wypełnia kanwę.** Wizualizacja zajmuje min. 60% wysokości i szerokości obszaru `.slide-body`. Puste strefy większe niż 80px wokół wykresu to błąd. Biała przestrzeń ma oddzielać, nie wypełniać slajd pustką.
3. **Jeden wniosek, jeden wykres.** Tytuł mówi, co widać na wykresie ("Q3 był szczytem roku").
4. **Jeden akcent.** Pozycja będąca wnioskiem ma `--primary`, reszta neutralna (`#CBD5E1`, `#64748B`). `--success`/`--danger` tylko dla zmian (wzrost/spadek).
5. **Oś od zera** dla słupków i kolumn. Nie skracaj osi, by uzyskać dramatyzm.
6. **Etykiety bezpośrednie.** Wartości przy słupkach i końcach linii. Zakaz legend, gdy da się podpisać serię przy danych.
7. **Liczby tabelaryczne:** `font-variant-numeric: tabular-nums`. Jednostka raz, w kickerze lub podpisie.
8. **Min. 14px** dla etykiet i podziałki. Wartości kluczowe 20px+.
9. **Text-Free SVG.** Linie, punkty, nawiasy w SVG. Wszystkie liczby i podpisy w HTML. Słupki robisz w HTML/CSS (`height` lub `width` w px/%), bo to najprostsze i bezbłędne.
10. **Obliczaj, nie zgaduj.** Zanim narysujesz, policz sumy, udziały i zmiany % (węzeł `node -e` lub tabela). Zaokrąglaj spójnie. Sprawdź, że udziały sumują się do 100%.

---

## 2. Mapowanie: rodzaj danych na typ wykresu

| Pytanie do danych | Wykres | Układ |
| :--- | :--- | :--- |
| Jak zmienia się jedna wartość w czasie (4–12 punktów)? | Kolumny + KPI | [15-chart-columns.html](../resources/layouts/15-chart-columns.html) |
| Co jest największe? Czy kilka pozycji dominuje? | Ranking poziomy + nawias Pareto | [16-chart-ranking-bars.html](../resources/layouts/16-chart-ranking-bars.html) |
| Jak wiele pozycji zachowuje się w czasie (wzorce, sezonowość)? | Heatmapa | [17-chart-heatmap.html](../resources/layouts/17-chart-heatmap.html) |
| Które serie rosną, które spadają, gdzie się przecinają? | Linie z etykietami bezpośrednimi | [18-chart-lines.html](../resources/layouts/18-chart-lines.html) |
| Jakie decyzje wynikają z danych? | Wiersze decyzji z liczbą-dowodem | [19-cta-decision-rows.html](../resources/layouts/19-cta-decision-rows.html) |

Unikaj wykresów kołowych przy więcej niż 3 częściach. Zamiast tego ranking poziomy.

---

## 3. Skalowanie (wzory)

* **Słupek/kolumna:** `rozmiar_px = wartość / max * DOSTĘPNY_ROZMIAR_px`.
* **Linia (SVG):** `y(v) = y0 - v * (y0 - ytop) / max`, `x(i) = x0 + i * krok`. Etykiety osi i serii jako HTML `position: absolute` w kontenerze o tym samym rozmiarze co `viewBox`.
* **Heatmapa:** natężenie koloru `color-mix(in srgb, var(--primary) N%, #FFFFFF)`, `N = udział% * 1,9` (max 100). Tekst biały od `N >= 55`.
* **Zmiana %:** `(koniec - początek) / początek`. Podawaj okres ("Q4 wobec Q1").

---

## 4. Etykiety i limit słów

* Etykiety danych wykresu (nazwy pozycji, wartości, podziałka) **nie wliczają się** do limitu 20–35 słów.
* Do limitu wliczają się: kicker, tytuł, jedno zdanie komentarza, wyróżnione wnioski.
* Komentarz do wykresu: max jedno zdanie lub jedna wyróżniona liczba (KPI, nawias, kolumna zmian).

---

## 5. Dramaturgia serii slajdów z danymi

Rekomendowany łuk: **całość → ranking → wzorce → przyczyna zmiany → decyzje.**

1. Wynik całkowity i trend (kolumny + KPI).
2. Kto za to odpowiada (ranking Pareto).
3. Gdy w danych jest czas: wzorce i sezonowość (heatmapa).
4. Kto rośnie, kto spada i dlaczego (linie + kolumna zmian).
5. Decyzje z liczbą-dowodem przy każdej.

Każdy slajd odpowiada na "no i co?" następnym.

---

## 6. Checklista wykresu

- [ ] Tytuł to wniosek odczytywalny z wykresu w 3 sekundy.
- [ ] Oś od zera, jednostka podana raz.
- [ ] Jeden kolor akcentu, reszta neutralna.
- [ ] Etykiety bezpośrednie, brak legendy.
- [ ] Wykres zajmuje min. 60% obszaru treści.
- [ ] Sumy, udziały i zmiany % przeliczone.
- [ ] Brak `<text>` w SVG.
