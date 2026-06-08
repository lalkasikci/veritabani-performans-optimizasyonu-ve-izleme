USE BLM4522_PerformansProjesi;
GO

ALTER INDEX IX_Siparisler_Durum_Tarih
ON dbo.Siparisler
REORGANIZE;
GO
