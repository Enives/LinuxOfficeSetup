# LinuxOfficeSetup
### **. Datei überprüfen**

1.  **Datei anzeigen**: Um sicherzustellen, dass der Inhalt korrekt ist oder um Änderungen vorzunehmen, kannst du die Datei mit einem Texteditor öffnen. Verwende z. B. `nano`:
```
 nano Setup.sh
```

**Inhalt anpassen**: Wenn du den Benutzernamen, Programme oder Verzeichnisse ändern möchtest, passe den Inhalt des Skripts entsprechend an. Du kannst z. B. den Benutzernamen in der Zeile ändern:
```
USERNAME="neuer_benutzer"
```

Und die Programme, die installiert werden sollen, unter:

```
PROGRAMS=("vim" "git" "htop")
```

- Anstelle von `vim`, `git` und `htop` kannst du die Namen der gewünschten Programme hinzufügen.
    
- **Speichern**: Nach Änderungen in `nano`:
    
    - Drücke `CTRL + O`, dann `Enter`, um zu speichern.
    - Drücke `CTRL + X`, um den Editor zu verlassen.

### **Skript ausführen**

Um das Skript auszuführen, geh wie folgt vor:

1. **Als Root oder mit sudo ausführen**: Du musst das Skript mit Administratorrechten ausführen, damit es Benutzer erstellen und Programme installieren kann. Führe folgenden Befehl aus:

```
sudo ./Setup.sh
```

**Verlauf der Ausführung überwachen**: Das Skript zeigt dir an, ob die Erstellung des Benutzers, der Verzeichnisse und die Installation der Programme erfolgreich war. Achte auf Fehlermeldungen, falls z. B. ein Programm nicht verfügbar ist oder der Benutzername bereits existiert.