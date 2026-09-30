# 01. Microsoft SQL Server & T-SQL Repository

Репозиторий практических скриптов, процедур и оптимизации запросов для Microsoft SQL Server.

---

## 📌 Быстрый доступ к официальной документации и инструментам

* **Справочник T-SQL:** [Microsoft T-SQL Language Reference](https://learn.microsoft.com/sql/t-sql/language-reference) — официальный справочник операторов, системных функций и типов данных.
* **Набор скриптов диагностики:** [Brent Ozar First Responder Kit](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit) — готовые проверенные процедуры (`sp_Blitz`, `sp_WhoIsActive`, `sp_BlitzCache`) для выявления «узких мест» и зависших запросов.
* **Учебная база данных:** [AdventureWorks Sample DB Releases](https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks) — стандарт де-факто для отработки сложных `JOIN`, `GROUP BY`, оконных функций и индексирования.

---

## 📂 Структура папок

* `01_DQL_Queries/` — наборы аналитических `SELECT`-запросов, обобщенные табличные выражения (`WITH CTE`), оконные функции (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, скользящие средние).
* `02_DDL_DML_Scripts/` — создание и модификация таблиц (`CREATE TABLE`), представлений (`VIEW`), ограничений (`PRIMARY KEY`, `FOREIGN KEY`), кластеризованных и некластеризованных индексов.
* `03_StoredProcedures/` — хранимые процедуры (`CREATE PROCEDURE`) с транзакциями (`BEGIN TRAN / COMMIT`), перехватом ошибок (`TRY / CATCH`) и параметрами.
* `04_Performance_Tuning/` — скрипты анализа планов выполнения (Execution Plans), диагностические DMV-запросы (`sys.dm_exec_requests`, `sys.dm_os_wait_stats`).

---

## 💡 Стандарт оформления сниппета

Каждый новый скрипт в репозитории предваряется заголовком:
```sql
-- ============================================================================
-- Назначение: [Краткое описание бизнес-задачи]
-- Контекст:   [T-SQL / DQL / Stored Procedure / Window Function]
-- Автор:      Alexander Fritzler
-- Дата:       YYYY-MM-DD
-- ============================================================================
```
