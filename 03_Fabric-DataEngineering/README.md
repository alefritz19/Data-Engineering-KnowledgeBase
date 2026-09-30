# 03. Microsoft Fabric (Data Engineer Associate - DP-600 / DP-700)

Репозиторий решений на базе единой аналитической SaaS-платформы Microsoft Fabric: Data Factory, Lakehouse (PySpark), Warehouse (T-SQL) и OneLake.

---

## 📌 Быстрый доступ к официальным материалам подготовки и сертификации

* **Программа экзамена DP-600:** [Exam DP-600: Implementing Analytics Solutions Using Microsoft Fabric](https://learn.microsoft.com/credentials/certifications/exams/dp-600/) — сертификация Fabric Analytics Engineer.
* **Программа экзамена DP-700:** [Exam DP-700: Implementing Data Engineering Solutions Using Microsoft Fabric](https://learn.microsoft.com/credentials/certifications/exams/dp-700/) — профильный экзамен инженера данных Fabric.
* **Бесплатные официальные курсы Microsoft:** [Microsoft Fabric Learn Paths](https://learn.microsoft.com/training/paths/get-started-fabric/) — интерактивные обучающие модули и практические песочницы.
* **Архитектурный стандарт Medallion:** [Microsoft Fabric Medallion Architecture](https://learn.microsoft.com/fabric/get-started/medallion-architecture) — организация данных по слоям Bronze (Raw) $\rightarrow$ Silver (Cleansed) $\rightarrow$ Gold (Curated Star Schema).

---

## 📂 Структура папок

* `01_Ingestion_DataFactory/` — конвейеры данных (Pipelines), Copy Activity (полная и инкрементальная загрузка по Watermark), Dataflows Gen2.
* `02_Notebooks_PySpark/` — шаблоны PySpark-блокнотов для очистки, джойнов, Delta-оптимизации (`OPTIMIZE ZORDER`) и Time Travel.
* `03_DataWarehouse_SQL/` — T-SQL скрипты для витрин данных Fabric Warehouse, CTAS (`CREATE TABLE AS SELECT`), хранимые процедуры и кросс-запросы.
* `04_CI_CD_Git/` — интеграция Fabric Workspaces с GitHub / Azure DevOps, версионирование кода и деплой через Deployment Pipelines.
