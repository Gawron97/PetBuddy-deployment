DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_database WHERE datname = 'petbuddy'
    ) THEN
        CREATE DATABASE petbuddy;
    END IF;
END
$$;

\connect petbuddy;

CREATE SCHEMA IF NOT EXISTS keycloak AUTHORIZATION postgres;

