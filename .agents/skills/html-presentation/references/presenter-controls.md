# Funkcjonalności Prezentera i Druk (Presenter Controls & PDF)

Szablon HTML zawiera wbudowany, lekki silnik JavaScript umożliwiający płynną prezentację na żywo oraz bezbłędny eksport do formatu PDF.

---

## 1. Skróty Klawiszowe Prezentera

| Klawisz | Akcja | Opis |
| :--- | :--- | :--- |
| `Alt + A` | **Panel Administratora** | Otwiera dyskretny panel konfiguracji motywów, tworzenia nowych klientów i odpalania prezentacji |
| `H` | **Ukryj / Pokaż Kontrolki** | Włącza/wyłącza widoczność pływającego dolnego paska nawigacji (tryb czystego ekranu przed klientem) |
| `→` / `Spacja` / `PageDown` | **Następny Krok** | Odsłania kolejny element (`.fragment`) lub przechodzi do kolejnego slajdu |
| `←` / `PageUp` | **Poprzedni Krok** | Cofa odsłonięcie elementu lub wraca do poprzedniego slajdu |
| `G` / `Esc` | **Widok Siatki (Grid View)** | Wyświetla miniatury wszystkich slajdów na jednym ekranie z możliwością szybkiego skoku |
| `F` | **Pełny Ekran** | Przełącza widok pełnoekranowy przeglądarki (Fullscreen API) |
| `T` | **Szybka Zmiana Motywu** | Cyklicznie przełącza aktywny motyw (TTPSC -> PwC -> CyberArk -> Palo Alto) |
| `Home` | **Początek** | Przeskakuje natychmiast do slajdu tytułowego |
| `End` | **Koniec** | Przeskakuje do slajdu finałowego / Q&A |

---

## 2. Dyskretny Panel Administratora (`Alt + A`)

Wbudowany panel administratora pozwala skonfigurować prezentację przed wejściem na spotkanie z klientem:
1. **Wybór Motywu:** Dropdown zawierający motywy standardowe oraz wszystkich dodanych klientów.
2. **Kreator Nowego Klienta:** Formularz z próbnikami kolorów (Primary, Accent, Dark BG, Light BG, Text) i fontem. Zapisuje dane w pamięci przeglądarki (`localStorage`) oraz generuje kod CSS do skopiowania do repozytorium.
3. **Odpalenie Czystej Prezentacji:** Przycisk `▶ Odpal Czystą Prezentację` ustawia wybrany motyw, przewija do slajdu 1, opcjonalnie ukrywa pasek kontrolek i uruchamia tryb pełnoekranowy. Klient widzi wyłącznie perfekcyjnie ostylowane slajdy bez żadnych narzędzi technicznych.

---

## 3. Krokowe Odsłanianie Treści (Step-by-Step Reveal)

Aby treść na slajdzie nie rozpraszała widza i pojawiała się synchronicznie z wypowiedzią prelegenta, nadaj elementom klasę `.fragment`:

```html
<div class="cards-row-3">
  <div class="column-card fragment">
    <div class="col-idx">01</div>
    <h4>Krok Pierwszy</h4>
    <p>Pojawi się po pierwszym wciśnięciu spacji.</p>
  </div>
  <div class="column-card fragment">
    <div class="col-idx">02</div>
    <h4>Krok Drugi</h4>
    <p>Pojawi się po drugim wciśnięciu spacji.</p>
  </div>
  <div class="column-card fragment">
    <div class="col-idx">03</div>
    <h4>Krok Trzeci</h4>
    <p>Pojawi się po trzecim wciśnięciu spacji.</p>
  </div>
</div>
```

* **Działanie:** Elementy z klasą `.fragment` są domyślnie półprzezroczyste (`opacity: 0.15`) lub ukryte. Kolejne wciśnięcie spacji/strzałki w prawo nadaje im klasę `.visible`, płynnie je aktywując. Dopiero gdy wszystkie fragmenty danego slajdu zostaną odsłonięte, kolejne wciśnięcie spacji przełącza slajd na następny.

---

## 4. Pasek Postępu (Progress Bar)

Górna krawędź prezentacji zawiera dyskretny pasek o grubości `3px` (`#deck-progress`), którego szerokość w czasie rzeczywistym odzwierciedla postęp:
$$\text{width} = \frac{\text{bieżący slajd}}{\text{liczba slajdów}} \times 100\%$$

---

## 5. Widok Siatki (Grid View)

Wciśnięcie klawisza `G` lub `Esc`:
1. Zmniejsza slajdy i układa je w interaktywnej siatce kafelków (widok 3x3 lub 4x3).
2. Podświetla aktualnie aktywny slajd.
3. Kliknięcie dowolnego kafelka zamyka widok siatki i natychmiast przenosi prelegenta do wybranego slajdu.

---

## 6. Eksport do PDF (Druk Przeglądarkowy)

Szablon zawiera dedykowane reguły `@media print`:
* Automatycznie ukrywa kontrolki UI, pasek nawigacji i przyciski.
* Wymusza wymiary strony `1280px x 720px` w orientacji poziomej (`landscape`).
* Ustawia `page-break-after: always;` po każdym slajdzie.
* Wymusza widoczność wszystkich `.fragment` (żaden element nie jest ukryty na wydruku).

### Jak zapisać do PDF:
1. Otwórz plik `.html` w przeglądarce (Chrome / Edge / Firefox).
2. Wciśnij `Ctrl + P`.
3. Wybierz: **Docelowy format: Zapisz jako PDF**.
4. Układ: **Poziomo (Landscape)**.
5. Marginesy: **Brak (None)**.
6. Zaznacz: **Grafika w tle (Background graphics)**.
