/*
Lab 02 - REVOKE removes an explicit GRANT or DENY; DENY blocks access.
Run this near the END, after earlier access tests, because it changes state.
Run with permission-administration rights in the isolated test DB only.
*/
USE [Treinamento_Modulo02_1];
GO
-- Remove a prior explicit SELECT grant, if present.
REVOKE SELECT ON OBJECT::dbo.Modulo02 FROM [mcruz];
GO
-- Restore SELECT permission temporarily for a comparison.
GRANT SELECT ON OBJECT::dbo.Modulo02 TO [mcruz];
GO
-- Explicitly deny the SELECT, overriding the direct table-level grant.
DENY SELECT ON OBJECT::dbo.Modulo02 TO [mcruz];
GO
-- Inspect the explicit DENY and test as mcruz in a separate connection.
SELECT p.name, perm.permission_name, perm.state_desc
FROM sys.database_permissions AS perm
JOIN sys.database_principals AS p ON p.principal_id=perm.grantee_principal_id
WHERE p.name=N'mcruz' AND perm.major_id = OBJECT_ID(N'dbo.Modulo02', N'U');
GO
-- Clean up the table DENY and restore the original grant when finished:
-- REVOKE SELECT ON OBJECT::dbo.Modulo02 FROM [mcruz];
-- GRANT SELECT ON OBJECT::dbo.Modulo02 TO [mcruz];
-- Note: procedures/views with the same owner may use ownership chaining;
-- a table DENY does not always predict module execution results.
