FROM quay.io/keycloak/keycloak:23.0.0

COPY realm-export.json /opt/keycloak/data/import/
COPY petBuddy-theme /opt/keycloak/themes/petBuddy-theme

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm"]
