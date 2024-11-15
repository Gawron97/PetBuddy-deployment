# 1. Uruchamianie PetBuddy

## 1.1. Pliki konfiguracyjne
Repozytorium posiada dwie aplikacje:

- **Folder `compose/app`** (backend, frontend, baza danych, Keycloak)
- **Folder `compose/keycloak_db`** (Keycloak i baza danych)

W zależności od wyboru aplikacji do uruchomienia, następne kroki należy wykonać w ramach wybranego folderu.

## 1.2. Przygotowanie środowiska

Aby poprawnie uruchomić aplikację, należy przygotować plik konfiguracyjny `.env` w odpowiednich folderach, które zawierają konfigurację Docker Compose dla różnych części aplikacji. W szczególności:

### 1.2.1. .env dla `compose/app`:
```yml
# Public variables
SPRING_PROFILES_ACTIVE=prod
JDBC_URL=jdbc:postgresql://database:5432/petbuddy
FIREBASE_PHOTO_DIRECTORY=prod

# API keys
OPENCAGE_API_KEY=
FIREBASE_APPLICATION_CREDENTIALS= 

# App credentials
KEYCLOAK_USERNAME=
KEYCLOAK_PASSWORD=
DB_USERNAME=
DB_PASSWORD=
```


### 1.2.2. .env dla `compose/keycloak_db`
```yml
# Public variables
JDBC_URL=jdbc:postgresql://database:5432/petbuddy

# App credentials
KEYCLOAK_USERNAME=
KEYCLOAK_PASSWORD=
DB_USERNAME=
DB_PASSWORD=
```

## 2.1. Uruchamianie aplikacji za pomocą Docker Compose

Po dodaniu pliku `.env` można użyć poniższych komend do uruchomienia aplikacji.

### 2.1.1. Pobranie najnowszych obrazów (opcjonalnie)

Jeśli chcesz pobrać najnowsze obrazy kontenerów (np. w przypadku, gdy obrazy zostały zaktualizowane w repozytorium), użyj polecenia `docker-compose pull`. Jest to opcjonalny krok, ponieważ Docker automatycznie pobierze obrazy, jeśli nie są one jeszcze dostępne lokalnie.

```bash
docker-compose pull
```

### 2.1.2. Uruchomienie aplikacji
```bash
docker-compose up
```

### 2.1.3. Uruchomienie aplikacji w tle
```bash
docker-compose up -d
```


### 2.1.4. Zatrzymanie aplikacji
```bash
docker-compose down -d
```

# 2. Konfiguracja Keycloak

## 2.1 Podłączenie adresu e-mail do Keycloak (wymagane)
Podanie hasła: hasło dla keycloaka do podłączenia do maila
Potrzebne do wszelkich interakcji, które skutkują wysłaniem maila przez keycloaka.

1. Wybranie odpowiedniego realma.
2. Realm settings.
3. Email.
4. Odznaczyc i zaznaczyc `Authentication enabled`, zeby pokazaly sie pola do uzupelnienia.
5. Do password wkleić zawartość: hasło dla keycloaka do podłączenia do maila.

## 2.2 Logowanie z Google (opcjonalne)
Po odpaleniu trzeba uzupełnić konfiguracje o hasła do usług:
Podanie hasła: `client_secret_google`.
potrzebne do logowania/rejestrowania za pośrednictewm googla.

1. wybranie odpowiedniego realma.
2. Identity providers.
3. google.
4. W klient secret wkleić zawartość: `client_secret_google`.