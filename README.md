# Data Engineering Knowledge Base & Code Repository

Единая база знаний, архитектурных шаблонов и практических решений дата-инженера (Microsoft SQL Server, Power BI & Microsoft Fabric).

---

## 🏛️ Структура репозитория

```
Data-Engineering-KnowledgeBase/
├── 00_Guides_and_CheatSheets/     # Готовые PDF и HTML руководства (DP-700, PySpark Cookbook)
├── 01_SQL-Server/                 # T-SQL, DQL, DDL, Stored Procedures, Performance Tuning
│   ├── 01_DQL_Queries/            # CTE, Window Functions, скользящие средние
│   ├── 02_DDL_DML_Scripts/        # Таблицы, ключи, индексы, представления (VIEW)
│   ├── 03_StoredProcedures/       # Процедуры с транзакциями (BEGIN TRAN/COMMIT)
│   └── 04_Performance_Tuning/     # Мониторинг DMV, анализ медленных запросов
├── 02_Power-BI/                   # Power Query (M), DAX меры, модели данных
│   ├── 01_PowerQuery_M/           # Скрипты генерации календаря и чистки
│   ├── 02_DAX_Measures/           # Time Intelligence (YTD, YoY), KPI, Moving Avg
│   ├── 03_DataModels/             # Архитектура Star Schema, правила связей
│   └── 04_Templates/              # Корпоративные цветовые палитры и шаблоны
└── 03_Fabric-DataEngineering/     # Microsoft Fabric (DP-600 / DP-700)
    ├── 01_Ingestion_DataFactory/  # Пайплайны, инкрементальная загрузка (Watermark)
    ├── 02_Notebooks_PySpark/      # PySpark блокноты (Bronze -> Silver -> Gold), Z-Order
    ├── 03_DataWarehouse_SQL/      # Fabric DW, кросс-запросы, CTAS, процедуры
    └── 04_CI_CD_Git/              # Интеграция с GitHub / Azure DevOps, версионирование
```

---

## 🔗 Быстрые ссылки на официальные ресурсы и справочники

### 1. Microsoft SQL Server
* [Microsoft T-SQL Language Reference](https://learn.microsoft.com/sql/t-sql/language-reference) — официальный синтаксис и типы данных.
* [Brent Ozar First Responder Kit](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit) — скрипты диагностики (`sp_Blitz`, `sp_WhoIsActive`).
* [AdventureWorks Sample DB](https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks) — учебная реляционная база.

### 2. Power BI & DAX
* [DAX Guide (SQLBI)](https://dax.guide/) — полный справочник по функциям DAX от Марко Руссо и Альберто Феррари.
* [DAX Patterns](https://www.daxpatterns.com/) — готовые выверенные шаблоны формул DAX.
* [Power Query M Language Reference](https://learn.microsoft.com/powerquery-m/) — документация по формулам языка M.

### 3. Microsoft Fabric (DP-600 & DP-700)
* [Exam DP-600: Implementing Analytics Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-600/) — сертификация Fabric Analytics Engineer.
* [Exam DP-700: Implementing Data Engineering Solutions](https://learn.microsoft.com/credentials/certifications/exams/dp-700/) — сертификация Fabric Data Engineer.
* [Microsoft Fabric Official Learn Paths](https://learn.microsoft.com/training/paths/get-started-fabric/) — бесплатные курсы и практические модули Microsoft.
* [Fabric Medallion Architecture](https://learn.microsoft.com/fabric/get-started/medallion-architecture) — эталонная архитектура озер данных Bronze $\rightarrow$ Silver $\rightarrow$ Gold.

---

## 🚀 Локальный интерактивный портал
В корне репозитория находится файл **`index.html`** — открой его в любом браузере, чтобы получить быстрый кликабельный доступ ко всем локальным файлам и внешним документам.
