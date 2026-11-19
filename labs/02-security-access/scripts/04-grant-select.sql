/*
Lab 02 — Grant the minimum permission needed to read the demo table.
Run as an administrator after observing permission error 229 when
connected as mcruz.
Prerequisites: dbo.Modulo02 exists and the database user mcruz is mapped.
*/

USE [Treinamento_Modulo02_1];
GO

IF OBJECT_ID(N'dbo.Modulo02', N'U') IS NULL
    THROW 51001, 'Create and populate dbo.Modulo02 before granting SELECT.', 1;
GO

GRANT SELECT ON OBJECT::dbo.Modulo02 TO [mcruz];
GO

SELECT
    USER_NAME(grantee_principal_id) AS grantee,
    permission_name,
    state_desc
FROM sys.database_permissions
WHERE major_id = OBJECT_ID(N'dbo.Modulo02', N'U')
  AND USER_NAME(grantee_principal_id) = N'mcruz';
GO
