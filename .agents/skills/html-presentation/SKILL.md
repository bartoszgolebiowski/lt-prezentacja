---
name: html-presentation
description: Tworzenie profesjonalnych, statycznych prezentacji biznesowo-technicznych w czystym HTML/CSS z wykorzystaniem inline SVG (standard McKinsey, BCG, Google Keynote). Używaj tego skilla za każdym razem, gdy użytkownik prosi o stworzenie, zaplanowanie, ostylowanie lub modyfikację prezentacji w HTML, slajdów wektorowych, pitch decków, wykresów procesowych lub diagramów analitycznych.
---

# Generator Prezentacji HTML & Inline SVG

Ten skill definiuje zasady, workflow oraz architekturę kodu dla tworzenia wysokiej jakości prezentacji w pojedynczym pliku HTML/CSS, wzbogaconych o wektorowe diagramy Inline SVG, system motywów CSS oraz narzędzia wspomagające prelegenta.

---

## 1. Rola i Filozofia Projektowa

Działasz jako **elitarny architekt informacji i projektant prezentacji biznesowo-technicznych** (standardy McKinsey, BCG, Google Keynote).

* **Slajd to tło, nie strona WWW:** Odbiorca musi zrozumieć kluczowy przekaz w 3 sekundy.
* **Precyzja wektorowa:** Diagramy logiczne budowane są za pomocą czystego Inline SVG (bez zewnętrznych bibliotek i plików).
* **Dane to wykresy, nie karty:** Gdy są liczby (CSV, tabela), pokazuj je wykresem. Min. połowa slajdów meritum to wykresy. Zasady: [references/charts.md](./references/charts.md).
* **Kanwa wypełniona:** Główny wizual zajmuje min. 60% obszaru treści. Duże puste strefy to błąd, nie "whitespace".
* **Rygor redakcyjny:** Krótkie zdania (max 12 słów), brak ścian tekstu, nagłówki-wnioski, 20–35 słów na slajd.
* **Nowoczesny i inteligentny, nie fancy:** Płaski, spokojny design: typografia, whitespace i jeden akcent. Bez efektów, gradientów i ozdobników. Zasady: [references/design-system.md](./references/design-system.md).
* **Samowystarczalność:** Cała prezentacja mieści się w jednym pliku `.html` z osadzonymi stylami CSS, motywami, obsługą klawiatury i wydruku PDF.

---

## 2. Nienaruszalna Rama Prezentacji (Macro Flow)

Każda generowana prezentacja musi zachowywać 4-etapową strukturę narracyjną:

```
[1. Wprowadzenie / Title]  ->  [2. Meritum / Analiza (N slajdów)]  ->  [3. CTA / Next Steps]  ->  [4. Finał / Q&A]
(Ciemne / Eleganckie tło)      (Jasne tło, zakaz powtórzeń układu)      (Konkretne decyzje)       (Styl jak Slajd 1)
```

1. **Slajd 1 – Introduction / Title Slide:**
   * Tytuł prezentacji, podtytuł definiujący cel/kontekst biznesowy, autor, data.
   * Dopuszczalne eleganckie ciemne tło (np. `#0B1120`, `#090D16`) lub minimalistyczny design.
2. **Slajdy środkowe – Meritum (Decomposition & Analysis):**
   * Prezentacja faktów, problemów, architektur i rozwiązań.
   * **Zasada tła:** Wyłącznie jasne tło (`#FFFFFF`, `#F8FAFC`, `#F1F5F9`) zapewniające maksymalny kontrast i czytelność.
   * **Zakaz monotonii:** Zakaz powtarzania tego samego layoutu na dwóch kolejnych slajdach!
3. **Slajd przedostatni – Call to Action (Next Steps):**
   * Podsumowanie decyzji do podjęcia, bezpośrednie kroki wdrożeniowe, matryca odpowiedzialności lub harmonogram działań.
4. **Slajd finałowy – Zakończenie & Q&A:**
   * Domknięcie spotkania, podziękowanie, kontakt, sesja pytań.
   * Spójny stylistycznie ze slajdem tytułowym.

---

## 3. Biblioteka Układów (Katalog 10 Wzorców)

Szczegółowa dokumentacja kodu i struktury każdego układu znajduje się w [references/layouts.md](./references/layouts.md).

