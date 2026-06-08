USE BLM4522_PerformansProjesi;
GO

CREATE ROLE db_performans_okuyucu;
GO

CREATE ROLE db_performans_yonetici;
GO

GRANT SELECT ON dbo.Musteriler TO db_performans_okuyucu;
GRANT SELECT ON dbo.Siparisler TO db_performans_okuyucu;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Musteriler TO db_performans_yonetici;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Siparisler TO db_performans_yonetici;
GO

CREATE USER performans_okuyucu_demo WITHOUT LOGIN;
GO

CREATE USER performans_yonetici_demo WITHOUT LOGIN;
GO

ALTER ROLE db_performans_okuyucu ADD MEMBER performans_okuyucu_demo;
ALTER ROLE db_performans_yonetici ADD MEMBER performans_yonetici_demo;
GO
