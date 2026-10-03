# 03. Microsoft Fabric (Data Engineer Associate - DP-600 / DP-700)

Lösungsarchitekturen und Code-Vorlagen für die einheitliche Analytics-Plattform Microsoft Fabric: Data Factory, Lakehouse (PySpark), Warehouse (T-SQL) und OneLake.

---

## 📌 Zertifizierung & Microsoft Learn Pfade

* **Prüfungsleitfaden DP-600:** [Exam DP-600: Implementing Analytics Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-600/) — Microsoft Certified Fabric Analytics Engineer.
* **Prüfungsleitfaden DP-700:** [Exam DP-700: Implementing Data Engineering Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-700/) — Kernprüfung für Microsoft Fabric Data Engineers.
* **Offizielle Microsoft Fabric Lernpfade:** [Microsoft Fabric Learn Paths](https://learn.microsoft.com/training/paths/get-started-fabric/) — Interaktive Trainings und Labs.
* **Medallion Architektur-Muster:** [Microsoft Fabric Medallion Architecture](https://learn.microsoft.com/fabric/get-started/medallion-architecture) — Schichtenmodell: Bronze (Raw) $\rightarrow$ Silver (Cleansed) $\rightarrow$ Gold (Curated Star Schema).

---

## 📂 Verzeichnisstruktur

* `01_Ingestion_DataFactory/` — Data Pipelines, Copy Activities (Full Load & inkrementelles Laden via Watermark), Dataflows Gen2.
* `02_Notebooks_PySpark/` — PySpark Vorlagen für Bereinigung, Delta Lake Wartung (`OPTIMIZE ZORDER`) und Time Travel.
* `03_DataWarehouse_SQL/` — T-SQL Skripte für Fabric Warehouse: CTAS (`CREATE TABLE AS SELECT`), Stored Procedures und Cross-Database Abfragen über OneLake.
* `04_CI_CD_Git/` — Workspace-Synchronisation mit GitHub / Azure DevOps, Release-Pipelines und Versionskontrolle.
