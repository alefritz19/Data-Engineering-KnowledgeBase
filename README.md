# Data Engineering Knowledge Base & Code Repository

Zentrale Wissensdatenbank, Best Practices und produktionsreife Vorlagen für Microsoft Data Analytics & Engineering (Microsoft SQL Server, Power BI & Microsoft Fabric).

---

## 🏛️ Repository-Struktur

```
Data-Engineering-KnowledgeBase/
├── 00_Guides_and_CheatSheets/     # Umfassende Master-Guides & PDF-Handbücher (DP-700, PySpark)
├── 01_SQL-Server/                 # T-SQL: DQL, DDL, Stored Procedures, Performance Tuning
│   ├── 01_DQL_Queries/            # CTEs, Window Functions (Moving Averages, Ranking, Dedup)
│   ├── 02_DDL_DML_Scripts/        # Tabellen, Constraints, Indizes, Views
│   ├── 03_StoredProcedures/       # Prozeduren mit Transaktionen (BEGIN TRAN / COMMIT, TRY/CATCH)
│   └── 04_Performance_Tuning/     # DMV-Abfragen, Ausführungspläne, Index-Optimierung
├── 02_Power-BI/                   # Power Query (M), DAX Measures, Datenmodellierung
│   ├── 01_PowerQuery_M/           # Kalender-Generatoren und Datenbereinigungsskripte (M)
│   ├── 02_DAX_Measures/           # Time Intelligence (YTD, YoY Growth, Moving Average), KPIs
│   ├── 03_DataModels/             # Sternschema (Star Schema Best Practices, 1:n Beziehungen)
│   └── 04_Templates/              # Standardisierte Unternehmens-Farbpaletten (JSON)
└── 03_Fabric-DataEngineering/     # Microsoft Fabric (DP-600 & DP-700)
    ├── 01_Ingestion_DataFactory/  # Data Pipelines, inkrementelles Laden (Watermark / Delta Load)
    ├── 02_Notebooks_PySpark/      # PySpark Notebooks (Bronze -> Silver -> Gold), Z-Order
    ├── 03_DataWarehouse_SQL/      # Fabric DW: T-SQL Cross-Database Queries, CTAS, Stored Procedures
    └── 04_CI_CD_Git/              # Workspace Git-Integration (Azure DevOps / GitHub)
```

---

## 🔗 Schnallzugriff auf offizielle Dokumentationen & Standards

### 1. Microsoft SQL Server & T-SQL
* [Microsoft T-SQL Language Reference](https://learn.microsoft.com/sql/t-sql/language-reference) — Offizielle Sprachreferenz, Datentypen und Systemfunktionen.
* [Brent Ozar First Responder Kit](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit) — Skriptsammlung zur Diagnose und Performance-Optimierung (`sp_Blitz`, `sp_WhoIsActive`).
* [AdventureWorks Sample DB](https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks) — Standard-Beispieldatenbank für relationale Abfragen und Indexierung.

### 2. Power BI & DAX / Power Query (M)
* [DAX Guide (SQLBI)](https://dax.guide/) — Vollständige DAX-Referenz von Marco Russo und Alberto Ferrari mit Ausführungsplänen und Filterkontext-Details.
* [DAX Patterns](https://www.daxpatterns.com/) — Getestete Muster für Time Intelligence, kumulative Summen und ABC-Analysen.
* [Power Query M Language Reference](https://learn.microsoft.com/powerquery-m/) — Dokumentation der M-Formelsprache für ETL-Prozesse.

### 3. Microsoft Fabric (Zertifizierung DP-600 & DP-700)
* [Exam DP-600: Implementing Analytics Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-600/) — Zertifizierung zum Fabric Analytics Engineer.
* [Exam DP-700: Implementing Data Engineering Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-700/) — Kernprüfung für Fabric Data Engineers.
* [Microsoft Fabric Official Learn Paths](https://learn.microsoft.com/training/paths/get-started-fabric/) — Interaktive Lernmodule und Hands-on Labs.
* [Fabric Medallion Architecture](https://learn.microsoft.com/fabric/get-started/medallion-architecture) — Referenzarchitektur für Lakehouses: Bronze (Raw) $\rightarrow$ Silver (Cleansed) $\rightarrow$ Gold (Curated).

---

## 🚀 Lokales interaktives Portal
Öffne die Datei **`index.html`** in einem beliebigen Browser, um eine grafische Schnellstart-Übersicht aller lokalen Vorlagen und offiziellen Dokumente zu erhalten.
