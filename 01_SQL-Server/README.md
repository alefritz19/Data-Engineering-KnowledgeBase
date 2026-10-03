# 01. Microsoft SQL Server & T-SQL Repository

Praktische Skripte, relationale Abfragen, Stored Procedures und Performance-Tuning für Microsoft SQL Server.

---

## 📌 Offizielle Dokumentation & Werkzeuge

* **T-SQL Sprachreferenz:** [Microsoft T-SQL Language Reference](https://learn.microsoft.com/sql/t-sql/language-reference) — Offizielle Dokumentation zu Operatoren, Datentypen und Funktionen.
* **Diagnose- und Health-Check-Kit:** [Brent Ozar First Responder Kit](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit) — Industriestandard-Prozeduren (`sp_Blitz`, `sp_WhoIsActive`, `sp_BlitzCache`).
* **Trainingsdatenbank:** [AdventureWorks Sample DB Releases](https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks) — De-facto-Standard zur Übung von Joins, Aggregationen und Window Functions.

---

## 📂 Verzeichnisstruktur

* `01_DQL_Queries/` — Analytische `SELECT`-Abfragen, Common Table Expressions (`WITH CTE`), Fensterfunktionen (`ROW_NUMBER`, `DENSE_RANK`, gleitende Durchschnitte).
* `02_DDL_DML_Scripts/` — Tabellenerstellung (`CREATE TABLE`), Views, Constraints (`PK`, `FK`), Clustered/Non-Clustered Indizes.
* `03_StoredProcedures/` — Gespeicherte Prozeduren (`CREATE PROCEDURE`) mit Transaktionssicherheit (`BEGIN TRAN / COMMIT`) und Fehlerbehandlung (`TRY / CATCH`).
* `04_Performance_Tuning/` — Analyse von Ausführungsplänen (Execution Plans), DMV-Diagnoseabfragen (`sys.dm_exec_requests`, `sys.dm_os_wait_stats`).

---

## 💡 Snippet-Standard

Jedes Skript im Repository folgt folgendem einheitlichen Header:
```sql
-- ============================================================================
-- Zweck:       [Kurze Beschreibung der Anforderung]
-- Kontext:     [T-SQL / DQL / Stored Procedure / Window Function]
-- Entwickler:  Alexander Fritzler
-- ============================================================================
```
