USE BLM4522_PerformansProjesi;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    s.MusteriID,
    m.AdSoyad,
    COUNT(*) AS SiparisSayisi,
    SUM(s.ToplamTutar) AS ToplamHarcama
FROM dbo.Siparisler AS s
INNER JOIN dbo.Musteriler AS m
    ON m.MusteriID = s.MusteriID
WHERE s.SiparisDurumu = N'Tamamlandı'
  AND s.SiparisTarihi >= DATEADD(MONTH, -12, SYSDATETIME())
GROUP BY s.MusteriID, m.AdSoyad
ORDER BY ToplamHarcama DESC;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
