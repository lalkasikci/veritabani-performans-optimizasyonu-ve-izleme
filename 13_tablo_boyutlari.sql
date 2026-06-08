USE BLM4522_PerformansProjesi;
GO

SELECT
    t.name AS TabloAdi,
    SUM(p.rows) AS SatirSayisi,
    CAST(SUM(a.total_pages) * 8.0 / 1024 AS DECIMAL(18,2)) AS ToplamAlan_MB,
    CAST(SUM(a.used_pages) * 8.0 / 1024 AS DECIMAL(18,2)) AS KullanilanAlan_MB,
    CAST(SUM(a.data_pages) * 8.0 / 1024 AS DECIMAL(18,2)) AS VeriAlani_MB
FROM sys.tables AS t
INNER JOIN sys.indexes AS i
    ON t.object_id = i.object_id
INNER JOIN sys.partitions AS p
    ON i.object_id = p.object_id
   AND i.index_id = p.index_id
INNER JOIN sys.allocation_units AS a
    ON p.partition_id = a.container_id
GROUP BY t.name
ORDER BY ToplamAlan_MB DESC;
GO
