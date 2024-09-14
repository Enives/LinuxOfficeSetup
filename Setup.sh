#!/bin/bash

# Überprüfen, ob der Benutzer Root-Rechte hat
if [ "$EUID" -ne 0 ]; then
  echo "Bitte führe das Skript als Root oder mit sudo aus."
  exit 1
fi

# Verzeichnis, in dem das Skript liegt
SCRIPT_DIR=$(dirname "$0")

# Überprüfen, ob die Datei LICENCE existiert
if [ ! -f "$SCRIPT_DIR/LICENSE" ]; then
  echo "Keine Lizenz gefunden. Bitte stelle sicher, dass sie im gleichen Verzeichnis wie das Skript vorhanden ist."
  exit 1
fi

# Name des neuen Benutzers
USERNAME="nutzer"

# Standard-Passwort für den neuen Benutzer
PASSWORD="mein_passwort"  # Hier kannst du das Standardpasswort setzen

# Neuen Benutzer ohne Passwort erstellen
useradd -m -s /bin/bash "$USERNAME"

# Überprüfen, ob der Benutzer erfolgreich erstellt wurde
if [ $? -eq 0 ]; then
  echo "Benutzer $USERNAME wurde erfolgreich erstellt."

  # Passwort für den neuen Benutzer setzen
  echo "$USERNAME:$PASSWORD" | chpasswd
  echo "Passwort für $USERNAME wurde gesetzt."

  # Verzeichnis-Pfade, die erstellt werden sollen
  DIRS=("Ordner1" "Ordner2" "Ordner3" "program")

  # Schleife durch die Liste und erstelle die Verzeichnisse
  for DIR in "${DIRS[@]}"; do
    mkdir "/home/$USERNAME/$DIR"
    echo "Verzeichnis $DIR wurde in /home/$USERNAME erstellt."
  done

  echo "Alle Verzeichnisse wurden erfolgreich erstellt."

  # Programme, die installiert werden sollen
  PROGRAMS=("vim" "git" "htop")

  # Programme installieren und in das "program"-Verzeichnis verschieben
  for PROGRAM in "${PROGRAMS[@]}"; do
    apt-get install -y "$PROGRAM"
    if [ $? -eq 0 ]; then
      echo "$PROGRAM wurde erfolgreich installiert."
      ln -s "$(which $PROGRAM)" "/home/$USERNAME/program/$PROGRAM"
      echo "$PROGRAM wurde in das /home/$USERNAME/program Verzeichnis verlinkt."
    else
      echo "Fehler beim Installieren von $PROGRAM."
    fi
  done

  echo "Alle gewünschten Programme wurden installiert und verlinkt."
else
  echo "Fehler beim Erstellen des Benutzers."
fi