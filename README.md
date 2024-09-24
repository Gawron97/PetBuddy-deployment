﻿# keycloak-configuration

## How to build image?

1. Copy `docker-compose.yml` and `Dockerfile` from Google Drive to this repository.

2.
```
docker build -t keycloak-petbuddy:latest .
```

3.
```
docker-compose up
```

Po odpaleniu trzeba uzupełnić konfiguracje o hasła do usług:
Podanie hasła: client_secret_google.
potrzebne do logowania/rejestrowania za pośrednictewm googla.

Instrukcja - zdjęcia odnoszą się po kolei do każdego z punktów:
wybranie odpowiedniego realma
Identity providers
google
W klient secret wklejacie zawartość: client_secret_google

----------------------------------------------------------------------------

Podanie hasła: hasło dla keycloaka do podłączenia do maila
Potrzebne do wszelkich interakcji, które skutkują wysłaniem maila przez keycloaka.

Instrukcja - zdjęcia odnoszą się po kolei do każdego z punktów:
Wybranie odpowiedniego realma
Realm settings
Email
Odznaczyc i zaznaczyc Authentication enabled, zeby pokazaly sie pola do uzupelnienia
Do password wkleić zawartość: hasło dla keycloaka do podłączenia do maila

Hasła są na dc
