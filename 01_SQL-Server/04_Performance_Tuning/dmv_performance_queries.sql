-- ============================================================================
-- Назначение: Диагностика производительности через динамические системные представления (DMV)
-- Контекст:   T-SQL / Performance Tuning / DMVs
-- Автор:      Alexander Fritzler
-- ============================================================================

-- 1. Поиск выполняющихся в данный момент тяжелых запросов
SELECT 
    r.session_id,
    r.status,
    r.start_time,
    r.command,
    r.cpu_time,
    r.total_elapsed_time,
    r.wait_type,
    r.wait_time,
    SUBSTRING(t.text, (r.statement_start_offset/2)+1,
        (((CASE r.statement_end_offset
            WHEN -1 THEN DATALENGTH(t.text)
            ELSE r.statement_end_offset
        END - r.statement_start_offset)/2) + 1)) AS ExecutingSQLText
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
WHERE r.session_id > 50;

-- 2. Топ-10 самых ресурсоемких запросов по суммарному CPU
SELECT TOP 10
    qs.total_worker_time AS TotalCPU_ms,
    qs.execution_count,
    qs.total_worker_time / qs.execution_count AS AvgCPU_ms,
    qs.total_elapsed_time / qs.execution_count AS AvgDuration_ms,
    SUBSTRING(st.text, (qs.statement_start_offset/2)+1, 
        ((CASE qs.statement_end_offset 
            WHEN -1 THEN DATALENGTH(st.text) 
            ELSE qs.statement_end_offset 
        END - qs.statement_start_offset)/2) + 1) AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_worker_time DESC;
