USE BLM4522_PerformansProjesi;
GO

EXECUTE AS USER = N'performans_okuyucu_demo';

BEGIN TRY
    DELETE FROM dbo.Siparisler
    WHERE SiparisID = -1;
END TRY
BEGIN CATCH
    SELECT
        N'Beklenen hata: okuyucu rolünün DELETE yetkisi yoktur.' AS Aciklama,
        ERROR_MESSAGE() AS HataMesaji;
END CATCH;

REVERT;
GO
