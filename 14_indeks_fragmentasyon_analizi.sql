USE BLM4522_PerformansProjesi;
GO

SELECT
    OBJECT_NAME(ips.object_id) AS TabloAdi,
    i.name AS IndeksAdi,
    ips.index_type_desc,
    ips.page_count,
    CAST(ips.avg_fragmentation_in_percent AS DECIMAL(10,2)) AS ParcalanmaYuzdesi,
    CAST(ips.avg_page_space_used_in_percent AS DECIMAL(10,2)) AS SayfaDolulukYuzdesi
FROM sys.dm_db_index_physical_stats
(
    DB_ID(),
    OBJECT_ID(N'dbo.Siparisler'),
    NULL,
    NULL,
    'DETAILED'
) AS ips
INNER JOIN sys.indexes AS i
    ON ips.object_id = i.object_id
   AND ips.index_id = i.index_id
ORDER BY ips.avg_fragmentation_in_percent DESC;
GO
