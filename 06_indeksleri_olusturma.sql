USE BLM4522_PerformansProjesi;
GO

CREATE NONCLUSTERED INDEX IX_Siparisler_Durum_Tarih
ON dbo.Siparisler (SiparisDurumu, SiparisTarihi)
INCLUDE (MusteriID, ToplamTutar);
GO

CREATE NONCLUSTERED INDEX IX_Siparisler_MusteriID
ON dbo.Siparisler (MusteriID)
INCLUDE (SiparisTarihi, ToplamTutar, SiparisDurumu);
GO
