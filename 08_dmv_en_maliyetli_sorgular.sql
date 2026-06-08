USE BLM4522_PerformansProjesi;
GO

SELECT TOP (10)
    qs.execution_count,
    CAST(qs.total_elapsed_time / 1000.0 AS DECIMAL(18,2)) AS ToplamSure_ms,
    CAST((qs.total_elapsed_time / NULLIF(qs.execution_count, 0)) / 1000.0 AS DECIMAL(18,2)) AS OrtalamaSure_ms,
    qs.total_logical_reads,
    qs.total_logical_writes,
    SUBSTRING
    (
        st.text,
        (qs.statement_start_offset / 2) + 1,
        (
            (
                CASE qs.statement_end_offset
                    WHEN -1 THEN DATALENGTH(st.text)
                    ELSE qs.statement_end_offset
                END
                - qs.statement_start_offset
            ) / 2
        ) + 1
    ) AS SorguMetni
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY qs.total_elapsed_time DESC;
GO
