/*
Lab 02 - allow SELECT on one table-valued function and one view.
Run as a principal permitted to GRANT these object permissions.
Then connect as mcruz and repeat the SELECT tests.
*/
USE [Treinamento_Modulo02_1];
GO
GRANT SELECT ON OBJECT::dbo.fncModulo02 TO [mcruz];
GRANT SELECT ON OBJECT::dbo.vwModulo02 TO [mcruz];
GO
-- Test AS mcruz, using a separate SSMS connection:
-- SELECT * FROM dbo.fncModulo02(1);
-- SELECT * FROM dbo.vwModulo02;
