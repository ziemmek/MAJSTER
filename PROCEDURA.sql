USE MAJSTERKLEPKA

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*=============================================
 Author:      Ziemowit Juroszek
 Create date: 2018-04-26
 Description: Total z wybranego miesi¹ca
 =============================================*/

CREATE PROCEDURE CategoryByBrand 
		@cat varchar (20) = 'Do metalu',
		@brand varchar (20) = 'MAKITA'
AS
BEGIN

    SELECT [ID_PRODUKT]
	  ,[NAZWA_PRODUKTU]
      ,[STAN]
      ,[CENA_NETTO]
      ,[CENA_BRUTTO]
      ,[INFORMACJE]
      ,[GWARANCJA]
  FROM [dbo].[PRODUKTY] p
	
	INNER JOIN DOSTAWCY d 
	ON d.ID_DOSTAWCA = p.ID_DOSTAWCA
	INNER JOIN KATEGORIA k 
	ON k.ID_KATEGORIA = p.ID_KATEGORIA

  WHERE d.NAZWA_FIRMY LIKE @brand
	AND k.NAZWA_KATEGORII LIKE @cat

END
GO

/****** 

USE [MAJSTERKLEPKA]
EXECUTE dbo.CategoryByBrand 'Do drewna', 'BOSCH';

******/