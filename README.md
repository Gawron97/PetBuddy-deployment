# PetBuddy Deployment

Welcome to the **PetBuddy Deployment**, a utilities repository with files and hints for launching the PetBuddy app, that consists of these repositories:
- [PetBuddy-Backend](https://github.com/Gawron97/petBuddy-backend)
- [PetBuddy-Frontend](https://github.com/Daarkosss/petBuddy-frontend)

The repository contains the docker-compose.yml files for launching either the whole PetBuddy app or just the dependencies for PetBuddy-Backend.
---

## Table of Contents
1. [Launching the Dependencies for PetBuddy-Backend](#launching-the-dependencies-for-petbuddy-backend)
2. [Launching the Whole PetBuddy App](#launching-the-whole-petbuddy-app)
3. [Variable Descriptions](#variable-descriptions)
4. [Configuring Keycloak](#configuring-keycloak)

---
## Launching the dependencies for PetBuddy-Backend

### Preparing the .env file

The project requires the following environment variables to be set in .env file:
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

### Place the .env file in the correct directory

```bash
mv .env ./PetBuddy-deployment/compose/keycloak_db
```

### Run the docker-compose.yml file

```bash
docker compose -f ./PetBuddy-deployment/compose/keycloak_db/docker-compose.yml up
```

## Launching the whole PetBuddy app

### Preparing the .env file

The project requires the following environment variables to be set in .env file:
```yml
# Public variables
SPRING_PROFILES_ACTIVE=prod
JDBC_URL=jdbc:postgresql://database:5432/petbuddy
FIREBASE_PHOTO_DIRECTORY=prod

# API keys
OPENCAGE_API_KEY=
FIREBASE_APPLICATION_CREDENTIALS= 

# App credentials (can be customized)
DB_USERNAME=postgres
DB_PASSWORD=postgres
KEYCLOAK_USERNAME=admin
KEYCLOAK_PASSWORD=admin
PG_ADMIN_EMAIL=admin
PG_ADMIN_PASSWORD=admin
```

### Place the .env file in the correct directory

```bash
mv .env ./PetBuddy-deployment/compose/app
```

### Run the docker-compose.yml file

```bash
docker compose -f ./PetBuddy-deployment/compose/app/docker-compose.yml up
```

---

### Variable Descriptions

- **`SPRING_PROFILES_ACTIVE`**  
  Specifies the Spring Boot environment profile (e.g., `prod` for the production environment). The value `prod` means that the application runs in production mode.

- **`JDBC_URL`**  
  The URL for the database used by the backend application. The value `jdbc:postgresql://database:5432/petbuddy` points to a PostgreSQL database with the hostname `database` and the name `petbuddy`.

- **`FIREBASE_PHOTO_DIRECTORY`**  
  Defines the directory where user photos will be stored in Firebase. The value `prod` indicates that photos will be stored in a folder named `prod`.

- **`OPENCAGE_API_KEY`**  
  API key for the OpenCage service, used for geocoding (e.g., converting addresses into geographic coordinates). You need to obtain an API key from the OpenCage platform.

- **`FIREBASE_APPLICATION_CREDENTIALS`**  
  The content of a JSON file with Firebase application credentials, enabling the backend to access Firebase services. Paste the full content of the JSON file, which contains keys and credentials needed for Firebase integration.

- **`KEYCLOAK_USERNAME`**  
  The username (administrator) in the Keycloak system, responsible for managing user identities within the application.

- **`KEYCLOAK_PASSWORD`**  
  The password for the Keycloak admin account. This password allows connection to Keycloak to manage applications and users.

- **`DB_USERNAME`**  
  The username for the database used by the application. You must configure the appropriate user in the PostgreSQL database.

- **`DB_PASSWORD`**  
  The password for the database user account. Used by the application to connect to the PostgreSQL database.

- **`PG_ADMIN_EMAIL`**  
  The email address for pgAdmin.

- **`PG_ADMIN_PASSWORD`**  
  The password for pgAdmin.

---

## Configuring Keycloak

### Connecting an Email Address to Keycloak (Required)
You need to provide a password for Keycloak to connect to an email account. This is necessary for any interactions that involve sending emails via Keycloak.

1. Select the appropriate realm.
2. Go to **Realm Settings**.
3. Navigate to the **Email** tab.
4. Uncheck and then recheck `Authentication Enabled` to display the fields for configuration.
5. Paste the email connection password for Keycloak into the **Password** field.

### Login via Google configuration (Optional)
After starting the application, complete the configuration by adding the required credentials for Google services. This is necessary for login/registration via Google.

1. Select the appropriate realm.
2. Go to **Identity Providers**.
3. Choose **Google**.
4. Paste the content of `client_secret_google` into the **Client Secret** field.