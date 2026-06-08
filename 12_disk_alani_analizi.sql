USE BLM4522_PerformansProjesi;
GO

SELECT
    name AS DosyaAdi,
    type_desc AS DosyaTuru,
    physical_name AS FizikselKonum,
    CAST(size / 128.0 AS DECIMAL(18,2)) AS ToplamBoyut_MB,
    CAST(FILEPROPERTY(name, 'SpaceUsed') / 128.0 AS DECIMAL(18,2)) AS KullanilanAlan_MB,
    CAST((size - FILEPROPERTY(name, 'SpaceUsed')) / 128.0 AS DECIMAL(18,2)) AS BosAlan_MB
FROM sys.database_files;
GO