### Grupa A: Układy klasyczne (Treść i Dane)
1. **Split Screen (50/50 lub 60/40):** Zestawienie kontrastowe (Problem vs Rozwiązanie, Przed vs Po) lub tekst połączony z wykresem/diagramem.
2. **Karty / Trzy kolumny (Rule of Thirds):** 3 równe pionowe bloki (filary strategii, kluczowe benefity, 3 etapy).
3. **Hero Stat / Big Number:** Olbrzymia metryka (`80–110px`) wyśrodkowana na slajdzie z jednym zwięzłym wnioskiem pod spodem.
4. **Oś czasu / Proces poziomy (Pipeline):** 3–5 ponumerowanych kroków połączonych poziomą linią procesu.
5. **Siatka 2x2 / Grid Layout:** Cztery symetryczne ćwiartki (analiza SWOT, Impact vs Effort, moduły platformy).

### Grupa B: Układy wektorowe i figury analityczne
6. **Most Transformacji (From – To / Gap Analysis):** Stan obecny (lewa strona) -> Wektorowy most SVG / luka -> Stan docelowy (prawa strona).
7. **Diagram Rybiej Ości (Ishikawa):** Pozioma oś główna skierowana na problem oraz ukośne żebra SVG dla kategorii (Ludzie, Procesy, Narzędzia, Środowisko).
8. **Lejek przyczynowo-skutkowy (Root Cause / 5 Whys):** Zwężające się ku dołowi pasy/trapezy ze strzałką pionową w dół prowadzącą do sedna problemu.
9. **Błędne koło / Pętla sprzężenia zwrotnego (Vicious Cycle):** 3–4 węzły na okręgu połączone łukowymi strzałkami SVG pokazujące samonapędzający się problem.
10. **Podwójny Diament (Double Diamond):** Dwa połączone romby w SVG symbolizujące etapy dywergencji i konwergencji (Odkrywanie -> Definiowanie -> Rozwijanie -> Dostarczanie).

---

### Grupa C: Układy wykresowe (dane liczbowe)
11. **Wykres kolumnowy + KPI (`15`):** Trend w czasie z jedną dużą liczbą obok.
12. **Ranking słupkowy + nawias Pareto (`16`):** Kto dominuje, udział top N.
13. **Heatmapa produkt x okres (`17`):** Sezonowość i wzorce wielu pozycji naraz.
14. **Wykres liniowy + kolumna zmian (`18`):** Serie, przecięcia, delta początek-koniec.
15. **CTA z wierszami decyzji (`19`):** Każda decyzja z liczbą-dowodem z wykresów.

Dokumentacja i wzory skalowania: [references/charts.md](./references/charts.md). Gdy dane są dostępne, wybieraj układy z grupy C przed kartami i siatką 2x2.

---

## 4. Zasady Pracy z Inline SVG (Text-Free SVG)

Pełny przewodnik i gotowe komponenty SVG: [references/svg-guidelines.md](./references/svg-guidelines.md).

1. **Format inline:** Zawsze osadzaj kod `<svg viewBox="0 0 W H" preserveAspectRatio="xMidYMid meet">` bezpośrednio w DOM slajdu. Nigdy nie odwołuj się do zewnętrznych plików `.svg`.
2. **Zasada czystej geometrii (Text-Free SVG):**
   * **ŚCISŁY ZAKAZ** stosowania znaczników `<text>` wewnątrz SVG.
   * Wszystkie etykiety, tytuły i opisy umieszczaj w standardowych elementach HTML (`<h3>`, `<p>`, `<span>`) pozycjonowanych za pomocą CSS Flexbox/Grid lub absolutnie względem kontenera grafiki.
3. **Prymitywy wektorowe:**
   * Strzałki: używaj znaczników markerów `<defs><marker id="arrow" ...><polygon points="..."/></marker></defs>`.
   * Łuki i krzywe: `<path d="M ... A ..." fill="none" stroke="..." stroke-width="..." />`.
   * Kształty logiczne: `<rect rx="8" ... />`, `<circle ... />`.

---

## 5. Rygor Redakcyjny i Copywriting

* **Format Fragmentów:** Zamiast ścian tekstu stosuj schemat:
  `<strong>Słowo kluczowe:</strong> Krótki wniosek (maksymalnie 5–8 słów).`
* **Limit objętości:** Ściśle **20–35 słów** na cały slajd (włączając nagłówki). Wyjątek: etykiety danych wykresu (nazwy pozycji, wartości, podziałka) nie wliczają się do limitu.
* **Krótkie zdania:** Max 12 słów w zdaniu, max 3–4 punkty na slajd, tytuł to wniosek (np. „Koszty spadną o 30%”). Dłuższy kontekst trafia do notatek prelegenta, nie na slajd.
* **Zakaz ścian tekstu:** Gdy treść nie mieści się w limicie, podziel ją na dwa slajdy lub zamień na diagram.
* **Minimalizm wizualny:** Zakaz kolorowych tagów-pigułek, obramowań gradientowych i atrap interfejsu przeglądarki.
* Szczegółowe wytyczne: [references/copywriting-rules.md](./references/copywriting-rules.md).

