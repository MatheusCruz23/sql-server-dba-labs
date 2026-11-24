/*
Lab 02 - explicitly grant access to the target DB2 table for the same login.
This is a permission-oriented example, NOT cross-database ownership chaining.
Run as lab administrator after script 10.
*/
USE [Treinamento_Modulo02_2];
GO
IF SUSER_ID(N'mcruz') IS NULL
    THROW 51010, 'Create the server login mcruz before this script.', 1;
GO
IF DATABASE_PRINCIPAL_ID(N'mcruz') IS NULL
    CREATE USER [mcruz] FOR LOGIN [mcruz];
GO
GRANT SELECT ON OBJECT::dbo.Modulo02_Database2 TO [mcruz];
GO
-- Connect as mcruz to DB1 and execute dbo.stpModulo02_4.
-- Verify both result sets. If it still fails, inspect the precise error
-- and your database ownership/execution context; do not weaken server security.
