param (
    [string]$RepoName = "",
    [string]$Visibility = "public", # "public" lub "private"
    [string]$SourceFile = "",
    [string]$CommitMessage = "Deploy presentation to GitHub Pages"
)

$ErrorActionPreference = "Stop"

Write-Host "=== [1/6] Sprawdzanie GitHub CLI (gh) i autoryzacji ===" -ForegroundColor Cyan
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "GitHub CLI (gh) nie jest zainstalowane. Zainstaluj je za pomocą: winget install GitHub.cli"
    exit 1
}

$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "Nie jesteś zalogowany do GitHub CLI. Wykonaj najpierw: gh auth login"
    exit 1
}

# Pobierz aktywną nazwę użytkownika z gh
$ghUser = (gh api user --jq ".login")
if (-not $ghUser) {
    Write-Error "Nie udało się pobrać nazwy użytkownika GitHub."
    exit 1
}
Write-Host "Zalogowany użytkownik: $ghUser" -ForegroundColor Green

# Ustal nazwę repozytorium
if (-not $RepoName) {
    $currentDirName = (Get-Item .).Name.ToLower() -replace '[^a-z0-9_-]', '-'
    $RepoName = $currentDirName
}
Write-Host "Docelowe repozytorium: $ghUser/$RepoName ($Visibility)" -ForegroundColor Cyan

Write-Host "=== [2/6] Przygotowanie pliku głównego (index.html) ===" -ForegroundColor Cyan
# Jeśli nie ma index.html, znajdź odpowiedni plik źródłowy
if (-not (Test-Path "index.html")) {
    if ($SourceFile -and (Test-Path $SourceFile)) {
        Copy-Item -Path $SourceFile -Destination "index.html" -Force
        Write-Host "Skopiowano $SourceFile -> index.html" -ForegroundColor Green
    } elseif (Test-Path ".agents/skills/html-presentation/resources/slide-template.html") {
        Copy-Item -Path ".agents/skills/html-presentation/resources/slide-template.html" -Destination "index.html" -Force
        Write-Host "Skopiowano szablon demonstracyjny -> index.html" -ForegroundColor Green
    } else {
        $htmlFiles = Get-ChildItem -Filter "*.html" -Recurse | Where-Object { $_.Name -ne "index.html" }
        if ($htmlFiles.Count -gt 0) {
            Copy-Item -Path $htmlFiles[0].FullName -Destination "index.html" -Force
            Write-Host "Skopiowano $($htmlFiles[0].Name) -> index.html" -ForegroundColor Green
        } else {
            Write-Error "Nie znaleziono pliku HTML do opublikowania jako index.html!"
            exit 1
        }
    }
} else {
    Write-Host "Plik index.html już istnieje w katalogu głównym." -ForegroundColor Green
}

# Utwórz .nojekyll aby GitHub Pages nie przetwarzało plików przez Jekyll
if (-not (Test-Path ".nojekyll")) {
    New-Item -ItemType File -Name ".nojekyll" -Force | Out-Null
    Write-Host "Utworzono plik .nojekyll (szybszy build, brak narzutu Jekyll)" -ForegroundColor Green
}

Write-Host "=== [3/6] Inicjalizacja i zatwierdzenie Git ===" -ForegroundColor Cyan
if (-not (Test-Path ".git")) {
    git init -b main
    Write-Host "Zainicjalizowano lokalne repozytorium git (gałąź main)." -ForegroundColor Green
} else {
    git branch -M main 2>$null
}

git add index.html .nojekyll README.md 2>$null
# Dodaj również assets/skills jeśli istnieją
if (Test-Path ".agents") { git add .agents 2>$null }

$gitStatus = git status --porcelain
if ($gitStatus) {
    git commit -m $CommitMessage
    Write-Host "Zatwierdzono zmiany w Git." -ForegroundColor Green
} else {
    Write-Host "Brak nowych zmian do zatwierdzenia." -ForegroundColor Yellow
}

Write-Host "=== [4/6] Tworzenie lub łączenie ze zdalnym repozytorium GitHub ===" -ForegroundColor Cyan
$repoCheck = gh repo view "$ghUser/$RepoName" 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Repozytorium nie istnieje na GitHubie. Tworzenie: $ghUser/$RepoName..." -ForegroundColor Yellow
    gh repo create "$ghUser/$RepoName" --$Visibility --source=. --remote=origin --push
    Write-Host "Utworzono repozytorium i wypchnięto gałąź main!" -ForegroundColor Green
} else {
    Write-Host "Repozytorium $ghUser/$RepoName już istnieje. Aktualizacja remote i push..." -ForegroundColor Yellow
    $remotes = git remote
    if ($remotes -notcontains "origin") {
        git remote add origin "https://github.com/$ghUser/$RepoName.git"
    }
    git push -u origin main
    Write-Host "Pomyślnie zaktualizowano gałąź main na GitHubie." -ForegroundColor Green
}

Write-Host "=== [5/6] Konfiguracja i włączanie GitHub Pages ===" -ForegroundColor Cyan
# Sprawdź czy Pages jest już włączone
$pagesInfo = gh api "repos/$ghUser/$RepoName/pages" 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Aktywacja GitHub Pages na gałęzi main (ścieżka /)..." -ForegroundColor Yellow
    $bodyJson = '{"source":{"branch":"main","path":"/"}}'
    $enableResult = $bodyJson | gh api --method POST "repos/$ghUser/$RepoName/pages" --input - 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Informacja API przy aktywacji Pages: $enableResult"
    } else {
        Write-Host "GitHub Pages zostało pomyślnie aktywowane!" -ForegroundColor Green
    }
} else {
    Write-Host "GitHub Pages jest już aktywne dla tego repozytorium." -ForegroundColor Green
}

Write-Host "=== [6/6] Podsumowanie i link do prezentacji ===" -ForegroundColor Cyan
$liveUrl = "https://$ghUser.github.io/$RepoName/"

Write-Host "`n========================================================" -ForegroundColor Green
Write-Host " PREZENTACJA ZOSTAŁA POMYŚLNIE ZDEPLOYOWANA!" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
Write-Host "Repozytorium: https://github.com/$ghUser/$RepoName" -ForegroundColor White
Write-Host "Live URL:     $liveUrl" -ForegroundColor Cyan
Write-Host "`nUwaga: Pierwszy build GitHub Pages może zająć 30-90 sekund." -ForegroundColor Yellow
Write-Host "Status buildu możesz sprawdzić poleceniem:" -ForegroundColor Gray
Write-Host "  gh api repos/$ghUser/$RepoName/pages/builds/latest`n" -ForegroundColor Gray
