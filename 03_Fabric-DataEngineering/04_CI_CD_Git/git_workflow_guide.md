# Leitfaden für Git & CI/CD in Microsoft Fabric

**Autor:** Alexander Fritzler  
**Kontext:** Fabric Workspace Git-Integration & Versionskontrolle

---

## 1. Konzept der Git-Integration in Fabric

Microsoft Fabric synchronisiert Arbeitsbereichselemente (*Workspace Items*) direkt mit Branches in **GitHub** oder **Azure DevOps**:
* Notebooks werden als `.py` / `.ipynb` serialisiert.
* Data Pipelines werden in `pipeline-content.json` gespeichert.
* Semantikmodelle werden als `model.bim` / PBIR-Format versioniert.
* Lakehouses und Warehouses werden als Metadaten-Definitionen erfasst.

---

## 2. Standardmäßiges Umgebungsmodell (Environments)

```
[Feature Branch / Dev Workspace] 
             │
             ▼ Pull Request (Code Review)
[Master Branch / Test & Staging Workspace]
             │
             ▼ Release Pipeline (Deployment Pipeline)
[Production Workspace (F-SKU)]
```

---

## 3. Grundlegende Git-Befehle für das lokale Repository

```bash
# Status der geänderten Dateien überprüfen
git status

# Änderungen zur Bereitstellung vormerken
git add .

# Transaktions-Commit mit aussagekräftiger Nachricht erstellen
git commit -m "feat: implement incremental watermark ingestion pipeline"

# Branch mit GitHub synchronisieren
git push origin master
```
