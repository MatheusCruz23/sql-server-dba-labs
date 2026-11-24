/*
Lab 02 - objects studied: an inline table-valued function and a view.
Run as lab administrator. CREATE OR ALTER uses the SQL Server 2022+ syntax.
The GO separators ensure each CREATE OR ALTER statement starts its batch.
*/
USE [Treinamento_Modulo02_1];
GO
CREATE OR ALTER FUNCTION dbo.fncModulo02 (@Id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao
    FROM dbo.Modulo02
    WHERE Id_Treinamento = @Id
);
GO
CREATE OR ALTER VIEW dbo.vwModulo02
AS
SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao
FROM dbo.Modulo02;
GO
-- As mcruz, test both SELECT statements BEFORE running script 07.
-- SELECT * FROM dbo.fncModulo02(1);
-- SELECT * FROM dbo.vwModulo02;
