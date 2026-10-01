# System Motywów Wizualnych (CSS Theme Palettes)

Szablon prezentacji wykorzystuje zmienne CSS zdefiniowane w bloku `:root` oraz w dedykowanych klasach motywów (`[data-theme="..."]`). Dzięki temu przełączenie stylu wizualnego całej prezentacji wymaga jedynie zmiany jednego atrybutu w elemencie `<body>` lub `#deck-wrapper`.

Dostępne są 4 oficjalne motywy korporacyjne: **TTPSC** (domyślny), **PwC**, **CyberArk** oraz **Palo Alto Networks**.

---

## 1. Dostępne Motywy

### A. Transition Technologies PSC (`data-theme="ttpsc"`) – [Domyślny]
Oficjalna tożsamość wizualna Transition Technologies PSC: Kreatywna Purpura, Klasyczny Wrzos, Płaski Róż oraz Nowoczesna Zieleń i Strategiczna Szarość z fontem Montserrat.

```css
:root, [data-theme="ttpsc"] {
  --font-main: 'Montserrat', Arial, sans-serif;
  --font-fallback: 'Avenir Next LT Pro', Arial, sans-serif;

  /* Kolory tła */
  --bg-dark: #2B0D30;           /* Ciemna purpura bazowa dla wariantu dark */
  --bg-dark-card: #3D1344;
  --bg-light: #FBF7FB;          /* Rozbielony odcień bazowany na Klasycznym Wrzosie */
  --bg-white: #FFFFFF;

  /* Typografia / Teksty */
  --text-dark: #1F1F1F;
  --text-muted: #6B7280;
  --text-light: #FFFFFF;
  --text-light-muted: #D9D9D9;  /* Strategiczna Szarość */

  /* Główne kolory marki TTPSC */
  --primary: #7B2D85;           /* Kreatywna Purpura */
  --primary-light: #ECD3ED;     /* Klasyczny Wrzos */
  --accent: #D03A8C;            /* Płaski Róż */
  --accent-light: #FBE6F1;

  /* Kolory funkcyjne / Akcentowe */
  --success: #64B237;           /* Nowoczesna Zieleń */
  --success-light: #EFF8EB;
  --danger: #E11D48;
  --danger-light: #FFF1F2;
  --warning: #F59E0B;
  --warning-light: #FEF3C7;

  /* Obramowania i linie */
  --border-light: #D9D9D9;      /* Strategiczna Szarość */
  --border-dark: #4A1A52;

  /* Dodatkowe gradienty marki */
  --primary-gradient: linear-gradient(135deg, #7B2D85 0%, #D03A8C 100%);
}
```

---

### B. PwC (`data-theme="pwc"`)
Oficjalna tożsamość wizualna PwC. Charakterystyczny pomarańcz (PwC Signature Orange), ciepły bursztyn/tangerine, głęboki antracyt i ciepła alabastrowa biel.

```css
[data-theme="pwc"] {
  --font-main: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --bg-dark: #1E1E1E;        /* PwC Charcoal / Deep Black */
  --bg-dark-card: #2B2B2B;
  --bg-light: #FAF9F6;       /* PwC Clean Warm White */
  --bg-white: #FFFFFF;
  --text-dark: #1E1E1E;
  --text-muted: #666666;
  --text-light: #FFFFFF;
  --text-light-muted: #B3B3B3;
  --primary: #D04A02;        /* PwC Signature Orange */
  --primary-light: #FFF3EB;
  --accent: #EB8C00;         /* PwC Tangerine / Gold */
  --accent-light: #FEF7ED;
  --success: #107C41;
  --success-light: #F0FDF4;
  --danger: #E0301E;         /* PwC Crimson Red */
  --danger-light: #FFF1F2;
  --warning: #FFB600;        /* PwC Warm Yellow */
  --warning-light: #FEF9C3;
  --border-light: #E5E0D8;
  --border-dark: #333333;
}
```

---

### C. CyberArk (`data-theme="cyberark"`)
Wizualny styl lidera bezpieczeństwa tożsamości cyfrowej CyberArk. Elektryczny błękit kobaltowy, krystaliczny cyjan, głęboki granat cybersecurity i chłodne jasne tła.

```css
[data-theme="cyberark"] {
  --font-main: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --bg-dark: #00122A;        /* Deep Cyber Security Navy */
  --bg-dark-card: #081E3D;
  --bg-light: #F3F6FA;       /* Chłodna biel techniczna */
  --bg-white: #FFFFFF;
  --text-dark: #071529;
  --text-muted: #51627B;
  --text-light: #FFFFFF;
  --text-light-muted: #8EA3BF;
  --primary: #0066CC;        /* CyberArk Electric Cobalt */
  --primary-light: #EDF5FF;
  --accent: #00B4D8;         /* CyberArk Bright Cyan */
  --accent-light: #E6F8FB;
  --success: #059669;
  --success-light: #ECFDF5;
  --danger: #E4002B;         /* CyberArk Alert Red */
  --danger-light: #FFF1F2;
  --warning: #D97706;
  --warning-light: #FEF3C7;
  --border-light: #D6E0EC;
  --border-dark: #0C2B54;
}
```

---

### D. Palo Alto Networks (`data-theme="paloalto"`)
Styl globalnego lidera cyberbezpieczeństwa Palo Alto Networks. Dynamiczny neonowy Cyber Orange (#FA582D), cyjan chmurowy Prisma Cloud (#00C0F3) i grafitowa czerń Obsidian.

```css
[data-theme="paloalto"] {
  --font-main: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --bg-dark: #0F141C;        /* Palo Alto Obsidian Charcoal */
  --bg-dark-card: #181F2C;
  --bg-light: #F4F6F8;       /* Slate Clean White */
  --bg-white: #FFFFFF;
  --text-dark: #12161F;
  --text-muted: #556275;
  --text-light: #FFFFFF;
  --text-light-muted: #9BA7B7;
  --primary: #FA582D;        /* PANW Cyber Orange */
  --primary-light: #FFF0EB;
  --accent: #00C0F3;         /* PANW Cloud Cyan */
  --accent-light: #E6F9FE;
  --success: #10B981;
  --success-light: #ECFDF5;
  --danger: #E11D48;
  --danger-light: #FFF1F2;
  --warning: #F59E0B;
  --warning-light: #FEF3C7;
  --border-light: #DCE1E7;
  --border-dark: #222B3D;
}
```

---

## 2. Jak Przełączać Motyw

W pliku HTML ustaw atrybut w tagu `<body>`:
```html
<!-- Transition Technologies PSC (Domyślny): -->
<body data-theme="ttpsc">

<!-- PwC: -->
<body data-theme="pwc">

<!-- CyberArk: -->
<body data-theme="cyberark">

<!-- Palo Alto Networks: -->
<body data-theme="paloalto">
```

Wszystkie wykresy SVG, tła kart i typografia automatycznie dziedziczą wartości zdefiniowane w zmiennych `var(--primary)`, `var(--bg-light)`, `var(--text-dark)` itp.

Prelegent może również w dowolnej chwili:
* Wcisnąć przycisk **◑** na dolnym pasku nawigacji, by cyklicznie przełączać motywy w czasie rzeczywistym.
* Wcisnąć skrót **Alt + A**, by wybrać motyw z listy lub dostosować kolory w Panelu Administratora.
