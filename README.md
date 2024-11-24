# Robo Projekt

Hilfsdateien für das Robo-Projekt.

## Linux Mint Provisionierung

Mit dem folgenden Befehl kann eine Linux Mint Installation provisioniert
werden. Es werden notwendige Bilbiotheken installiert und ein Image erstellt,
das über LTSP ausgerollt wird.

    curl https://raw.githubusercontent.com/tbs1-bo/robo/refs/heads/main/mint_provision.sh | bash


## Raspberry Pi

Der folgende Befehl provisioniert einen Raspberry.

    curl https://raw.githubusercontent.com/tbs1-bo/robo/refs/heads/main/rpi_provision.sh | bash
