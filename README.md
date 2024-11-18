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
DB_USERNAME=postgres
DB_PASSWORD=
KEYCLOAK_USERNAME=
KEYCLOAK_PASSWORD=
PG_ADMIN_EMAIL=
PG_ADMIN_PASSWORD=
```


### 1.2.2. .env dla `compose/keycloak_db`
```yml
# Public variables
JDBC_URL=jdbc:postgresql://database:5432/petbuddy

# App credentials
DB_USERNAME=postgres
DB_PASSWORD=
KEYCLOAK_USERNAME=
KEYCLOAK_PASSWORD=
PG_ADMIN_EMAIL=
PG_ADMIN_PASSWORD=
```

### 1.2.3 Opis zmiennych
- **`SPRING_PROFILES_ACTIVE`**  
  Określa profil środowiskowy Spring Boot (np. `prod` dla środowiska produkcyjnego). Wartość `prod` oznacza, że aplikacja działa w trybie produkcyjnym.

- **`JDBC_URL`**  
  URL do bazy danych, której używa aplikacja backendowa. Wartość `jdbc:postgresql://database:5432/petbuddy` wskazuje na bazę danych PostgreSQL, której hostname to `database`, a nazwa bazy to `petbuddy`.

- **`FIREBASE_PHOTO_DIRECTORY`**  
  Określa katalog, w którym przechowywane będą zdjęcia użytkowników w Firebase. Wartość `prod` oznacza, że zdjęcia będą przechowywane w folderze o nazwie `prod`.

- **`OPENCAGE_API_KEY`**  
  Klucz API do usługi OpenCage, wykorzystywanej do geokodowania (np. konwersji adresów na współrzędne geograficzne). Należy uzyskać klucz API z platformy OpenCage.

- **`FIREBASE_APPLICATION_CREDENTIALS`**  
  Zawartość pliku JSON z poświadczeniami aplikacji Firebase, które umożliwiają backendowi dostęp do usług Firebase. Należy wkleić pełną zawartość pliku JSON, który zawiera klucze i poświadczenia potrzebne do integracji z Firebase.

- **`KEYCLOAK_USERNAME`**  
  Nazwa użytkownika (administrator) w systemie Keycloak, który jest odpowiedzialny za zarządzanie tożsamościami użytkowników w aplikacji.

- **`KEYCLOAK_PASSWORD`**  
  Hasło do konta administratora Keycloak. To hasło umożliwia połączenie z Keycloak w celu zarządzania aplikacjami i użytkownikami.

- **`DB_USERNAME`**  
  Nazwa użytkownika bazy danych, której używa aplikacja. Należy skonfigurować odpowiedniego użytkownika w bazie danych PostgreSQL.

- **`DB_PASSWORD`**  
  Hasło do konta użytkownika bazy danych. Używane przez aplikację do łączenia się z bazą danych PostgreSQL.

- **`PG_ADMIN_EMAIL`**  
  Adres email do pgAdmin

- **`DB_PASSWORD`**  
  Hasło do pgAdmin

## 1.3. Uruchamianie aplikacji za pomocą Docker Compose

Po dodaniu pliku `.env` można użyć poniższych komend do uruchomienia aplikacji.

### 1.3.1. Pobranie najnowszych obrazów (opcjonalnie)

Jeśli chcesz pobrać najnowsze obrazy kontenerów (np. w przypadku, gdy obrazy zostały zaktualizowane w repozytorium), użyj polecenia `docker-compose pull`. Jest to opcjonalny krok, ponieważ Docker automatycznie pobierze obrazy, jeśli nie są one jeszcze dostępne lokalnie.

```bash
docker-compose pull
```

### 1.3.2. Uruchomienie aplikacji
```bash
docker-compose up
```

### 1.3.3. Uruchomienie aplikacji w tle
```bash
docker-compose up -d
```

### 1.3.4. Zatrzymanie aplikacji
```bash
docker-compose down -d
```

# 2. Konfiguracja Keycloak
## 2.1. Podłączenie adresu e-mail do Keycloak (wymagane)
Podanie hasła: hasło dla keycloaka do podłączenia do maila
Potrzebne do wszelkich interakcji, które skutkują wysłaniem maila przez keycloaka.

1. Wybranie odpowiedniego realma.
2. Realm settings.
3. Email.
4. Odznaczyc i zaznaczyc `Authentication enabled`, zeby pokazaly sie pola do uzupelnienia.
5. Do password wkleić zawartość: hasło dla keycloaka do podłączenia do maila.

## 2.2. Logowanie z Google (opcjonalne)
Po odpaleniu trzeba uzupełnić konfiguracje o hasła do usług:
Podanie hasła: `client_secret_google`.
potrzebne do logowania/rejestrowania za pośrednictewm googla.

1. wybranie odpowiedniego realma.
2. Identity providers.
3. google.
4. W klient secret wkleić zawartość: `client_secret_google`.