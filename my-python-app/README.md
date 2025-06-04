# My Python App

## Opis
My Python App to aplikacja webowa składająca się z backendu napisanego w Pythonie oraz frontendu w JavaScript. Aplikacja umożliwia interakcję z danymi poprzez API, które zwraca dane w formacie JSON.

## Struktura projektu
```
my-python-app
├── backend
│   └── app.py
├── frontend
│   ├── public
│   │   └── index.html
│   └── src
│       └── main.js
├── requirements.txt
└── README.md
```

## Instalacja

1. Sklonuj repozytorium:
   ```
   git clone <URL_REPOZYTORIUM>
   cd my-python-app
   ```

2. Zainstaluj wymagane zależności:
   ```
   pip install -r requirements.txt
   ```

## Uruchamianie aplikacji

1. Uruchom backend:
   ```
   python backend/app.py
   ```

2. Otwórz plik `frontend/public/index.html` w przeglądarce, aby zobaczyć frontend aplikacji.

## Użycie
Frontend aplikacji odczytuje dane z backendu i wyświetla je na stronie internetowej. Możesz dostosować kod w `frontend/src/main.js`, aby zmienić sposób, w jaki dane są prezentowane.

## Wkład
Wszelkie sugestie i poprawki są mile widziane. Proszę o zgłaszanie problemów lub propozycji zmian w sekcji Issues.