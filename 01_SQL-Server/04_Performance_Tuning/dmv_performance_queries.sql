-- ==============================================================================
-- Zweck:    Performance-Diagnose via Dynamic Management Views (DMVs)
-- Kontext:  T-SQL / Performance Tuning / DMVs
-- Autor:    Alexander Fritzler
-- ==============================================================================

-- 1. Suche nach aktuell ausgeführten ressourcenintensiven Abfragen
SELECT 
    r.session_id,
    r.status,
    r.cpu_time,
    r.total_elapsed_time,
    r.logical_reads,
    r.wait_type,
    SUBSTRING(t.text, (r.statement_start_offset/2)+1,
        (((CASE r.statement_end_offset
            WHEN -1 THEN DATALENGTH(t.text)
            ELSE r.statement_end_offset
        END) - r.statement_start_offset)/2) + 1) AS StatementText,
    p.query_plan
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
CROSS APPLY sys.dm_exec_query_plan(r.plan_handle) p
WHERE r.session_id <> @@SPID;

-- 2. Top-10 der ressourcenintensivsten Abfragen nach kumulierter CPU-Zeit
SELECT TOP 10
    qs.total_worker_time AS Total_CPU_Time,
    qs.execution_count,
    qs.total_worker_time / qs.execution_count AS Avg_CPU_Time,
    qs.total_elapsed_time / qs.execution_count AS Avg_Duration,
    qs.total_logical_reads / qs.execution_count AS Avg_Logical_Reads,
    SUBSTRING(st.text, (qs.statement_start_offset/2)+1,
        (((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(st.text)
            ELSE qs.statement_end_offset
        END) - qs.statement_start_offset)/2) + 1) AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_worker_time DESC;
