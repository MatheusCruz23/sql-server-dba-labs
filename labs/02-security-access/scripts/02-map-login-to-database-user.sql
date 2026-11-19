/*
Lab 02 — Map an existing SQL Server login to a database user.
Prerequisite: create the login [mcruz] in SSMS using a unique, strong
password. NEVER save the login password in scripts or version control.
*/

USE [master];
GO

IF SUSER_ID(N'mcruz') IS NULL
    THROW 51000, 'Create the mcruz SQL login in SSMS before running this script.', 1;
GO

USE [Treinamento_Modulo02_1];
GO

IF DATABASE_PRINCIPAL_ID(N'mcruz') IS NULL
    CREATE USER [mcruz] FOR LOGIN [mcruz];
GO

SELECT name, type_desc, authentication_type_desc
FROM sys.database_principals
WHERE name = N'mcruz';
GO
