USE MAJSTERKLEPKA

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID (N'dbo.MonthTotal', N'IF') IS NOT NULL
	DROP FUNCTION dbo.MonthTotal;
GO

/*=============================================
 Author:      Ziemowit Juroszek
 Create date: 2018-04-26
 Description: Total z wybranego miesi¹ca
 =============================================*/


CREATE FUNCTION dbo.MonthTotal (@month int)

RETURNS INT

AS
BEGIN
	DECLARE @totalvalue int;
	SELECT @totalvalue = SUM(p.CENA_NETTO * zs.ILOSC) 
    FROM dbo.[ZAMOWIENIE_SZ] AS zs  
		INNER JOIN ZAMOWIENIA AS z
		 ON z.ID_ZAMOWIENIE = zs.ID_ZAMOWIENIE
		INNER JOIN PRODUKTY AS p
		 ON p.ID_PRODUKT = zs.ID_PRODUKT
 	
	WHERE MONTH(z.CZAS)=@month;
	
	IF (@totalvalue is NULL)
		SET @totalvalue = 0;

    RETURN @totalvalue;
END
GO

/****** 

USE [MAJSTERKLEPKA]
GO
SELECT [dbo].[MonthTotal] (02)
GO

******/