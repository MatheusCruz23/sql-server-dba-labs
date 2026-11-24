/*
Lab 02 - stored procedures tested during the course module.
Run as lab administrator. Test EXECUTE as mcruz BEFORE script 09.
*/
USE [Treinamento_Modulo02_1];
GO
CREATE OR ALTER PROCEDURE dbo.stpModulo02
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao FROM dbo.Modulo02;
END;
GO
CREATE OR ALTER PROCEDURE dbo.stpModulo02_2
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao FROM dbo.Modulo02;
END;
GO
CREATE OR ALTER PROCEDURE dbo.stpModulo02_3
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id_Treinamento, Dt_Referencia, Ds_Observacao FROM dbo.Modulo02;
END;
GO
-- Connect as mcruz to test missing EXECUTE permission:
-- EXEC dbo.stpModulo02;
