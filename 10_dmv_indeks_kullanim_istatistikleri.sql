USE BLM4522_PerformansProjesi;
GO

SELECT
    OBJECT_NAME(i.object_id) AS TabloAdi,
    i.name AS IndeksAdi,
    i.type_desc AS IndeksTuru,
    ISNULL(s.user_seeks, 0) AS UserSeeks,
    ISNULL(s.user_scans, 0) AS UserScans,
    ISNULL(s.user_lookups, 0) AS UserLookups,
    ISNULL(s.user_updates, 0) AS UserUpdates
FROM sys.indexes AS i
LEFT JOIN sys.dm_db_index_usage_stats AS s
    ON s.object_id = i.object_id
   AND s.index_id = i.index_id
   AND s.database_id = DB_ID()
WHERE i.object_id IN
(
    OBJECT_ID(N'dbo.Musteriler'),
    OBJECT_ID(N'dbo.Siparisler')
)
ORDER BY TabloAdi, IndeksAdi;
GO