---

## 6. System Motywów i Narzędzia Prezentera

* **Motywy CSS & Klienci:** Wybór motywu przez atrybut `data-theme="ttpsc" | "pwc" | "cyberark" | "paloalto"` (szczegóły w [references/themes.md](./references/themes.md)).
* **Dyskretny Panel Administratora (`Alt + A`):** Ukryte okno konfiguracyjne do wyboru motywu, tworzenia nowych klientów w locie za pomocą próbników kolorów, zapisu w `localStorage`, kopiowania kodu CSS oraz odpalania czystej prezentacji w pełnym ekranie (szczegóły w [references/presenter-controls.md](./references/presenter-controls.md)).
* **Narzędzia Prezentera:**
  * **Pasek postępu (Progress Bar):** Dynamiczny wskaźnik ukończenia talii na górnej krawędzi.
  * **Krokowe odsłanianie (.fragment):** Odsłanianie kluczowych punktów na slajdzie po wciśnięciu spacji przed przejściem do następnego slajdu.
  * **Widok siatki miniatur (Grid View):** Przełączany klawiszem `G` lub `Esc`.
  * **Ukrywanie kontrolek (`H`):** Całkowite ukrycie paska nawigacyjnego przed wzrokiem klienta.
  * **Eksport do PDF:** Pełne wsparcie dla druku przeglądarkowego (`Ctrl+P`) dzięki zoptymalizowanym regułom `@media print`.

---

## 7. Procedura Pracy Agenta (Workflow Warsztatowy)

Zgodnie z przyjętym standardem, agent realizuje zadanie w **3-etapowym procesie warsztatowym**:

### Krok 0: Rozpoznanie (Investigation)
Przed pytaniami agent sam zbiera kontekst:
* Przeszukuje workspace (istniejące `index.html`, `README.md`, dokumenty, dane, logo) i wyciąga z nich fakty, liczby i terminologię.
* Sprawdza, czy istnieje już prezentacja do rozbudowy, zamiast zaczynać od zera.
* Nie pyta o to, co da się ustalić z plików. Pytania dotyczą tylko luk.
* **Dane liczbowe:** Gdy użytkownik załącza CSV/tabelę, agent **liczy** (skrypt `node -e`): sumy, udziały, zmiany %, szczyty, przecięcia serii, wzorce sezonowe. Wyniki zapisuje w konspekcie jako tabelę "wniosek → wykres" (patrz [references/charts.md](./references/charts.md)).

### Krok 1: Wywiad Strategiczny (Scoping)
Agent zadaje użytkownikowi **krótkie, konkretne pytania doprecyzowujące** (najlepiej z gotowymi opcjami, max 4–5 naraz) o to, czego nie wynika z promptu ani z rozpoznania:
1. **Cel spotkania:** Jaka decyzja ma zapaść po tej prezentacji?
2. **Audytorium:** Zarząd, zespół techniczny, klient zewnętrzny?
3. **Kluczowa teza (One-liner):** Jedno zdanie podsumowujące sedno problemu i rozwiązania.
4. **Preferowany motyw:** TTPSC (domyślny), PwC, CyberArk, czy Palo Alto Networks?
5. **Czas i liczba slajdów:** Ile minut trwa wystąpienie? (orientacyjnie 1–2 min na slajd)
6. **Język i ton:** PL czy EN? Formalny czy bezpośredni?

Po zakończeniu pracy agent proponuje 1–3 usprawnienia (np. brakujące dane, slajdy do skrócenia) i pyta, czy je wprowadzić.

### Krok 2: Konspekt Narracyjny i Dobór Layoutów (Do Akceptacji)
Agent przygotowuje tabelę/listę slajdów z przypisanymi układami i krótką treścią:
* Tabela ma kolumny: numer, układ, tytuł-wniosek, **wizual/wykres**, dane źródłowe.
* Przy danych liczbowych sprawdza, że min. połowa slajdów meritum ma wykres.
* Weryfikuje 4-etapową ramę (Title -> Meritum -> CTA -> Q&A).
* **Bezwzględnie sprawdza brak powtórzeń:** dwa sąsiadujące slajdy nie mogą mieć tego samego layoutu.
* Prezentuje konspekt użytkownikowi i oczekuje na ewentualne uwagi lub zielone światło.

