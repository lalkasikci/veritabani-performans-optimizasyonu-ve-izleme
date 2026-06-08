USE BLM4522_PerformansProjesi;
GO

SELECT TOP (20)
    DB_NAME(mid.database_id) AS VeritabaniAdi,
    OBJECT_NAME(mid.object_id, mid.database_id) AS TabloAdi,
    migs.user_seeks,
    migs.avg_total_user_cost,
    migs.avg_user_impact,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM sys.dm_db_missing_index_group_stats AS migs
INNER JOIN sys.dm_db_missing_index_groups AS mig
    ON migs.group_handle = mig.index_group_handle
INNER JOIN sys.dm_db_missing_index_details AS mid
    ON mig.index_handle = mid.index_handle
WHERE mid.database_id = DB_ID()
ORDER BY migs.avg_user_impact DESC;
GO
