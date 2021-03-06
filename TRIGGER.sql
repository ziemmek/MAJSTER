USE [MAJSTERKLEPKA]
GO

/*=============================================
 Author:      Ziemowit Juroszek
 Create date: 2018-04-26
 Description: Informacja o braku towaru
 =============================================*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StanZero] ON [dbo].[PRODUKTY] 
	FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @stan int 
	SET @stan = (SELECT STAN  FROM inserted)

	IF (@stan = 0)
	BEGIN
		PRINT 'Stan: O' 
	END
END

/****** 

USE MAJSTERKLEPKA
UPDATE PRODUKTY
SET Stan = 0
WHERE ID_PRODUKT = 1; 

******/