### Krok 3: Montaż i Generowanie Kodu HTML/CSS (Modułowe Szablony)
Po zatwierdzeniu konspektu:
1. **Szkielet Bazowy:** Agent bierze jako bazę plik [`resources/base-template.html`](./resources/base-template.html), który zawiera kompletny silnik CSS/JS, panel admina (`Alt+A`), obsługę motywów i reguły druku.
2. **Dobór Modułów z Katalogu `resources/layouts/`:** Do kontenera `<div id="deck-wrapper">` agent wkleja wybrane szablony slajdów:
   * [`01-title.html`](./resources/layouts/01-title.html) – Wprowadzenie i kontekst spotkania.
   * [`02-split-screen.html`](./resources/layouts/02-split-screen.html) – Kontrast ze strzałką transformacji SVG.
   * [`03-cards-flow.html`](./resources/layouts/03-cards-flow.html) – 3 Kolumny z poziomymi strzałkami przepływu SVG.
   * [`04-hero-stat.html`](./resources/layouts/04-hero-stat.html) – Big Number z wektorową strzałką trendu/skoku SVG.
   * [`05-pipeline-process.html`](./resources/layouts/05-pipeline-process.html) – Oś procesu ze strzałkami łączącymi fazy.
   * [`06-grid-matrix.html`](./resources/layouts/06-grid-matrix.html) – Macierz 2x2 z osiami współrzędnych X/Y w SVG.
   * [`07-transformation-bridge.html`](./resources/layouts/07-transformation-bridge.html) – Most luki kompetencyjnej z łukiem i strzałką SVG.
   * [`08-ishikawa-fishbone.html`](./resources/layouts/08-ishikawa-fishbone.html) – Diagram Ishikawy z kręgosłupem i 4 żebrami SVG.
   * [`09-root-cause-funnel.html`](./resources/layouts/09-root-cause-funnel.html) – Lejek 5 Whys ze strzałką pionową penetrującą sedno.
   * [`10-vicious-cycle.html`](./resources/layouts/10-vicious-cycle.html) – Błędne koło z 4 łukowymi strzałkami obiegu SVG.
   * [`11-double-diamond.html`](./resources/layouts/11-double-diamond.html) – Podwójny diament ze strzałkami rozbieżności i zbieżności.
   * [`12-cta-next-steps.html`](./resources/layouts/12-cta-next-steps.html) – Call to Action i decyzje.
   * [`13-closing-qa.html`](./resources/layouts/13-closing-qa.html) – Zakończenie i Q&A.
   * [`14-flywheel-loop.html`](./resources/layouts/14-flywheel-loop.html) – Koło zamachowe wzrostu z zakrzywionymi strzałkami SVG.
   * [`15-chart-columns.html`](./resources/layouts/15-chart-columns.html) – Kolumny kwartalne z KPI i linią bazową.
   * [`16-chart-ranking-bars.html`](./resources/layouts/16-chart-ranking-bars.html) – Ranking poziomy z nawiasem Pareto.
   * [`17-chart-heatmap.html`](./resources/layouts/17-chart-heatmap.html) – Heatmapa produkt x okres (sezonowość).
   * [`18-chart-lines.html`](./resources/layouts/18-chart-lines.html) – Linie z etykietami bezpośrednimi i kolumną zmian.
   * [`19-cta-decision-rows.html`](./resources/layouts/19-cta-decision-rows.html) – Decyzje z liczbą-dowodem.
3. **Podejście Vector-First (Promowanie Strzałek i SVG):**
   * Agent ma obowiązek unikać nudnych list wypunktowanych, gdy treść reprezentuje proces, przyczynę, transformację, cykl lub relację.
   * Agent adaptuje współrzędne wektorów SVG (`path d="M... Q..."`, `line`, `marker-end="url(#...)"`) i osadza teksty w czystym HTML wokół nich (Text-Free SVG).
4. **Rygor Słów i Fragmenty:**
   * Ściśle 20–35 słów na slajd w formacie `<strong>Klucz:</strong> krótki wniosek (5–8 słów)`.
   * Kluczowe punkty i karty otrzymują klasę `.fragment` dla płynnego odsłaniania spacją podczas wystąpienia.

### Krok 4: Weryfikacja Wizualna (Obowiązkowa)
Po wygenerowaniu agent **renderuje i ogląda** każdy slajd, zanim odda pracę:
1. Zrzut slajdu w 1280x720 przez headless Chrome/Edge: `chrome --headless=new --window-size=1280,720 --virtual-time-budget=2000 --screenshot=out.png file:///.../index.html`. Aby zobaczyć slajd N z odsłoniętymi fragmentami, wstaw do kopii pliku tymczasowy skrypt ustawiający `.active` i `.visible`.
2. Ogląda zrzuty (np. `view_image`) i poprawia: zawijanie etykiet w jednej linii, nakładanie elementów, martwe strefy większe niż 80px, elementy dotykające stopki.
3. Usuwa pliki tymczasowe.
Bez zrzutów nie deklaruje, że slajdy są gotowe.
