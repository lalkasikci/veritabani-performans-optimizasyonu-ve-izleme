USE BLM4522_PerformansProjesi;
GO

;WITH Sayilar AS
(
    SELECT TOP (5000)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO dbo.Musteriler (AdSoyad, Sehir, KayitTarihi, MusteriTipi)
SELECT
    CONCAT(N'Müşteri ', n),
    CASE n % 8
        WHEN 0 THEN N'İstanbul'
        WHEN 1 THEN N'Ankara'
        WHEN 2 THEN N'İzmir'
        WHEN 3 THEN N'Bursa'
        WHEN 4 THEN N'Balıkesir'
        WHEN 5 THEN N'Antalya'
        WHEN 6 THEN N'Eskişehir'
        ELSE N'Kocaeli'
    END,
    DATEADD(DAY, -(n % 2000), CAST(GETDATE() AS DATE)),
    CASE WHEN n % 5 = 0 THEN N'Kurumsal' ELSE N'Bireysel' END
FROM Sayilar;
GO

;WITH Sayilar AS
(
    SELECT TOP (100000)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO dbo.Siparisler
(
    MusteriID,
    SiparisTarihi,
    ToplamTutar,
    SiparisDurumu,
    Aciklama
)
SELECT
    ((n - 1) % 5000) + 1,
    DATEADD(HOUR, -(n % 24000), SYSDATETIME()),
    CAST(((n % 25000) + 100) / 10.0 AS DECIMAL(12,2)),
    CASE n % 5
        WHEN 0 THEN N'Tamamlandı'
        WHEN 1 THEN N'Hazırlanıyor'
        WHEN 2 THEN N'Kargoda'
        WHEN 3 THEN N'İptal'
        ELSE N'Beklemede'
    END,
    CONCAT(N'Demo sipariş açıklaması - ', n)
FROM Sayilar;
GO
