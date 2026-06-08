USE BLM4522_PerformansProjesi;
GO

EXECUTE AS USER = N'performans_okuyucu_demo';

SELECT TOP (5) *
FROM dbo.Siparisler;

REVERT;
GO
