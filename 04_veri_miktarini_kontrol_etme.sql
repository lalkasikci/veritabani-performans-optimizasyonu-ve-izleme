USE BLM4522_PerformansProjesi;
GO

SELECT N'Musteriler' AS TabloAdi, COUNT(*) AS KayitSayisi
FROM dbo.Musteriler
UNION ALL
SELECT N'Siparisler', COUNT(*)
FROM dbo.Siparisler;
GO
