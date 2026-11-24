/*
Lab 02 - procedure in DB1 reads data from DB2 (original exercise adapted).
Run as lab administrator after 00-create-demo-objects.sql.
Do NOT enable cross-database ownership chaining or TRUSTWORTHY.
*/
USE [Treinamento_Modulo02_1];
GO
CREATE OR ALTER PROCEDURE dbo.stpModulo02_4
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao FROM dbo.Modulo02;
    SELECT cod FROM [Treinamento_Modulo02_2].dbo.Modulo02_Database2;
END;
GO
GRANT EXECUTE ON OBJECT::dbo.stpModulo02_4 TO [mcruz];
GO
-- Test as mcruz before mapping and granting access in DB2.
-- EXEC dbo.stpModulo02_4;
-- The exact error may depend on current database mapping/security settings.
