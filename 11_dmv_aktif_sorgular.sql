USE BLM4522_PerformansProjesi;
GO

SELECT
    r.session_id,
    r.status,
    r.command,
    r.cpu_time,
    r.total_elapsed_time,
    r.logical_reads,
    r.writes,
    DB_NAME(r.database_id) AS VeritabaniAdi,
    st.text AS CalisanSorgu
FROM sys.dm_exec_requests AS r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS st
WHERE r.session_id <> @@SPID;
GO
