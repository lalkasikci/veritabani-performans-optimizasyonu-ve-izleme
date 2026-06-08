USE BLM4522_PerformansProjesi;
GO

IF OBJECT_ID(N'dbo.Siparisler', N'U') IS NOT NULL DROP TABLE dbo.Siparisler;
IF OBJECT_ID(N'dbo.Musteriler', N'U') IS NOT NULL DROP TABLE dbo.Musteriler;
GO

CREATE TABLE dbo.Musteriler
(
    MusteriID        INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad          NVARCHAR(120) NOT NULL,
    Sehir            NVARCHAR(60) NOT NULL,
    KayitTarihi      DATE NOT NULL,
    MusteriTipi      NVARCHAR(20) NOT NULL
);
GO

CREATE TABLE dbo.Siparisler
(
    SiparisID        BIGINT IDENTITY(1,1) PRIMARY KEY,
    MusteriID        INT NOT NULL,
    SiparisTarihi    DATETIME2(0) NOT NULL,
    ToplamTutar      DECIMAL(12,2) NOT NULL,
    SiparisDurumu    NVARCHAR(30) NOT NULL,
    Aciklama         NVARCHAR(250) NULL,
    CONSTRAINT FK_Siparisler_Musteriler
        FOREIGN KEY (MusteriID) REFERENCES dbo.Musteriler(MusteriID)
);
GO
