# keycloak-configuration

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

1. wybranie odpowiedniego realma
2. Identity providers
3. google
4. W klient secret wklejacie zawartość: client_secret_google

----------------------------------------------------------------------------

Podanie hasła: hasło dla keycloaka do podłączenia do maila
Potrzebne do wszelkich interakcji, które skutkują wysłaniem maila przez keycloaka.

1. Wybranie odpowiedniego realma
2. Realm settings
3. Email
4. Odznaczyc i zaznaczyc Authentication enabled, zeby pokazaly sie pola do uzupelnienia
5. Do password wkleić zawartość: hasło dla keycloaka do podłączenia do maila

Hasła są na dc
