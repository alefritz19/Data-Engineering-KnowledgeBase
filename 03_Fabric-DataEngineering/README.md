# 03. Microsoft Fabric (Data Engineer Associate - DP-600 / DP-700)

Lösungsarchitekturen und Code-Vorlagen für die einheitliche Analytics-Plattform Microsoft Fabric: Data Factory, Lakehouse (PySpark), Warehouse (T-SQL) und OneLake.

---

## 📌 Zertifizierung & Microsoft Learn Pfade

* **Prüfungsleitfaden DP-600:** [Exam DP-600: Implementing Analytics Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-600/) — Microsoft Certified Fabric Analytics Engineer.
* **Prüfungsleitfaden DP-700:** [Exam DP-700: Implementing Data Engineering Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-700/) — Kernprüfung für Microsoft Fabric Data Engineers.
* **Offizielle Microsoft Fabric Lernpfade:** [Microsoft Fabric Learn Paths](https://learn.microsoft.com/training/paths/get-started-fabric/) — Interaktive Trainings und Labs.
* **Medallion Architektur-Muster:** [Microsoft Fabric Medallion Architecture](https://learn.microsoft.com/fabric/get-started/medallion-architecture) — Schichtenmodell: Bronze (Raw) $\rightarrow$ Silver (Cleansed) $\rightarrow$ Gold (Curated Star Schema).

---

## 🌟 Flaggschiff-Projekt: End-to-End Supermarkt Medallion Showcase

* 👉 **[`01_Medallion_Supermarkt_DP700/`](01_Medallion_Supermarkt_DP700/README.md)** — **Vollständiges End-to-End Projekt von On-Premises bis Power BI Direct Lake:**
  * **Schritt 1:** Workspace `DP700_Supermarkt_Practice` (Fabric Trial)
  * **Schritt 2:** Ingestion & Lakehouse `lh_bronze` (6 Roh-Tabellen via Gateway)
  * **Schritt 3:** PySpark Transformation `nb_bronze_to_silver_supermarkt` & Star Schema in `lh_silver` (Delta Lake + Z-Order)
  * **Schritt 4:** Zero-Copy OneLake Schema Shortcut in `lh_gold` (0 MB Speicherverbrauch!)
  * **Schritt 5:** Orchestrierung per Data Factory Pipeline `pl_run_daily_supermarkt_etl`
  * **Schritt 6:** Fabric Warehouse `wh_analytics` (CTAS Datamart & Stored Procedure `usp_Refresh_Kategorie_Summary`)
  * **Schritt 7:** Direct Lake Semantikmodell `sm_supermarkt_sales` (DAX Measures: `Total_Umsatz`, `Total_Menge`)
  * **Schritt 8:** Power BI Executive Dashboard `rpt_supermarkt_management_dashboard` (KPIs, Matrix, Säulendiagramm, Treemap, Wasserfall)

---

## 📂 Weitere Fachbereiche & Vorlagen

* `01_Ingestion_DataFactory/` — Data Pipelines, Copy Activities (Full Load & inkrementelles Laden via Watermark), Dataflows Gen2.
* `02_Notebooks_PySpark/` — PySpark Vorlagen für Bereinigung, Delta Lake Wartung (`OPTIMIZE ZORDER`) und Time Travel.
* `03_DataWarehouse_SQL/` — T-SQL Skripte für Fabric Warehouse: CTAS (`CREATE TABLE AS SELECT`), Stored Procedures und Cross-Database Abfragen über OneLake.
* `04_CI_CD_Git/` — Workspace-Synchronisation mit GitHub / Azure DevOps, Release-Pipelines und Versionskontrolle.
